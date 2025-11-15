return {
    "rebelot/heirline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
        local conditions = require("heirline.conditions")
        local utils = require("heirline.utils")

        -----------------------------------------------------------------------
        --  COLORS
        -----------------------------------------------------------------------
        local colors = {
            bg     = utils.get_highlight("Normal").bg,
            fg     = utils.get_highlight("Normal").fg,
            red    = utils.get_highlight("DiagnosticError").fg,
            orange = utils.get_highlight("DiagnosticWarn").fg,
            yellow = utils.get_highlight("DiagnosticHint").fg,
            green  = utils.get_highlight("String").fg,
            blue   = utils.get_highlight("Function").fg,
            purple = utils.get_highlight("Statement").fg,
        }

        -----------------------------------------------------------------------
        --  MODE COMPONENT (left side like DOOM)
        -----------------------------------------------------------------------
        local ViMode = {
            init = function(self)
                self.mode = vim.fn.mode(1)
            end,

            static = {
                mode_names = {
                    n = "NORMAL",
                    no = "O-PENDING",
                    v = "VISUAL",
                    V = "V-LINE",
                    ["\22"] = "V-BLOCK",
                    s = "SELECT",
                    S = "S-LINE",
                    ["\19"] = "S-BLOCK",
                    i = "INSERT",
                    ic = "INSERT",
                    R = "REPLACE",
                    Rv = "V-REPLACE",
                    c = "COMMAND",
                    cv = "EX",
                    ce = "EX",
                    r = "PROMPT",
                    rm = "MORE",
                    ["r?"] = "CONFIRM",
                    ["!"] = "SHELL",
                    t = "TERMINAL",
                },
                mode_colors = {
                    n = "blue",
                    i = "green",
                    v = "purple",
                    V = "purple",
                    ["\22"] = "purple",
                    c = "orange",
                    r = "red",
                    R = "red",
                }
            },

            provider = function(self)
                return "  " .. self.mode_names[self.mode] .. "  "
            end,

            hl = function(self)
                local color = self.mode_colors[self.mode] or "fg"
                return { fg = colors.bg, bg = colors[color], bold = true }
            end,
        }

        -----------------------------------------------------------------------
        --  FILE NAME + FLAGS (doom style)
        -----------------------------------------------------------------------
        local FileNameBlock = {
            init = function(self)
                self.filename = vim.api.nvim_buf_get_name(0)
            end,

            { provider = " " },

            {
                provider = function(self)
                    local filename = vim.fn.fnamemodify(self.filename, ":t")
                    return filename ~= "" and filename or "[No Name]"
                end,
                hl = { fg = colors.fg, bold = true },
            },


            {
                condition = function()
                    return vim.bo.modified
                end,
                provider = "[+]",
                hl = { fg = colors.yellow },
            },

            {
                condition = function()
                    return not vim.bo.modifiable or vim.bo.readonly
                end,
                provider = "[RO]",
                hl = { fg = colors.red },
            },

            { provider = "  " },
        }

        -----------------------------------------------------------------------
        --  GIT (branch name)
        -----------------------------------------------------------------------
        local Git = {
            condition = conditions.is_git_repo,

            init = function(self)
                self.status = vim.b.gitsigns_status_dict
            end,

            {
                provider = function(self)
                    return " " .. self.status.head .. " "
                end,
                hl = { fg = colors.orange },
            },
        }

        -----------------------------------------------------------------------
        --  DIAGNOSTICS
        -----------------------------------------------------------------------
        local Diagnostics = {
            condition = conditions.has_diagnostics,

            static = {
                error_icon = " ",
                warn_icon  = " ",
                info_icon  = " ",
                hint_icon  = " ",
            },

            init = function(self)
                self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
                self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
                self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
                self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
            end,

            {
                provider = function(self)
                    if self.errors > 0 then return self.error_icon .. self.errors .. " " end
                    return ""
                end,
                hl = { fg = colors.red },
            },
            {
                provider = function(self)
                    if self.warnings > 0 then return self.warn_icon .. self.warnings .. " " end
                    return ""
                end,
                hl = { fg = colors.orange },
            },
            {
                provider = function(self)
                    if self.info > 0 then return self.info_icon .. self.info .. " " end
                    return ""
                end,
                hl = { fg = colors.blue },
            },
            {
                provider = function(self)
                    if self.hints > 0 then return self.hint_icon .. self.hints .. " " end
                    return ""
                end,
                hl = { fg = colors.yellow },
            },
        }

        -----------------------------------------------------------------------
        --  RIGHT SIDE: POSITION INFO (line, column, percentage)
        -----------------------------------------------------------------------
        local Ruler = {
            provider = "  %l:%c  ",
            hl = { fg = colors.blue, bold = true },
        }

        local Percent = {
            provider = "  %p%%  ",
            hl = { fg = colors.purple },
        }

        -----------------------------------------------------------------------
        -- TERMINAL
        -----------------------------------------------------------------------
        local Terminal = {
            condition = function() return vim.bo.buftype == "terminal" end,
            provider = "  Terminal ",
            hl = { fg = colors.green, bold = true },
        }

        -----------------------------------------------------------------------
        --  FULL STATUSLINE 
        --  -----------------------------------------------------------------------
        local StatusLine = {
            ViMode,
            FileNameBlock,
            Terminal,
            Git,
            Diagnostics,

            -- spacer to push right side
            { provider = "%=" },

            Percent,
            Ruler,
        }

        require("heirline").setup({
            statusline = StatusLine,
        })
    end,
}

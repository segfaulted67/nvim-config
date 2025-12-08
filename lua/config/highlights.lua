local palette = {
    yellow     = "#F6C177",
    red        = "#EB6F92",
    blue       = "#9CCFD8",
    text_dark  = "#777777",
    purple     = "#DDB6F2",
    orange     = "#FFB86C",
    cyan       = "#8BE9FD",
    pink       = "#FF79C6",
    visual_bg  = "#3a3a3a",
    float_bg   = "#0A0A0A",
    status_bg  = "#111111",
    yank_bg    = "#0000FF",
    yank_fg    = "#000000",
}

vim.api.nvim_set_hl(0, "Comment",   { fg = palette.text_dark })
vim.api.nvim_set_hl(0, "String",    { fg = palette.yellow })
vim.api.nvim_set_hl(0, "Directory", { fg = palette.blue })
vim.api.nvim_set_hl(0, "Visual",    { bg = palette.visual_bg })

vim.api.nvim_set_hl(0, "Function", { fg = palette.blue, bold = true })
vim.api.nvim_set_hl(0, "Keyword",  { fg = palette.red, italic = true })
vim.api.nvim_set_hl(0, "Type",     { fg = palette.yellow })
vim.api.nvim_set_hl(0, "Constant", { fg = palette.purple })

vim.api.nvim_set_hl(0, "Conditional", { fg = palette.orange, italic = true })  -- if / else
vim.api.nvim_set_hl(0, "Repeat",      { fg = palette.cyan, italic = true })    -- do / while / for
vim.api.nvim_set_hl(0, "Statement",   { fg = palette.pink, bold = true })      -- return / break

vim.api.nvim_set_hl(0, "Include", { fg = palette.red, bold = true })
vim.api.nvim_set_hl(0, "Define",  { fg = palette.purple, bold = true })
vim.api.nvim_set_hl(0, "PreProc", { fg = palette.red, italic = true })
vim.api.nvim_set_hl(0, "Macro",   { fg = palette.purple })

vim.api.nvim_set_hl(0, "NormalFloat", { bg = palette.float_bg })


-- Leaderkeys.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Performance.
vim.opt.updatecount = 0
vim.opt.updatetime = 0
vim.opt.timeout = false
vim.opt.ttimeoutlen = 0
vim.opt.autowrite = true
vim.opt.lazyredraw = true
vim.opt.showcmd = false
vim.opt.shelltemp = false

-- Undo/backup.
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.shada = "'20,<1000,s1000"
vim.opt.shada = { "!", "'1000", "<50", "s10", "h" }

-- Encoding.
vim.opt.fileformat = "unix"
vim.opt.fileencoding = "utf-8"
vim.opt.foldenable = false

-- Indentation.
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = false
vim.opt.breakindent = true

-- UI.
vim.opt.wrap = false
vim.opt.smoothscroll = true
vim.opt.guicursor = ""
vim.opt.wildoptions = "fuzzy"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.number = true
vim.opt.signcolumn = "number"
vim.opt.pumheight = 10
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.splitkeep = "topline"
vim.opt.listchars = { space = "*", trail = "*", nbsp = "*", extends = ">", precedes = "<", tab = "|>" }
vim.opt.completeopt = { "menu", "noselect", "noinsert", "fuzzy" }

-- Status line.
vim.opt.laststatus = 0
-- vim.opt.rulerformat = "%40(%=%#ModeMsg#%.50F %(%m %)[%{&ft!=''?&ft:'none'}] %l:%c%V %p%%%)"
vim.opt.rulerformat = "%40(%=%50F %(%m %)[%{&ft!=''?&ft:'none'}] %l:%c%V %p%%%)"
vim.opt.shortmess = { a = true, o = true, O = true, t = true, T = true, I = true, c = true, C = true }

-- vim.g.python_recommended_style = 0
-- vim.g.markdown_recommended_style = 0
-- vim.g.zig_recommended_style = 0
vim.g.zig_fmt_autosave = false
vim.g.zig_fmt_parse_errors = false
vim.g.c_syntax_for_h = true

-- Diagnostic details.
vim.diagnostic.config({
    signs = true,
    underline = false,
    virtual_text = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        focusable = true,
        style = "minimal",
        border = "single",
        source = "always",
        header = "",
    },
})

-- Documentation window.
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "single",
    title = "",
})

-- Signature help.
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "single",
    title = "",
})

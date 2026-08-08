local indent_size = 2

vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 25
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 0
vim.g.netrw_altfile = 1
vim.g.netrw_hide = 0
-- vim.g.netrw_keepdir = 0

vim.o.number = true
vim.o.relativenumber = true
vim.o.completeopt = "menuone,noinsert,fuzzy"
vim.o.tabstop = indent_size
vim.o.shiftwidth = indent_size
vim.o.softtabstop = indent_size
vim.o.laststatus = 3
vim.o.wrap = false

vim.cmd.colorscheme("carbonfox")

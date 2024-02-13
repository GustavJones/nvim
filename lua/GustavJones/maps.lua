vim.g.mapleader = " "
vim.opt.timeout = true
vim.opt.timeoutlen = 150

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.keymap.set("n", "<leader>e", function()
    vim.cmd.Neotree("toggle")
end)

local Savefunc = function()
    vim.cmd.write()
    vim.cmd.stopinsert()
end

vim.keymap.set("n", "<C-h>", function() vim.cmd.wincmd("h") end)
vim.keymap.set("i", "<C-h>", function() vim.cmd.wincmd("h") end)
vim.keymap.set("n", "<C-j>", function() vim.cmd.wincmd("j") end)
vim.keymap.set("i", "<C-j>", function() vim.cmd.wincmd("j") end)
vim.keymap.set("n", "<C-k>", function() vim.cmd.wincmd("k") end)
vim.keymap.set("i", "<C-k>", function() vim.cmd.wincmd("k") end)
vim.keymap.set("n", "<C-l>", function() vim.cmd.wincmd("l") end)
vim.keymap.set("i", "<C-l>", function() vim.cmd.wincmd("l") end)

vim.keymap.set("n", "<M-k", function() vim.cmd.wincmd("+") end)
vim.keymap.set("n", "<M-j>", function() vim.cmd.wincmd("-") end)

vim.keymap.set("n", "<M-m>", function() vim.cmd.wincmd("_") end)
vim.keymap.set("n", "<M-n>", function() vim.cmd.wincmd("|") end)

vim.keymap.set("n", "<M-h>", function() vim.cmd.wincmd("<") end)
vim.keymap.set("n", "<M-l>", function() vim.cmd.wincmd(">") end)

vim.keymap.set("t", "<C-h>", function() vim.cmd.wincmd("h") end)
vim.keymap.set("t", "<C-j>", function() vim.cmd.wincmd("j") end)
vim.keymap.set("t", "<C-k>", function() vim.cmd.wincmd("k") end)
vim.keymap.set("t", "<C-l>", function() vim.cmd.wincmd("l") end)

vim.keymap.set("t", "<M-k", function() vim.cmd.wincmd("+") end)
vim.keymap.set("t", "<M-j>", function() vim.cmd.wincmd("-") end)

vim.keymap.set("t", "<M-m>", function() vim.cmd.wincmd("_") end)
vim.keymap.set("t", "<M-n>", function() vim.cmd.wincmd("|") end)

vim.keymap.set("t", "<M-h>", function() vim.cmd.wincmd("<") end)
vim.keymap.set("t", "<M-l>", function() vim.cmd.wincmd(">") end)



vim.keymap.set("n", "<C-d>", function() vim.cmd.LspZeroFormat() end)
vim.keymap.set("n", "<leader>gg", function()
    vim.cmd.Lazy("load lazygit.nvim")
    vim.cmd.LazyGit()
end)

vim.keymap.set("n", "<leader>tc", function()
    vim.cmd.Lazy("load telescope.nvim")
    vim.cmd.Telescope("colorscheme")
end)

vim.keymap.set("n", "<leader>tb", function()
    vim.cmd.Lazy("load telescope.nvim")
    vim.cmd.Telescope("buffers")
end)

vim.keymap.set("n", "<leader>to", function()
    vim.cmd.Lazy("load telescope.nvim")
    vim.cmd.Telescope("vim_options")
end)

vim.keymap.set("n", "<leader>tt", function()
    vim.cmd.Lazy("load telescope.nvim")
    vim.cmd.Telescope()
end)

vim.keymap.set("n", "<leader>bd", function()
    vim.cmd.bdelete()
end)

vim.keymap.set("n", "<leader>bh", function()
    vim.cmd.bprevious()
end)

vim.keymap.set("n", "<leader>bl", function()
    vim.cmd.bnext()
end)

vim.keymap.set("n", "<leader>bi", function()
    vim.cmd.LspInfo()
end)

vim.keymap.set("t", "<C-t>", function()
    vim.cmd.ToggleTerm()
end)

vim.keymap.set("n", "<C-t>", function()
    vim.cmd.ToggleTerm("direction=horizontal")
end)

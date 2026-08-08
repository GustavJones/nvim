vim.keymap.set("n", "<leader>e", ":Explore " .. vim.fn.getcwd() .. "\r", { silent = true })

vim.keymap.set("n", "<leader>t", function()
	local bufID = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_win_set_buf(0, bufID)
	vim.bo.bufhidden = 'delete'
	vim.bo.modifiable = false

	vim.cmd.terminal()
	vim.bo.buflisted = false
end)

vim.keymap.set("n", "<leader>g", function()
	local bufID = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_win_set_buf(0, bufID)
	vim.bo.bufhidden = 'delete'
	vim.bo.buflisted = false

	vim.fn.jobstart({ "lazygit", "-p", vim.fn.getcwd() }, { term = true })
	vim.cmd("startinsert")
end)

vim.keymap.set("i", "<C-Space>", function() vim.lsp.completion.get() end, { silent = true })

vim.keymap.set("t", "<ESC><ESC>", "<C-\\><C-n>")

vim.keymap.set("n", "<leader>,", ":buffer ")

vim.keymap.set("n", "<leader>/", ":nohlsearch\r", { silent = true })

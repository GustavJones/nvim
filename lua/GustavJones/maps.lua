local terminal = {
	buf = 0,
	job = 0,
	win = 0
}

---Toggles a floating terminal and returns if it is visible
---@return boolean
local function toggle_floating_terminal()
	local functions = require("GustavJones.functions")

	if not (vim.api.nvim_buf_is_valid(terminal.buf) and vim.fn.jobwait({ terminal.job }, 0)[1] == -1) then
		local creation_output = functions.create_terminal_buffer({vim.o.shell})

		terminal.buf = creation_output.buf
		terminal.job = creation_output.job
	end

	if terminal.win == 0 or not vim.api.nvim_win_is_valid(terminal.win) then
		terminal.win = functions.create_floating_window(terminal.buf)
		return true
	else
		vim.api.nvim_win_close(terminal.win, true)
		terminal.win = 0
		return false
	end
end


-- Use '-' to go a directory back and 'gn' to go to directory under cursor.
vim.keymap.set("n", "<leader>e", ":Explore " .. vim.fn.getcwd() .. "\r", { silent = true })

vim.keymap.set({"n", "t"}, "<C-t>", function()
	if toggle_floating_terminal() then
		vim.cmd("startinsert")
	end
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

vim.keymap.set("t", "<C-`>", "<C-\\><C-n>")

vim.keymap.set("n", "<leader>,", ":buffer ")

vim.keymap.set("n", "<leader>/", ":nohlsearch\r", { silent = true })

local M = {}

---Add a path to the Neovim Runtime Path (RTP).
---@param path string
function M.add_path_to_runtime_path(path)
	vim.o.rtp = vim.o.rtp .. "," .. path
end

---Return the absolute path of a subdirectory in the config directory.
---@param subdir string 
---@return string 
function M.get_config_subdirectory(subdir)
	return vim.fs.joinpath(vim.fn.stdpath("config"), subdir)
end

---Open a terminal in the provided buffer and return the Job ID.
---@param buf integer
---@param cmd string[]
---@return integer
function M.open_terminal_in_buf(buf, cmd)
	local original = vim.api.nvim_get_current_buf();
	vim.api.nvim_set_current_buf(buf);
	local jobID = vim.fn.jobstart(cmd, { term = true})
	vim.api.nvim_set_current_buf(original)

	return jobID
end

---Create a hidden terminal buffer in the background and return the buffer ID and job ID.
---@param cmd string[]
---@return { buf : integer, job : integer }
function M.create_terminal_buffer(cmd)
	local buf = vim.api.nvim_create_buf(false, true)
	local jobID = M.open_terminal_in_buf(buf, cmd)
	vim.api.nvim_buf_set_name(buf, "Terminal")

	vim.b[buf].swapfile = false

	return { buf = buf, job = jobID}
end

---Create a floating window
---@param buf integer
---@param win_config? vim.api.keyset.win_config
---@return integer
function M.create_floating_window(buf, win_config)
	local width = vim.o.columns - math.floor(vim.o.columns * 0.1)
	local height = vim.o.lines - math.floor(vim.o.lines * 0.1)

	local config = win_config or {
		relative = "win",
		width = width,
		height = height,
		row = (vim.o.lines - height) / 2 - (vim.o.lines - height) / 4,
		col = (vim.o.columns - width) / 2,
		style = "minimal",
		border = "single"
	}

	return vim.api.nvim_open_win(buf, true, config)
end

return M

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

return M

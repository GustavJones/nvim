local M = {}

---Add a path to the Neovim Runtime Path (RTP).
---@param path string
function M.AddPathToRuntimePath(path)
	vim.o.rtp = vim.o.rtp .. "," .. path
end

---Return the absolute path of a subdirectory in the config directory.
---@param subdir any
---@return unknown
function M.GetConfigSubdirectory(subdir)
	return vim.fn.stdpath("config").."/"..subdir
end

return M

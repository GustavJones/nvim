return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  config = function()
	  require("bufferline").setup({
		options = {
			mode = "buffers",
			seperator_style = "slant",
		}
	  })
end,
}

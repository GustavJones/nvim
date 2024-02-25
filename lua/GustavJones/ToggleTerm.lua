return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function ()
    vim.keymap.set("n", "<C-t>", ":ToggleTerm<CR>", {noremap = true, silent = true, desc = "Toggle Terminal"})
    vim.keymap.set("t", "<C-t>", function () vim.cmd.ToggleTerm() end, {noremap = true, silent = true, desc = "Toggle Terminal"})

    require("toggleterm").setup(
    {
      direction = "float",
    }
    )
  end
}

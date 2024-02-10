return {
  { "ellisonleao/gruvbox.nvim" },
  { "EdenEast/nightfox.nvim" },

  {
    "olivercederborg/poimandres.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("poimandres").setup({
        -- leave this setup function empty for default config
        -- or refer to the configuration section
        -- for configuration options
      })
    end,
  },

  {
    "maxmx03/solarized.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = "dark" -- or 'light'
    end,
  },

  {
    "ayu-theme/ayu-vim",
  },

  {
    "liuchengxu/space-vim-dark",
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "carbonfox",
    },
  },
}

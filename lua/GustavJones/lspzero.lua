require("luasnip.loaders.from_vscode").lazy_load()

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr })
  lsp_zero.buffer_autoformat()
end)

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({ ensure_installed = { "clangd", "lua_ls", "stylua", "selene", "luacheck", "luaformatter", "cmake-language-server", "cmakelang" }, })
require('mason-lspconfig').setup({
  ensure_installed = { "clangd", "lua_ls", "cmake" },
  handlers = {
    lsp_zero.default_setup,
  },
})

local cmp = require('cmp')
local cmp_format = require("lsp-zero").cmp_format()
local cmp_action = require("lsp-zero").cmp_action()

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({ select = false }),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),

    -- Scroll up and down in the completion documentation
    ['<C-n'] = cmp.mapping.scroll_docs(-4),
    ['<C-m>'] = cmp.mapping.scroll_docs(4),

    ['<C-o>'] = cmp.mapping.open_docs(),
    ['<C-p'] = cmp.mapping.close_docs(),
  }),
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "nvim_lsp_signature_help" },
  },
  formatting = cmp_format
})

--require("dap").set_log_level("info")

require("dapui").setup()
require("nvim-dap-virtual-text").setup()
require("mason-nvim-dap").setup({
  ensure_installed = { 'stylua', 'jq', 'codelldb' },
  handlers = {}
})

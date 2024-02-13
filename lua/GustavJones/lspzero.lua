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

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
    },
    formatting = cmp_format
})

require("luasnip.loaders.from_vscode").lazy_load()

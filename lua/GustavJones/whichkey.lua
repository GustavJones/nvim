local wk = require("which-key")

wk.register({
    ["<leader>"] = {
        g = {
            name = "git",
            g = "lazygit",
        },
        e = "neotree",
        t = {
            name = "telescope",
            c = "colorscheme",
            b = "buffers",
            t = "telescope",
        },
        b = {
            name = "buffer",
            d = "delete",
            h = "previous buffer",
            l = "next buffer",
        }
    },
    ["<C-d>"] = "format document",
    ["<C-h>"] = "jump to left window",
    ["<C-j>"] = "jump to bottom window",
    ["<C-k>"] = "jump to top window",
    ["<C-l>"] = "jump to right window",

    ["<M-h>"] = "resize left",
    ["<M-j>"] = "resize down",
    ["<M-k>"] = "resize up",
    ["<M-l>"] = "resize right",

    ["<M-m>"] = "resize max vertical",
    ["<M-n>"] = "resize max horizontal",

    ["<C-t>"] = "toggle terminal",
})

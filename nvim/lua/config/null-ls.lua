local null_ls = require("null-ls")
local eslint_d = require("none-ls.diagnostics.eslint_d")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.completion.spell,
        eslint_d,
    },
})

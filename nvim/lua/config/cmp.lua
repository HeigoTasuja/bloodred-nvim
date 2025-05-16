local cmp = require("cmp")

cmp.setup({
  mapping = {
    -- Tab to next item, Shift-Tab to previous
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { "i", "s" }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { "i", "s" }),

    -- Ctrl+Space opens the completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Enter to confirm the selected item
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },

  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
  },
})


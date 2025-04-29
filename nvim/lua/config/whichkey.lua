local which_key = require("which-key")

which_key.setup({
  win = {
    border = "double", -- double line border like a vampire casket
    margin = { 2, 2, 2, 2 },
    padding = { 2, 2, 2, 2 },
    position = "center",
    scrolloff = 0,
    zindex = 1000,
  },
  layout = {
    height = { min = 6, max = 25 },
    width = { min = 20, max = 70 },
    spacing = 5, -- more space between columns
    align = "center",
  },
  plugins = {
    spelling = {
      enabled = true,
      suggestions = 20,
    },
  },
})

-- BloodRed Highlight Overrides
vim.api.nvim_set_hl(0, "WhichKey", { fg = "#ff5555", bold = true })
vim.api.nvim_set_hl(0, "WhichKeyGroup", { fg = "#ff0000", bold = true })
vim.api.nvim_set_hl(0, "WhichKeyDesc", { fg = "#ff4444" })
vim.api.nvim_set_hl(0, "WhichKeySeparator", { fg = "#ff5555" })
vim.api.nvim_set_hl(0, "WhichKeyBorder", { fg = "#ff2222" })
vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = "#1e1e2e" })

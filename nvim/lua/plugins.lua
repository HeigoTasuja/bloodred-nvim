local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin Manager: lazy.nvim
require("lazy").setup({
    { "nvim-tree/nvim-tree.lua" },
    { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    { "williamboman/mason.nvim" },
    { "neovim/nvim-lspconfig" },
    { "nvim-lualine/lualine.nvim" },
    { "EdenEast/nightfox.nvim" },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "L3MON4D3/LuaSnip" },
    { "lewis6991/gitsigns.nvim" },
    { "ThePrimeagen/harpoon" },
    {
      "nvimtools/none-ls.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvimtools/none-ls-extras.nvim",
      },
    },
    { "mfussenegger/nvim-dap" },
    { "folke/which-key.nvim" },
    { "goolord/alpha-nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
})

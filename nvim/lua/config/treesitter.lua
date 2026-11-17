local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
  vim.notify("treesitter not available: " .. configs, vim.log.levels.WARN)
  return
end
configs.setup({ ... })

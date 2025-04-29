local function is_night_time()
  local hour = tonumber(os.date("%H"))
  return hour >= 19 or hour <= 5
end

local function activate_bloodmoon()
  -- Darken background even more
  vim.api.nvim_set_hl(0, "Normal", { fg = "#ff3333", bg = "#121212" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#222222" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#bb0000" })

  -- Darken Which-Key Popup
  vim.api.nvim_set_hl(0, "WhichKey", { fg = "#ff2222", bold = true })
  vim.api.nvim_set_hl(0, "WhichKeyGroup", { fg = "#ff1111", bold = true })
  vim.api.nvim_set_hl(0, "WhichKeyDesc", { fg = "#ff3333" })
  vim.api.nvim_set_hl(0, "WhichKeySeparator", { fg = "#ff3333" })
  vim.api.nvim_set_hl(0, "WhichKeyBorder", { fg = "#aa1111" })
  vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = "#121212" })

  -- Notify the user
  vim.schedule(function()
    vim.notify("🌑 Blood Moon Rises... Coding in darkness.", vim.log.levels.WARN, { title = "🩸 BLOOD MOON 🌑" })
  end)
end

-- Auto activate if night
if is_night_time() then
  activate_bloodmoon()
end

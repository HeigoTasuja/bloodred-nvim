local function is_night()
  local hour = tonumber(os.date("%H"))
  return hour >= 19 or hour <= 5
end

local function is_sunset()
  local hour = tonumber(os.date("%H"))
  return hour >= 17 and hour < 19
end

local function set_transparency()
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
  vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
end

local function blood_splatter_ascii()
  return {
    "⠀⠀⠀⢀⣤⣴⣾⣿⣿⣷⣦⣤⡀⠀⠀⠀⠀⠀",
    "⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀",
    "⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀",
    "⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀",
    "⢸⣿⣿⣿⠟⠋⠁⠀⠈⠙⠛⠻⠿⣿⣿⣿⡇⠀",
    "⠀⠙⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠋⠀⠀",
  }
end

local function blood_moon_theme()
  vim.api.nvim_set_hl(0, "Normal", { fg = "#ff3333", bg = "#121212" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#222222" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#990000" })
  vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = "#121212" })
  vim.api.nvim_set_hl(0, "WhichKey", { fg = "#ff1111", bold = true })
end

local function activate_blood_gates()
  if is_sunset() then
    vim.api.nvim_set_hl(0, "Normal", { fg = "#ff8888", bg = "#1e1e2e" })
    vim.notify("🌄 Sunset: Blood prepares for the night...", vim.log.levels.INFO, { title = "🩸 Blood Gates" })
  elseif is_night() then
    blood_moon_theme()
    set_transparency()
    vim.schedule(function()
      vim.notify("🌑 Blood Moon Gates Open! Welcome to Darkness...", vim.log.levels.WARN, { title = "🩸 BLOOD GATES OPEN" })
    end)

    -- Optionally: Change Alpha header to blood splatter
    local ok, alpha = pcall(require, "alpha")
    if ok then
      local dashboard = require("alpha.themes.dashboard")
      dashboard.section.header.val = blood_splatter_ascii()
      alpha.setup(dashboard.opts)
    end
  else
    vim.notify("☀️ Daylight reigns... for now.", vim.log.levels.INFO, { title = "Blood Gates" })
  end
end

activate_blood_gates()

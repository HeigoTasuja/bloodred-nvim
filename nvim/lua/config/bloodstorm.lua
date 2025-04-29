local uv = vim.loop
local api = vim.api

local frames = {
  {
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣤⣤⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⡿⠟⠛⠛⠻⠿⣿⣿⣷⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⢀⣤⣴⣶⣦⣤⡀⠀⠀⢸⣿⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣧⠀⣴⣿⣿⣿⣿⣿⣿⣿⣦⠀⣼⡿⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣷⣌⠻⠿⢿⣿⡿⠿⠟⣡⣾⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣶⣤⣤⣤⣶⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  },
  {
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣤⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⡿⠋⠁⠀⠀⠀⠀⠀⠈⠙⢿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣦⣤⣤⣤⣴⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  }
}

local function animate_alpha_blood()
  local ok, alpha = pcall(require, "alpha")
  if not ok then return end

  local dashboard = require("alpha.themes.dashboard")

  local i = 1
  local timer = uv.new_timer()

  timer:start(0, 700, function()
    vim.schedule(function()
      dashboard.section.header.val = frames[i]
      alpha.setup(dashboard.opts)
      i = i % #frames + 1
    end)
  end)
end

local function play_thunder_sound()
  -- MacOS: 'afplay' can play sounds from terminal
  vim.fn.jobstart({ "afplay", "/System/Library/Sounds/Submarine.aiff" }, { detach = true })
end

local function unleash_bloodstorm()
  -- Play a thunder sound
  play_thunder_sound()

  -- Animate the Alpha dashboard
  animate_alpha_blood()

  -- Notify
  vim.schedule(function()
    vim.notify("🌩️ BloodStorm unleashed across your Neovim!", vim.log.levels.ERROR, { title = "🩸 BLOODSTORM" })
  end)
end

unleash_bloodstorm()

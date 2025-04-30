local uv = vim.loop
local M = {}

M.storm_section = {
  type = "text",
  val = {},
  opts = { position = "center", hl = "Constant" },
}

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
      M.storm_section.val = frames[i]
      alpha.redraw()
      i = i % #frames + 1
    end)
  end)
end

local function play_thunder_sound()
  local thunder_path = vim.fn.stdpath("config") .. "/sounds/thunder.mp3"

  if vim.fn.has("macunix") == 1 then
    os.execute("afplay " .. thunder_path .. " &")
  elseif vim.fn.has("unix") == 1 then
    -- try mpv or ffplay on Linux
    os.execute("mpv --no-terminal --volume=50 " .. thunder_path .. " &")
  end
end

local function unleash_bloodstorm()
  play_thunder_sound()
  animate_alpha_blood()
  vim.schedule(function()
    vim.notify("🌩️ BloodStorm unleashed across your Neovim!", vim.log.levels.ERROR, { title = "🩸 BLOODSTORM" })
  end)
end

-- 🔥 Start storm on load
unleash_bloodstorm()

return M
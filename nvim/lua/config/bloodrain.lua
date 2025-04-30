local uv = vim.loop
local M = {}

local drops = {}
local smears = {}
local width = 80
local height = 8
local drop_char = "🩸"
local smear_char = "░"
local timer = nil

-- Dynamically injected rain section (will be placed by alpha.lua)
M.rain_section = {
  type = "text",
  val = {},
  opts = { position = "center", hl = "Comment" }
}

local function empty_screen()
  local lines = {}
  for _ = 1, height do
    table.insert(lines, string.rep(" ", width))
  end
  return lines
end

local function update_screen()
  local lines = empty_screen()

  for _, smear in ipairs(smears) do
    if smear.y <= height then
      local line = lines[smear.y]
      lines[smear.y] = vim.fn.strcharpart(line, 0, smear.x - 1) .. smear_char .. vim.fn.strcharpart(line, smear.x)
    end
  end

  for _, drop in ipairs(drops) do
    if drop.y <= height then
      local line = lines[drop.y]
      lines[drop.y] = vim.fn.strcharpart(line, 0, drop.x - 1) .. drop_char .. vim.fn.strcharpart(line, drop.x)
      drop.y = drop.y + 1
    end
  end

  for _ = 1, math.random(10, 20) do
    table.insert(drops, { x = math.random(2, width - 2), y = 1 })
  end

  for i = #drops, 1, -1 do
    if drops[i].y > height then
      table.insert(smears, { x = drops[i].x, y = height })
      table.remove(drops, i)
    end
  end

  if #smears > 500 then
    for i = 1, 50 do
      table.remove(smears, 1)
    end
  end

  return lines
end

function M.start_bloodrain()
  local ok, alpha = pcall(require, "alpha")
  if not ok then return end

  local dashboard = require("alpha.themes.dashboard")

  if not dashboard.opts or not dashboard.opts.layout then
    vim.defer_fn(M.start_bloodrain, 100)
    return
  end

  if timer then
    timer:stop()
    timer:close()
  end

  timer = uv.new_timer()
  timer:start(0, 70, function()
    vim.schedule(function()
      M.rain_section.val = update_screen()

      local current_buf = vim.api.nvim_get_current_buf()
      local bufname = vim.api.nvim_buf_get_name(current_buf)
      if bufname:match(".*Alpha.*") then
        alpha.redraw()
      end
    end)
  end)
end

return M

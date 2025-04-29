local uv = vim.loop
local M = {}

local drops = {}
local smears = {}
local width = 80
local height = 20
local drop_char = "🩸"
local smear_char = "░"
local timer = nil

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
      lines[smear.y] = line:sub(1, smear.x - 1) .. smear_char .. line:sub(smear.x + 1)
    end
  end

  for _, drop in ipairs(drops) do
    if drop.y <= height then
      local line = lines[drop.y]
      lines[drop.y] = line:sub(1, drop.x - 1) .. drop_char .. line:sub(drop.x + 1)
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

  if #smears > 1000 then
    for i = 1, 50 do
      table.remove(smears, 1)
    end
  end

  return lines
end

function M.start_bloodrain()
  local ok, alpha = pcall(require, "alpha")
  if not ok then
    return
  end

  local dashboard = require("alpha.themes.dashboard")

  -- ⏳ Wait until dashboard.layout is ready
  if not dashboard.layout then
    vim.defer_fn(function()
      M.start_bloodrain()
    end, 100)
    return
  end

  local function find_header(layout)
    for _, section in ipairs(layout) do
      if section.type == "text" then
        return section
      elseif section.type == "group" then
        for _, item in ipairs(section.val) do
          if item.type == "text" then
            return item
          end
        end
      end
    end
    return nil
  end

  local header = find_header(dashboard.layout)

  if not header then
    return
  end

  if timer then
    timer:stop()
    timer:close()
  end

  timer = uv.new_timer()
  timer:start(0, 70, function()
    vim.schedule(function()
      local frame = update_screen()
      header.val = frame
      alpha.setup(dashboard.opts)
    end)
  end)
end

vim.api.nvim_create_autocmd("User", {
  pattern = "AlphaReady",
  callback = function()
    print("🩸 AlphaReady triggered!")
    drops = {}
    smears = {}
    M.start_bloodrain()
  end,
})

M.start_bloodrain()

return M

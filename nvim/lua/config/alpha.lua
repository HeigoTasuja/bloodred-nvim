local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Load BloodRain logic
local bloodrain_ok, bloodrain = pcall(require, "config.bloodrain")

-- Default static Bloody banner first
dashboard.section.header.val = {
  " ███╗   ██╗██╗   ██╗██╗███╗   ███╗",
  " ████╗  ██║██║   ██║██║████╗ ████║",
  " ██╔██╗ ██║██║   ██║██║██╔████╔██║",
  " ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
  " ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
  " ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
  "      BloodRed Neovim 🩸",
}

-- Buttons
dashboard.section.buttons.val = {
  dashboard.button("SPC ff", "󰱼  Find File", ":Telescope find_files<CR>"),
  dashboard.button("SPC fg", "  Live Grep", ":Telescope live_grep<CR>"),
  dashboard.button("SPC e",  "󰉋  Explorer", ":NvimTreeToggle<CR>"),
  dashboard.button("SPC r",  "󰄉  Recent Files", ":Telescope oldfiles<CR>"),
  dashboard.button("SPC s",  "󰆓  Settings", ":e $MYVIMRC<CR>"),
  dashboard.button("q",      "󰅖  Quit", ":qa<CR>"),
}

-- Random bloody quotes
local bloody_quotes = {
  "🩸 Powered by Blood, built for speed.",
  "🧛 Code until the last drop!",
  "⚔️ Slice through bugs like a true vampire!",
  "💀 Let the crimson code flow!",
  "🔥 Burn your limits in blood!",
  "☠️ Bugs fear the BloodRed Neovim!",
  "🧟‍♂️ Code or be coded upon!",
  "🔪 The IDE of the night stalkers!",
  "🦇 Shadows guide your keystrokes.",
  "🧛‍♀️ Blood is the price of perfection.",
  "🩸 Every line bleeds brilliance.",
  "⚰️ You code... others perish.",
  "🕸️ The web is soaked in crimson.",
  "🧠 Mind sharp as a vampire's fang.",
  "🌑 Under the blood moon we commit.",
  "🔥 Ignite your errors. Smelt your success.",
  "💉 Inject code, extract chaos.",
  "🔮 Omens written in ruby red runes.",
  "🗡️ Slash your TODO list mercilessly.",
  "🌪️ Swirl your logic into a red storm.",
  "🧛 Wake. Code. Feed. Repeat.",
  "📜 Scrolls of ancient code, drenched in red.",
  "💀 Every bug a body.",
  "🌙 Nightmares are written in Lua.",
  "🔔 Toll the bell, the coding begins.",
  "👁️ Eyes wide open under the blood sun.",
  "🧬 Bloodlines of code perfect the ritual.",
  "🧛‍♂️ Vim or die trying.",
  "🩸 Syntax error? Spill more blood!",
  "🕷️ Crawl the codebase like a night terror.",
  "🩸 Baptized by the blood of 1000 merges.",
  "🧹 Sweep bugs into a grave.",
  "🛡️ Wield the Blade of Refactors.",
  "🧪 Alchemy of functions, spilt in crimson.",
  "🕯️ Light fades, BloodRed Neovim remains.",
}

math.randomseed(os.time())
dashboard.section.footer.val = bloody_quotes[math.random(1, #bloody_quotes)]

-- Prevent autocommands during setup
dashboard.opts.opts.noautocmd = true

-- Setup Alpha with BloodRain!
alpha.setup(dashboard.opts)

-- AFTER Alpha is fully ready, start BloodRain
if bloodrain_ok then
  vim.api.nvim_create_autocmd("User", {
    pattern = "AlphaReady",
    callback = function()
      bloodrain.start_bloodrain()
    end,
  })
end
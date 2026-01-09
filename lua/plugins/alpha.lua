local alpha = require('alpha')
local dashboard = require("alpha.themes.dashboard")

dashboard.section.buttons.val = {
	dashboard.button("a", "  New file", ":ene <BAR> startinsert <CR>"),
--	dashboard.button("f", "󰍉  Find file", ":lua require('fzf-lua').files() <CR>"),
	dashboard.button("t", "  Browse…", ":NvimTreeOpen<CR>"),
	dashboard.button("c", "  Config", ":e ~/.config/nvim/<CR>"),
	dashboard.button("m", "  Mappings", ":e ~/.config/nvim/lua/config/mappings.lua<CR>"),
	dashboard.button("q", "󰅙  Quit", ":q!<CR>"),
}

dashboard.section.footer.val = function()
  return vim.g.startup_time_ms or "« 󰣨 »"
end

dashboard.section.buttons.opts.hl = "Keyword"
dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)

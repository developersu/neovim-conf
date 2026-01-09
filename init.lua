-- Auto install vim-plug and plugins, if not found
local data_dir = vim.fn.stdpath('data')
if vim.fn.empty(vim.fn.glob(data_dir .. '/site/autoload/plug.vim')) == 1 then
	vim.cmd('silent !curl -fLo ' .. data_dir .. '/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
	vim.o.runtimepath = vim.o.runtimepath
	vim.cmd('autocmd VimEnter * PlugInstall --sync | source $MYVIMRC')
end

vim.g.start_time = vim.fn.reltime()

local vim = vim
local Plug = vim.fn['plug#']
--vim.loader.enable()

vim.call('plug#begin')
-- Install these via :PlugInstall
Plug('catppuccin/nvim', { ['as'] = 'catppuccin' })
Plug('nvim-lualine/lualine.nvim') --statusline
Plug('nvim-tree/nvim-web-devicons') --statusline requirements 
Plug('nvim-tree/nvim-tree.lua') --file explorer
Plug('nvim-treesitter/nvim-treesitter') --improved syntax
Plug('norcalli/nvim-colorizer.lua')
Plug('MeanderingProgrammer/render-markdown.nvim') --render md inline
Plug('romgrk/barbar.nvim') --tab-line
Plug('skywind3000/vim-quickui') -- topline menu
Plug('folke/which-key.nvim')  --mappings popup
Plug('emmanueltouzery/decisive.nvim') --view csv files
Plug('goolord/alpha-nvim') --pretty startup
Plug('nhattVim/alpha-ascii.nvim')
Plug('mfussenegger/nvim-lint') --async linter
Plug('fidian/hexmode') -- better hex-editing

vim.call('plug#end')

require("config.mappings")
require("config.options")
require("config.autocmd")

require("plugins.lualine")
require("plugins.colorizer")
require("plugins.render-markdown")
require("plugins.which-key")
require("plugins.vim-quickui")
require("plugins.alpha")
require("plugins.alpha-ascii")
require("plugins.hexmode")
require("plugins.nvim-lint")

vim.defer_fn(function() 
		--defer non-essential configs,
		--purely for experimental purposes:
		--this only makes a difference of +-10ms on initial startup
require("plugins.nvim-tree")
require("plugins.treesitter")
require("plugins.barbar")
end, 100)

vim.cmd "silent! colorscheme catppuccin"


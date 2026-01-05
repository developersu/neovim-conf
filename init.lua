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
-- FIXME Plug('folke/which-key.nvim')  --mappings popup
Plug('nvim-tree/nvim-tree.lua') --file explorer
Plug('nvim-treesitter/nvim-treesitter') --improved syntax
Plug('norcalli/nvim-colorizer.lua')
Plug('MeanderingProgrammer/render-markdown.nvim') --render md inline
Plug('romgrk/barbar.nvim') --tab-line

vim.call('plug#end')

require("config.mappings")
require("config.options")
require("config.autocmd")

require("plugins.numbertoggle")
require("plugins.lualine")
require("plugins.colorizer")
require("plugins.render-markdown")
-- require("plugins.which-key")

vim.defer_fn(function() 
		--defer non-essential configs,
		--purely for experimental purposes:
		--this only makes a difference of +-10ms on initial startup
require("plugins.nvim-tree")
require("plugins.treesitter")
require("plugins.barbar")
end, 100)

vim.cmd "silent! colorscheme catppuccin"

-- Меняем кодировку нажатием F8

-- Создаем меню для выбора кодировок
local encodings_menu = {
    ["Encoding.cp1251"]   = ":edit ++enc=cp1251<CR>",
    ["Encoding.koi8-r"]   = ":edit ++enc=koi8-r<CR>",
    ["Encoding.cp866"]    = ":edit ++enc=ibm866<CR>",
    ["Encoding.utf-8"]    = ":edit ++enc=utf-8<CR>",
    ["Encoding.ucs-2le"]  = ":edit ++enc=ucs-2le<CR>"
}

for name, cmd in pairs(encodings_menu) do
    vim.cmd("menu "..name.." "..cmd)
end

-- Включаем отображение подсказок команд
vim.o.wildmenu = true
--vim.o.wildchar = "<Tab>"

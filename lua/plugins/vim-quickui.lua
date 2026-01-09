vim.g.quickui_color_scheme = 'gruvbox'
vim.cmd.call('quickui#menu#reset()')

vim.cmd [[
	function! ReplaceContaining()
        let pattern = quickui#input#open(':g/.*…YOUR_INPUT….*/d', '')
		if pattern != ''
				exec 'g/.*' .. pattern .. '.*/d'
		endif
    endfunction

	function! ReplaceNotContaining()
        let pattern = quickui#input#open(':g!/.*…YOUR_INPUT….*/d', '')
		if pattern != ''
				exec 'g!/.*' .. pattern .. '.*/d'
		endif
    endfunction
]]

-- Set file encodign in menu
vim.fn.call('quickui#menu#install', {'&Encoding', {
    { 'cp1251',  'edit ++enc=cp1251'   },
	{ 'koi8-r',  'edit ++enc=koi8-r' },  
  	{ 'utf-8',   'edit ++enc=utf-8' },   
  	{ 'ibm866',  'edit ++enc=ibm866'  },   
}})

vim.fn.call('quickui#menu#install', {'&Search+Replace…', {
  	{ '&Remove blank lines', 'g/^\\s*$/d' },   
  	{ 'Remove all &containing', 'call ReplaceContaining()' },   
  	{ 'Remove all &not containing', 'call ReplaceNotContaining()' },   
}})

vim.fn.call('quickui#menu#install', {'S&crolling', {
  	{ 'Sync srolling',  'windo set scrollbind!'  },   
}})

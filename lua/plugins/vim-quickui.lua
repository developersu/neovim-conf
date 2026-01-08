vim.g.quickui_color_scheme = 'gruvbox'
vim.cmd.call('quickui#menu#reset()')

-- Set file encodign in menu
vim.fn.call('quickui#menu#install', {'&Encoding', {
    { 'cp1251',  'edit ++enc=cp1251'   },
	{ 'koi8-r',  'edit ++enc=koi8-r' },  
  	{ 'utf-8',   'edit ++enc=utf-8' },   
  	{ 'ibm866',  'edit ++enc=ibm866'  },   
}})

vim.fn.call('quickui#menu#install', {'&Scrolling', {
  	{ 'Sync srolling',  'windo set scrollbind!'  },   
}})

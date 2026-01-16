vim.g.quickui_color_scheme = 'gruvbox'
vim.cmd.call('quickui#menu#reset()')

local function GetCommits()
		local log_output = vim.fn.system("git log --oneline")

		-- Check for any errors
		if vim.v.shell_error ~= 0 then
			print("Error executing git log")
			return
		end

		-- Initialize a table to hold the commits
		local commits = {}

		-- Split the output into a table with two columns
		for line in log_output:gmatch("[^\n]+") do
			local hash, message = line:match("(%w+)%s+(.+)")
			if hash and message then
				table.insert(commits, {hash = hash, message = message})
			end
		end

		return commits
end

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

	function! GitDiffCommit()
		" Get list from GIT
		let log_output = system('git log --oneline')

		" Check for errors
		if v:shell_error != 0
			echo "Error executing git log"
			finish
		endif

		" List to hold the commits
		let commits = []

		" Split the output into a list with two columns
		for line in split(log_output, '\n')
			let match = matchlist(line, '^\(\w\+\)\s\+\(.*\)$')
			if len(match) > 0
				call add(commits, [ match[1] .. "\t" .. match[2], ':Gitsigns diffthis ' .. match[1] ])
			endif
		endfor

		let opts = {'title': 'REVISION'}
		echo quickui#listbox#open(commits, opts)
    endfunction

	function! SetEncoding()
		let encodings = [ 
		 	\ [ 'cp1251',  'edit ++enc=cp1251'  ],
		 	\ [ 'koi8-r',  'edit ++enc=koi8-r' ],  
		 	\ [ 'utf-8',   'edit ++enc=utf-8' ],   
		 	\ [ 'ibm866',  'edit ++enc=ibm866' ],   
		\ ]

		let opts = {'title': 'Encoding'}
		echo quickui#listbox#open(encodings, opts)
    endfunction
]]



-- Editor menu
vim.fn.call('quickui#menu#install', {'&Editor', {
  	{ '&Hex mode',  'Hexmode'  },   
  	{ '&Encoding',  'call SetEncoding()'  },   
	{ '--', '' },
  	{ '&Sync srolling',  'windo set scrollbind!'  },   
  	{ 'S&pell check',  'set spell!' },   
}})

vim.fn.call('quickui#menu#install', {'&Search-Replace', {
  	{ '&Remove blank lines', 'g/^\\s*$/d' },   
  	{ 'Remove all &containing', 'call ReplaceContaining()' },   
  	{ 'Remove all &not containing', 'call ReplaceNotContaining()' },   
}})

-- Gitsigns
vim.fn.call('quickui#menu#install', {'&Git', {
  	{ '&Num diff',  'Gitsigns toggle_numhl'  },   
  	{ '&Line diff',  'Gitsigns toggle_linehl'  },   
  	{ '&Word diff',  'Gitsigns toggle_word_diff'  },   
	{ '--', '' },
  	{ 'Blame &inline',  'Gitsigns toggle_current_line_blame'  }, 
  	{ '&Blame',  'Gitsigns blame'  },   
	{ '--', '' },
	{ '&Diff to master', 'Gitsigns diffthis master' },
	{ 'Di&ff to COMMIT', 'call GitDiffCommit()' },
}})

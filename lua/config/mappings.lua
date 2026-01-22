local function map(m, k, v)
	vim.keymap.set(m, k, v, { noremap = true, silent = true })
end

-- set leader (key that has to be pressed beforehand mapped one)
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "<leader>t", ":NvimTreeToggle<CR>") --open file explorer
map("n", "<leader>w", ":set wrap!<CR>") --toggle wrap

map("n", "<leader>m", ":call quickui#menu#open()<CR>") --open menu

-- Tabs
map("n", "<leader>l", ":bnext<CR>")
map("n", "<leader>h", ":bprevious<CR>")

map("n", "<leader>q", ":BufferClose<CR>")
map("n", "<leader>Q", ":BufferClose!<CR>")
map("n", "<leader>vs", ":vsplit<CR>:bnext<CR>") --ver split + open next buffer

map("n", "<leader>1", "<Cmd>BufferGoto 1<CR>")
map("n", "<leader>2", "<Cmd>BufferGoto 2<CR>")
map("n", "<leader>3", "<Cmd>BufferGoto 3<CR>")
map("n", "<leader>4", "<Cmd>BufferGoto 4<CR>")
map("n", "<leader>5", "<Cmd>BufferGoto 5<CR>")
map("n", "<leader>6", "<Cmd>BufferGoto 6<CR>")
map("n", "<leader>7", "<Cmd>BufferGoto 7<CR>")
map("n", "<leader>8", "<Cmd>BufferGoto 8<CR>")
map("n", "<leader>9", "<Cmd>BufferGoto 9<CR>")
map("n", "<leader>0", "<Cmd>BufferLast<CR>")

-- decisive csv
map("n", "<leader>csa", ":lua require('decisive').align_csv({})<CR>")
map("n", "<leader>csA", ":lua require('decisive').align_csv_clear({})<CR>")
map("n", "[c", ":lua require('decisive').align_csv_prev_col()<CR>")
map("n", "]c", ":lua require('decisive').align_csv_next_col()<CR>")

-- JSON
map("n", "<leader>cja", ":%!jq '.'<CR>")
map("n", "<leader>cjj", ":set filetype=json<CR>")

map("n", "<leader>s", ":%s///g<Left><Left><Left>") --replace all
map("n", "<leader>u", ':silent !xdg-open "<cWORD>" <CR>') --open a url under cursor

-- gitsigns
map("n", "<leader>gb", ":Gitsigns blame_line<CR>")
map("n", "<leader>ghh", ":Gitsigns preview_hunk<CR>")
map("n", "<leader>ghn", ":Gitsigns nav_hunk next<CR>")
map("n", "<leader>ghN", ":Gitsigns nav_hunk prev<CR>")


function diffToggle()
  if vim.wo.diff then
    vim.cmd(':windo diffoff')
  else
    vim.cmd(':windo diffthis')
  end
end
map("n", "<leader>d", ":lua diffToggle()<CR>") -- diff opened in split buffers

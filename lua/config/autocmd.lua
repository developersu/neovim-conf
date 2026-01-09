-- Auto Close nvim-tree
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end
})

-- spellcheck in md
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	command = "setlocal spell wrap",
})

-- highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
	vim.highlight.on_yank({ timeout = 300 })
	end,
})

-- linting when file is written to
vim.api.nvim_create_autocmd("BufWritePost", {
  callback = function()
    -- try_lint without arguments runs the linters defined in `linters_by_ft`
    -- for the current filetype, on write
    require("lint").try_lint()
  end,
})

-- restore cursor pos on file open
vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "*",
	callback = function()
	local line = vim.fn.line("'\"")
	if line > 1 and line <= vim.fn.line("$") then
		vim.cmd("normal! g'\"")
	end
end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
   pattern = "*",
   group = augroup,
   callback = function()
      if vim.o.nu and vim.api.nvim_get_mode().mode ~= "i" then
         vim.opt.relativenumber = true
      end
   end,
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "CmdlineEnter", "WinLeave" }, {
   pattern = "*",
   group = augroup,
   callback = function()
      if vim.o.nu then
         vim.opt.relativenumber = false
      end
   end,
})

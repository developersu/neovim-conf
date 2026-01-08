local lualine = require('lualine')

local diff = {
	"diff",
	colored = true,
	symbols = { added = " ", modified = " ", removed = " " },
}

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = { "alpha", "dashboard" },
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
--    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
      refresh_time = 16, -- ~60fps
      events = {
        'WinEnter',
        'BufEnter',
        'BufWritePost',
        'SessionLoadPost',
        'FileChangedShellPost',
        'VimResized',
        'Filetype',
        'CursorMoved',
        'CursorMovedI',
        'ModeChanged',
      },
    }
  },

  sections = {
    lualine_a = {'branch', 'diagnostics'},
    lualine_b = {'mode'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype', 'diff'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },

--  inactive_sections = {
--    lualine_a = {},
--    lualine_b = {},
--    lualine_c = {'filename'},
--    lualine_x = {'location'},
--    lualine_y = {},
--    lualine_z = {}
--  },
--  tabline = {},
--  winbar = {},
--  inactive_winbar = {},
  extensions = {}
}

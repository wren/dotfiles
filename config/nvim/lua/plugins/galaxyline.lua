local gl = require('galaxyline')
local gls = gl.section
local fileinfo = require('galaxyline.provider_fileinfo')
gl.short_line_list = {'defx', 'LuaTree', 'vista'}

local colors = {
  bg          = '#121212',
  line_bg     = '#353644',
  inactive_bg = '#333333',
  fg          = '#8FBCBB',
  fg_green    = '#65a380',

  yellow      = '#fabd2f',
  cyan        = '#008080',
  darkblue    = '#ff0000',
  green       = '#98C379',
  orange      = '#FF8800',
  purple      = '#542F98',
  magenta     = '#c678dd',
  blue        = '#51afef',
  red         = '#ec5f67',
  grey        = '#121212',
  darkgrey    = '#1a1a1a',
  white       = '#AAB098',
}

local function buffer_not_empty()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

local function filename_with_color()
  local is_help = vim.bo.filetype == 'help'
  local modified = vim.api.nvim_buf_get_option(vim.api.nvim_get_current_buf(), 'modified')
  local filename_color = colors.fg
  if modified then
    filename_color = colors.yellow
  end
  vim.api.nvim_command('hi GalaxyFileName guifg='..filename_color..' guibg='..colors.line_bg)
  local filename = fileinfo.get_current_file_name()
  if is_help then
    filename = 'HELP - ' .. fn.expand('%:t:r')
  end
  return filename
end

local mode_info = {
  n = {
    name = 'NORMAL',
    color = colors.green
  },
  i = {
    color = colors.blue,
    name = 'INSERT'
  },
  v = {
    color = colors.magenta,
    name = 'VISUAL'
  },
  [''] = {
    color = colors.magenta,
    name = 'VISUAL BLOCKWISE'
  },
  V = {
    color = colors.magenta,
    name = 'VISUAL BLOCK'
  },
  c = {
    color = colors.white,
    name = 'COMMAND'
  },
  no = {
    color = colors.magenta,
    name = 'no'
  },
  s = {
    color = colors.orange,
    name = 's'
  },
  S = {
    color = colors.orange,
    name = 'S'
  },
  [''] = {
    color = colors.orange,
    name = '^S'
  },
  ic = {
    color = colors.yellow,
    name = 'ic'
  },
  R = {
    color = colors.purple,
    name = 'REPLACE'
  },
  Rv = {
    color = colors.purple,
    name = 'Rv'
  },
  cv = {
    color = colors.red,
    name = 'cv'
  },
  ce = {
    color = colors.red,
    name = 'ce'
  },
  r = {
    color = colors.cyan,
    name = 'r'
  },
  rm = {
    color = colors.cyan,
    name = 'rm'
  },
  ['r?'] = {
    color = colors.cyan,
    name = 'r?'
  },
  ['!']  = {
    color = colors.red,
    name = '!'
  },
  t = {
    color = colors.red,
    name = 't'
  },
}

local function update_mode_color()
  -- auto change color according the vim mode
  local modes = {
    "GalaxyViMode",
    "GalaxyPercent",
    "GalaxyPercentSeparator",
    "GalaxyLineColumn",
    "LineColumnSeparator",
    "EndSpaceSeparator",
  }
  for _, highlightGroup in ipairs(modes) do
    vim.api.nvim_command('hi '..highlightGroup..' guifg=#212122 guibg='..mode_info[vim.fn.mode()].color)
  end
end


local function checkwidth()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

local function buffer_is_modifiable()
  return vim.bo.modifiable
end

local function buffer_is_not_modifiable()
  return not buffer_is_modifiable()
end

local non_mod_spacer = {
  NonMod = {
    provider = function() return '    ' end,
    highlight = { colors.darkgrey, colors.darkgrey },
    condition = buffer_is_not_modifiable
  }
}

---------------
-- Left side --
---------------
gls.left = {
  non_mod_spacer,

  {
    ViMode = {
      icon = ' ',
      condition = buffer_is_modifiable,
      provider = function()
        update_mode_color()
        return ' ' .. mode_info[vim.fn.mode()].name .. ' '
      end,
      highlight = { colors.red, colors.line_bg },
      separator_highlight = { colors.line_bg, colors.line_bg },
    }
  },

  {
    FileIcon = {
      icon = '  ',
      provider = 'FileIcon',
      condition = buffer_not_empty,
      highlight = { fileinfo.get_file_icon_color, colors.line_bg },
    }
  },

  {
    FileName = {
      provider = filename_with_color,
      separator = ' ',
      condition = buffer_not_empty,
      highlight = { colors.fg, colors.line_bg, 'bold' },
      separator_highlight = { colors.fg, colors.line_bg, 'bold' },
    }
  },

  {
    DiffAdd = {
      provider = 'DiffAdd',
      condition = checkwidth,
      icon = ' ',
      highlight = {colors.green,colors.line_bg},
    }
  },

  {
    DiffModified = {
      provider = 'DiffModified',
      condition = checkwidth,
      icon = ' ',
      highlight = {colors.yellow,colors.line_bg},
    }
  },

  {
    DiffRemove = {
      provider = 'DiffRemove',
      condition = checkwidth,
      icon = ' ',
      highlight = {colors.red,colors.line_bg},
    }
  },

  {
    DiagnosticError = {
      separator = ' |  ',
      separator_highlight = {colors.line_bg,colors.line_bg},
      provider = 'DiagnosticError',
      icon = '  ',
      highlight = {colors.red,colors.line_bg}
    }
  },

  {
    DiagnosticWarn = {
      provider = 'DiagnosticWarn',
      icon = '  ',
      highlight = {colors.yellow,colors.line_bg},
    }
  },

  {
    Space = {
      provider = function() return ' ' end,
      highlight = {colors.line_bg,colors.line_bg}
    }
 },
}

----------------
-- Right side --
----------------

gls.right = {
  {
    FileTypeName = {
      provider = 'FileTypeName',
      condition = buffer_is_modifiable,
      separator = ' ',
      separator_highlight = {colors.bg,colors.line_bg},
      highlight = {colors.fg,colors.line_bg,'bold'},
    }
  },

  {
    FileSize = {
      provider = 'FileSize',
      condition = buffer_is_modifiable,
      separator = ' ',
      icon = ' ',
      separator_highlight = {colors.blue,colors.line_bg},
      highlight = {colors.fg,colors.line_bg},
    }
  },

  {
    FileFormat = {
      provider = function()
        return fileinfo.get_file_encode():gsub("%s+", "")..'['..fileinfo.get_file_format()..']'
      end,
      condition = buffer_is_modifiable,
      separator = ' ',
      separator_highlight = {colors.fg,colors.line_bg},
      highlight = {colors.fg,colors.line_bg},
    },
  },

  {
    Percent = {
      provider = 'LinePercent',
      condition = buffer_is_modifiable,
      separator = ' ',
      separator_highlight = {colors.blue,colors.line_bg},
      highlight = {colors.bg,colors.red},
    }
  },

  {
    LineColumn = {
      provider = 'LineColumn',
      condition = buffer_is_modifiable,
      separator = '☰ ',
      separator_highlight = {colors.blue,colors.line_bg},
      highlight = {colors.fg,colors.line_bg,'bold'},
    },
  },

  {
    EndSpace = {
      separator = ' ',
      condition = buffer_is_modifiable,
      provider = function() return '' end,
      highlight = {colors.fg,colors.line_bg,'bold'},
    },
  },

  non_mod_spacer,
}

----------------
-- Short line --
----------------

gls.short_line_left = {
  non_mod_spacer,

  {
    InactiveMode = {
      icon = ' ',
      condition = buffer_is_modifiable,
      provider = function()
        return ' INACTIVE '
      end,
      highlight = { colors.grey, colors.inactive_bg },
    },
  },

  {
    FileIcon = {
      icon = '  ',
      provider = 'FileIcon',
      condition = buffer_not_empty,
      highlight = { fileinfo.get_file_icon_color, colors.inactive_bg },
    },
  },

  {
    FileName = {
      provider = filename_with_color,
      highlight = { colors.fg, colors.inactive_bg },
    }
  },
}

gls.short_line_right = {
  non_mod_spacer,
}


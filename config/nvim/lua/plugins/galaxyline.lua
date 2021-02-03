local gl = require('galaxyline')
local gls = gl.section
local fileinfo = require('galaxyline.provider_fileinfo')
gl.short_line_list = {'defx', 'LuaTree', 'vista'}

local colors = {
  bg = '#1A1A1A',
  line_bg = '#353644',
  fg = '#8FBCBB',
  fg_green = '#65a380',

  yellow = '#fabd2f',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#98C379',
  orange = '#FF8800',
  purple = '#542F98',
  magenta = '#c678dd',
  blue = '#51afef';
  red = '#ec5f67'
}

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
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
    color = colors.red,
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

local update_mode_color = function()
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

---------------
-- Left side --
---------------
gls.left[2] = {
  ViMode = {
    separator = ' ',
    provider = function()
      update_mode_color()
      return '  ' .. mode_info[vim.fn.mode()].name .. ' '
    end,
    highlight = {colors.red,colors.line_bg,'bold'},
    separator_highlight = {colors.red,colors.line_bg,'bold'},
  },
}
gls.left[3] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = buffer_not_empty,
    highlight = {fileinfo.get_file_icon_color,colors.line_bg},
  },
}
gls.left[4] = {
  FileName = {
    provider = function()
      local modified = vim.api.nvim_buf_get_option(vim.api.nvim_get_current_buf(), 'modified')
      local filename_color = colors.fg
      if modified then
        filename_color = colors.magenta
      end
      vim.api.nvim_command('hi GalaxyFileName guifg='..filename_color)
      return fileinfo.get_current_file_name()
    end,
    separator = ' ',
    condition = buffer_not_empty,
    highlight = {colors.fg,colors.line_bg,'bold'},
    separator_highlight = {colors.fg,colors.line_bg,'bold'},
  }
}

-- gls.left[5] = {
--   GitIcon = {
--     provider = function() return '  ' end,
--     condition = require('galaxyline.provider_vcs').check_git_workspace,
--     highlight = {colors.orange,colors.line_bg},
--   }
-- }
-- gls.left[6] = {
--   GitBranch = {
--     provider = 'GitBranch',
--     condition = require('galaxyline.provider_vcs').check_git_workspace,
--     highlight = {'#8FBCBB',colors.line_bg,'bold'},
--   }
-- }

local checkwidth = function()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

gls.left[7] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = checkwidth,
    icon = ' ',
    highlight = {colors.green,colors.line_bg},
  }
}
gls.left[8] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = checkwidth,
    icon = ' ',
    highlight = {colors.yellow,colors.line_bg},
  }
}
gls.left[9] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = checkwidth,
    icon = ' ',
    highlight = {colors.red,colors.line_bg},
  }
}
gls.left[10] = {
  LeftEnd = {
    provider = function() return '' end,
    separator = '',
    separator_highlight = {colors.bg,colors.line_bg},
    highlight = {colors.line_bg,colors.line_bg}
  }
}
gls.left[11] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red,colors.bg}
  }
}
gls.left[12] = {
  Space = {
    provider = function () return '   ' end
  }
}
gls.left[13] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.blue,colors.bg},
  }
}

----------------
-- Right side --
----------------

gls.right[1]= {
  FileTypeName = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = {colors.bg,colors.line_bg},
    highlight = {colors.fg,colors.line_bg,'bold'},
  }
}

gls.right[2] = {
  FileSize = {
    provider = 'FileSize',
    separator = ' ',
    icon = ' ',
    separator_highlight = {colors.blue,colors.line_bg},
    highlight = {colors.fg,colors.line_bg},
  }
}

gls.right[4] = {
  FileFormat = {
    provider = function()
      return fileinfo.get_file_encode():gsub("%s+", "")..'['..fileinfo.get_file_format()..']'
    end,
    separator = ' ',
    separator_highlight = {colors.fg,colors.line_bg},
    highlight = {colors.fg,colors.line_bg},
  },
}

gls.right[5] = {
  Percent = {
    provider = 'LinePercent',
    separator = ' ',
    separator_highlight = {colors.blue,colors.line_bg},
    highlight = {colors.bg,colors.red},
  }
}

gls.right[6] = {
  LineColumn = {
    provider = 'LineColumn',
    separator = '☰ ',
    separator_highlight = {colors.blue,colors.line_bg},
    highlight = {colors.fg,colors.line_bg,'bold'},
  },
}

gls.right[7] = {
  EndSpace = {
    provider = function() return '' end,
    separator = ' ',
  },
}

----------------
-- Short line --
----------------

gls.short_line_left[1] = {
  FileName = {
    provider = function()
      local modified = vim.api.nvim_buf_get_option(vim.api.nvim_get_current_buf(), 'modified')
      local filename_color = colors.fg
      if modified then
        filename_color = colors.magenta
      end
      vim.api.nvim_command('hi GalaxyFileName guifg='..filename_color)
      return fileinfo.get_current_file_name()
    end,
    separator = ' ',
    condition = buffer_not_empty,
    highlight = {colors.fg,colors.line_bg,'bold'},
    separator_highlight = {colors.fg,colors.line_bg,'bold'},
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    separator = '',
    separator_highlight = {colors.purple,colors.bg},
    highlight = {colors.fg,colors.purple}
  }
}

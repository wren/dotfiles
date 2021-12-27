-- Highlights colors in buffers (e.g. #00ff00)
local plugin = { 'RRethy/vim-hexokinase' }

plugin.run = 'make hexokinase'
plugin.event = 'CursorMoved'
plugin.setup = function()
  -- Settings --
  g.Hexokinase_highlighters = {
    -- 'virtual',
    -- 'sign_column',
    -- 'background',
    'backgroundfull',
    -- 'foreground',
    -- 'foregroundfull'
  }

  g.Hexokinase_optInPatterns = {
    'full_hex',
    'triple_hex',
    'rgb',
    'rgba',
    'hsl',
    'hsla',
    'colour_names'
  }

  -- Filetype specific patterns to match
  -- entry value must be comma seperated list
  g.Hexokinase_ftOptInPatterns = {
    css = 'full_hex,rgb,rgba,hsl,hsla,colour_names',
    html = 'full_hex,rgb,rgba,hsl,hsla,colour_names'
  }

  -- Only enable for these filetypes
  -- g.Hexokinase_ftEnabled = ['css', 'html', 'javascript']
end

table.insert(lvim.plugins, plugin)

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

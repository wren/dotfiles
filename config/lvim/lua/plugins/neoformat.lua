-- Keymap --
map('n', '<localleader>f', ':Neoformat<CR>')

-- Settings --
g.neoformat_try_formatprg = 1
g.jsx_ext_required = 0
g.neoformat_enabled_javascript = {'prettier'}
g.neoformat_enabled_json = {'jq'}
g.neoformat_enabled_html = {'js-beautify'}

-- Enable alignment
g.neoformat_basic_format_align = 1

-- Enable tab to spaces conversion
g.neoformat_basic_format_retab = 1

-- Enable trimmming of trailing whitespace
g.neoformat_basic_format_trim = 0

-- Which key --
local status, wk = pcall(require, "which-key")
if(status) then
  wk.register({
    ["<localleader>"] = {
      f =  "Format file",
    }
  })
end


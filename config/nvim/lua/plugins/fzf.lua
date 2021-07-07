
cmd 'set rtp+=/usr/local/opt/fzf'

g.fzf_action = {
  ['ctrl-t'] = 'tab split',
  ['ctrl-x'] = 'split',
  ['ctrl-v'] = 'vsplit'
}

g.fzf_colors = {
  fg      = {'fg', 'Normal'},
  bg      = {'bg', 'Normal'},
  hl      = {'fg', 'Comment'},
  ['fg+'] = {'fg', 'CursorLine', 'CursorColumn', 'Normal'},
  ['bg+'] = {'bg', 'CursorLine', 'CursorColumn'},
  ['hl+'] = {'fg', 'Statement'},
  info    = {'fg', 'PreProc'},
  border  = {'fg', 'Ignore'},
  prompt  = {'fg', 'Conditional'},
  pointer = {'fg', 'Exception'},
  marker  = {'fg', 'Keyword'},
  spinner = {'fg', 'Label'},
  header  = {'fg', 'Comment'}
}

-- ripgrep
if fn.executable('rg') == 1 then
  local rg_default_opts = {
    '--no-config',
    '--files',
    '--hidden',
    '--follow',
  }
  local rg_search_opts = {
    '--no-config',
    '--column',
    '--line-number',
    '--no-heading',
    '--fixed-strings',
    '--ignore-case',
    '--hidden',
    '--follow',
    '--color "always"',
    [['.shellescape(<q-args>).']],
    [[| tr -d "\017"]],
  }
  local rg_ignore_globs = {
    '--glob "!.git/*"',
    '--glob "!**/node_modules/*"',
    '--glob "!**/__pycache__/*"',
    '--glob "!*.lock"',
    '--glob "!**/Alfred.alfredpreferences/*"',
  }

  local my_opts = ''

  my_opts = table.concat(rg_ignore_globs, ' ') .. ' ' .. table.concat(rg_default_opts, ' ')
  cmd(string.format("let $FZF_DEFAULT_COMMAND='rg %s 2> /dev/null'", my_opts))

  my_opts = table.concat(rg_ignore_globs, ' ') .. ' ' .. table.concat(rg_search_opts, ' ')
  cmd(string.format("command! -bang -nargs=* Find call fzf#vim#grep('rg %s', 1, <bang>0)", my_opts))
end

local default_opts = table.concat({
  '--multi',
  '--bind ctrl-d:preview-page-down,ctrl-u:preview-page-up',
  '--layout=reverse',
}, ' ')
cmd(string.format("let $FZF_DEFAULT_OPTS='%s'", default_opts))

g.fzf_layout = {
  window = {
    relative = 'editor',
    width    = 0.8,
    height   = 0.5,
    border   = 'no',
  }
}

g.fzf_preview_window = {
  'right:50%',
  'ctrl-p',
}

-- @todo This one needs a lot of work to migrate to lua (worth it, but will do later)
cmd(string.format('source %s/legacy/fzf.vim', fn.stdpath('config')))

-- Keymap --
silent = { silent = true }
map('n', '<leader>fb', ':Buffers<CR>', silent)
map('n', '<leader>ft', ':Filetypes<CR>', silent)
map('n', '<M-C-p>', ':Buffers<CR>', silent)
map('n', '<C-p>', ':Files<CR>', silent)
map('n', '<leader>fp', ':Files<CR>')
map('n', '<leader>ff', ':Find<Space>')
map('n', '<leader>fm', ':Maps<CR>')
map('n', '<leader>fk', ':HelptagLines>')
map('n', '<leader>fl', ':Lines<CR>')
map('n', '<leader>fc', ':Commands<CR>')
map('n', '<leader>hf', ':History<CR>')
map('n', '<leader>hc', ':History:<CR>')
map('n', '<leader>hs', ':History/<CR>')
map('n', '<leader>fs', ':Colors<CR>', silent)
map('n',  '<leader>fw', ':Find <C-R><C-W><CR>', silent)
map('n',  'z=', ':call FzfSpell()<CR>', silent)

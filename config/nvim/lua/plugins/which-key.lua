-- Keymap --
opts = { silent = true }
map('n', '<leader>',  ':<c-u>WhichKey "<space>"<CR>', opts)
map('n', '<localleader>', ':<c-u>WhichKey  ";"<cr>', opts)
map('n', '[',             ':<c-u>WhichKey  "["<cr>', opts)
map('n', ']',             ':<c-u>WhichKey  "]"<cr>', opts)

-- Init --
vim.call('which_key#register', '<Space>', 'g:which_key_leader')
vim.call('which_key#register', ';', 'g:which_key_localleader')
vim.call('which_key#register', '[', 'g:which_key_prev')
vim.call('which_key#register', ']', 'g:which_key_next')

-- Settings --
g.which_key_use_floating_win = 0

-- Events --
nvim_create_augroup('which_key', {
  string.format(
    '%s | %s',
    'FileType which_key set laststatus=0 noshowmode noruler',
    'autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler'
  )
})

g.which_key_leader = {
  name = '+Root ' ,
  ['1'] = 'which_key_ignore'      ,
  ['2'] = 'which_key_ignore'      ,
  ['3'] = 'which_key_ignore'      ,
  ['4'] = 'which_key_ignore'      ,
  ['5'] = 'which_key_ignore'      ,
  ['6'] = 'which_key_ignore'      ,
  ['7'] = 'which_key_ignore'      ,
  ['8'] = 'which_key_ignore'      ,
  ['9'] = 'which_key_ignore'      ,
  ['0'] = 'which_key_ignore'     ,
  ['0-9']= 'select window 1-10'  ,
  b = {
    name = 'buffer +',
    c = 'keep current buffer',
    o = 'kill {numbers or name} buffer',
  },
  e = {
    name = '+explorer',
    f = 'find current file' ,
    o = 'open' ,
  },
  ['-'] = 'choose window by {prompt char}' ,
  f = {
    name = '+search {files cursorword word outline}',
    b = 'find buffers',
    f = 'find in project',
    c = 'find commands',
    p = 'find files in project',
    m = 'find mappings',
    w = 'find {word} in project',
    v = 'find in vista outline',
    h = {
      name = '+history',
      f= 'file history',
      c= 'command history',
      s= 'search history',
    },
  },
  l = 'clear search highlights' ,
  m = 'open mundotree' ,
  w = 'write file',
  p = 'edit pluginsconfig {filename}',
  g  ={
    name  = ' git +',
    d    = 'Gdiff',
    c    = 'Gcommit',
    b    = 'Gblame',
    B    = 'Gbrowse',
    S    = 'Gstatus',
    p    = 'git push',
    l    = 'GitLogAll',
    h    = 'GitBranch',
  },
  t = {
    name = '+tab-operate',
    n = 'new tab',
    e = 'edit tab',
    m = 'move tab',
  },
  q = 'quit window',
  ['/'] = 'comment/uncomment line',
  [' '] = {
    name = '+easymotion-jumpto-word ' ,
    b = {'<plug>(easymotion-b)' , 'beginning of word backward'},
    f = {'<plug>(easymotion-f)' , 'find {char} to the left'},
    w = {'<plug>(easymotion-w)' , 'beginning of word forward'},
  }
}

g.which_key_localleader ={
  name        = '+LocalLeaderKey'  ,
  t           = 'toggle markdown checkbox',
  s           = 'show theme classes on cursor word',
  [' ']       = 'clear trailing whitespace',
}

g.which_key_next = {
  name  = '+Next',
  a     = 'ale nextwarp',
  c     = 'next change',
  b     = 'next buffer',
  t     = 'next tab',
  [']'] = 'jump prefunction-golang',
}

g.which_key_prev = {
  name  = '+Previous',
  a     = 'ale prewarp',
  c     = 'previous change',
  b     = 'pre buffer',
  t     = 'previous tab',
  ['['] = 'jump nextfunction-golang',
}


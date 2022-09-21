nvim_define_filetypes({
  { '*.{hcl,tf}'                  , 'terraform' },
  { 'yarn.lock'                   , 'yaml'      },
  { '*.postman_collection'        , 'json'      },
  { '.tern-{project,port}'        , 'json'      },
  { '*.js.map'                    , 'json'      },
  { '.jsbeautifyrc'               , 'json'      },
  { '.eslintrc'                   , 'json'      },
  { '.jscsrc'                     , 'json'      },
  { '.babelrc'                    , 'json'      },
  { '.watchmanconfig'             , 'json'      },
  { '*.yaml,*.yml'                , 'yaml'      },
  { '.flowconfig'                 , 'ini'       },
  { '*.html,*.htm,*.gohtml,*.tpl' , 'html'      },
  { 'Tmuxfile,tmux/config'        , 'tmux'      },
  { 'Brewfile'                    , 'ruby'      },
  { '*/*config/bash/*'            , 'sh'        },
  { '*/*config/zsh/*'             , 'zsh'       },
  { '*/*config/git/*'             , 'gitconfig' },
  { '*/*ssh/configs/*'            , 'sshconfig' },
  { '*/*config/tmux/*'            , 'tmux'      },
  { '*.config'                    , 'gitconfig' },
  -- Dotfiles --
  { '*/Dotfiles/*/zsh/*'          , 'zsh'       },
  { '*/Dotfiles/*/git/*'          , 'gitconfig' },
  { '*/Dotfiles/*/ssh/*'          , 'sshconfig' },
  { '*/Dotfiles/*/bat/bat.config' , 'zsh'       },
  { '*/Dotfiles/*/bat/viewers.d/*', 'zsh'       },
})

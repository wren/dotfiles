return require('packer').startup {
  function(use)
    -- Packer can manage itself as an optional plugin
    use {
      'wbthomason/packer.nvim',
      opt = true
    }

    use {
      'glepnir/galaxyline.nvim',
      config = function() require 'plugins.galaxyline' end,
    }

    use 'vim-scripts/restore_view.vim'

    use 'tpope/vim-obsession'

    -- Enhance terminal compatibility (especially w/ tmux)
    use 'wincent/terminus'

    -- Better search with
    use 'junegunn/vim-pseudocl'
    use 'junegunn/vim-oblique'

    -- Color scheme
    -- use 'rakr/vim-one'
    use 'joshdick/onedark.vim'
    -- use 'sainnhe/sonokai'

    -- Highlights CSS colors inline
    use 'ap/vim-css-color'

    -- Highlight area being copied
    use 'machakann/vim-highlightedyank'

    -- Nice visual icons for filetypes and more
    use 'kyazdani42/nvim-web-devicons'

    -- Smooth/fast scrolling with j/k keys
    use 'rhysd/accelerated-jk'

    -- Fade text in inactive windows (while preserving syntax)
    -- Causes vimenter autocommand lag
    -- Worth keeping?
    -- use 'tadaa/vimade'

    -- Tab management
    -- use {
      -- 'romgrk/barbar.nvim', 
      -- config = function() require 'plugins.barbar' end
    -- }

    use {
      'akinsho/nvim-bufferline.lua',
      config = function() require 'plugins.bufferline' end
    }

    -- File Explorer --
    -- use {'Shougo/defx.nvim', run = function() vim.cmd [[UpdateRemotePlugins]] end }
    -- use 'kristijanhusak/defx-git'
    -- use 'kristijanhusak/defx-icons'

    use {
      'ms-jpq/chadtree', 
      branch = 'chad',
      run = 'python -m chadtree deps'
    }

    -- Misc
    use 'junegunn/vim-easy-align'

    use 'godlygeek/tabular'

    use 'yuttie/comfortable-motion.vim'

    -- Vim startuptime analysis (use with nvim +StartupTime)
    use 'dstein64/vim-startuptime'
    -- }}}
    -- 
    -- Navigation {{{

    -- Undo tree visualization
    use 'simnalamburt/vim-mundo'

    -- Better repeating with period command
    use 'tpope/vim-repeat'

    -- Pop-up cheatsheet for keyboard commands
    use 'liuchengxu/vim-which-key'

    -- Visual overlay to jump cursor to any part of screen
    use 'easymotion/vim-easymotion'

    -- More control over what motions apply to (like word separators)
    use 'wellle/targets.vim'
    use 'chaoren/vim-wordmotion'

    -- Navigate windows in vim and tmux with the same keys
    use 'christoomey/vim-tmux-navigator'

    -- }}}

    -- FZF {{{
    -- Fantastic fuzzy finder
    use {
      'junegunn/fzf.vim',
      requires = {
        'junegunn/fzf',
        run = vim.fn['fzf#install']
      },
      config = function() require 'plugins.fzf' end
    }

    -- }}}

    -- Versioning {{{

    -- Git integration
    use 'tpope/vim-fugitive'

    -- Inline git blame while you type
    use 'apzelos/blamer.nvim'

    -- Git integration
    use 'chemzqm/vim-easygit'

    -- Status markers in gutter
    use 'airblade/vim-gitgutter'

    use 'rhysd/committia.vim'
    -- }}}

    -- Languages {{{

    use 'honza/dockerfile.vim'

    use 'junegunn/vim-emoji'

    use 'Vimjas/vim-python-pep8-indent'

    use 'vim-python/python-syntax'

    use 'neoclide/vim-jsx-improve'

    use 'vim-scripts/xml.vim'

    use 'pearofducks/ansible-vim'

    use 'cespare/vim-toml'

    use 'elzr/vim-json'

    use 'dearrrfish/vim-applescript'

    use 'tpope/vim-cucumber'

    use 'fatih/vim-go'

    use 'tmux-plugins/vim-tmux'

    -- }}}

    -- Coding {{{
    -- Commenting
    use 'tyru/caw.vim'

    -- Auto formatting files by syntax
    use 'sbdchd/neoformat'

    -- Display thin vertical lines at each indentation level
    use 'Yggdroot/indentLine'

    -- LSP support for tags
    use 'liuchengxu/vista.vim'

    -- Parens matchings
    -- use 'luochen1990/rainbow'

    -- Matching various braces
    use 'andymass/vim-matchup'

    -- Support editorconfig files in projects
    use 'editorconfig/editorconfig-vim'

    -- Show function signature
    use 'Shougo/echodoc.vim'

    -- Search documentation (also works offline)
    use 'sunaku/vim-dasht'

    -- Completion engine
    -- Causes startup lag. Worth keeping?
    -- use {'ycm-core/YouCompleteMe', run = './install.py --all' }

    -- Turn statements into one-line or multi-line expressions
    use 'AndrewRadev/splitjoin.vim'

    -- Operations on matching charcs (e.g. parens, brackets, etc)
    use 'machakann/vim-sandwich'

    -- Multiple cursors
    use 'mg979/vim-visual-multi'

    use 'lfv89/vim-interestingwords'

    -- }}}

    -- Productivity {{{

    -- Toggle markdown checkboxes
    use 'jkramer/vim-checkbox'

    -- }}}

    -- Writing {{{
    -- use {'iamcco/markdown-preview.nvim', run = vim.fn['mkdp#util#install']}


    -- }}}

  end
}

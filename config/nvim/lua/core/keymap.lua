-- emacs-like emacs
inoremap <C-w> <esc>diwa
inoremap <C-h> <BS>
inoremap <C-d> <Del>
inoremap <C-k>  <ESC>d$a
inoremap <C-u> <C-G>u<C-U>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <Home>

-- command line alias
cnoremap w!! w !sudo tee % >/dev/null
cnoremap <C-p> <Up>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>
cnoremap <C-h> <BS>
cnoremap <C-t> <C-R>=expand("%:p:h") . "/" <CR>

-- Insert newlines without leaving normal mode
nnoremap <CR> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <S-CR> :set paste<CR>m`O<Esc>``:set nopaste<CR>

-- Comment/uncomment a line
nmap <c-_> gcc
vmap <c-_> gcc
imap <c-_> <esc>gcca

-- Indent/deindent lines, then reselect
vnoremap <tab> >gv
vnoremap <s-tab> <gv

-- Clear search highlights
nnoremap <silent> <c-l> :nohlsearch<CR>
vnoremap <silent> <c-l> :nohlsearch<CR>

-- Write buffer (save)
noremap <leader>w :w<CR>
noremap <leader>q <c-w>c
nnoremap <leader>Q :BufferClose<CR>
noremap QQ :qa<CR>

imap <C-S> <esc>:w<CR>a
imap <C-Q> <esc>:wq<CR>
nnoremap <C-x><C-x> :Bdelete!<CR>

-- make delete management delete management
nnoremap d "_d
nnoremap D "_D
xnoremap d "_d
xnoremap D "_D
vnoremap p "_dp
vnoremap P "_dP

--buffer operation
nnoremap <leader>bk :BufferCloseAllButCurrent<CR>
-- nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>bd :BufferClose<CR>
nnoremap <C-x> :BufferClose<CR>
nnoremap <C-x><C-x> :BufferClose!<CR>
-- Currently handled by wintab
nmap  [b :BufferPrevious<cr>
nmap  ]b :BufferNext<cr>
nnoremap <silent> <A-,> :BufferPrevious<CR>
nnoremap <silent> <A-.> :BufferNext<CR>
nnoremap <silent> <A-<> :BufferMovePrevious<CR>
nnoremap <silent> <A->> :BufferMoveNext<CR>
nnoremap [B :BufferMovePrevious<CR>
nnoremap ]B :BufferMoveNext<CR>

--navigate window
nnoremap <m-L> zL
nnoremap <m-H> zH

--smart move
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $

--tabline operation
noremap <leader>tn :tabnew<cr>
noremap <leader>te :tabedit
noremap <leader>tc :tabclose<cr>
noremap <leader>td :tcd %:p:h<cr>
nnoremap  [t :tabprevious<CR>
nnoremap  ]t :tabnext<CR>

--yank to end
nnoremap Y y$

-- settings for resize splitted window
nmap <leader>[ :vertical resize -3<CR>
nmap <C-w>] :vertical resize +3<CR>

-- Escape from terminal windows even if suspended
tnoremap <C-c> <C-\><C-n>:q!<CR>

-- Remove spaces at the end of lines
nnoremap <silent> <localleader><Space> :<C-u>silent! keeppatterns %substitute/\s\+$//e<CR>

-- nmap <leader>1 <Plug>BufTabLine.Go(1)
-- nmap <leader>2 <Plug>BufTabLine.Go(2)
-- nmap <leader>3 <Plug>BufTabLine.Go(3)
-- nmap <leader>4 <Plug>BufTabLine.Go(4)
-- nmap <leader>5 <Plug>BufTabLine.Go(5)
-- nmap <leader>6 <Plug>BufTabLine.Go(6)
-- nmap <leader>7 <Plug>BufTabLine.Go(7)
-- nmap <leader>8 <Plug>BufTabLine.Go(8)
-- nmap <leader>9 <Plug>BufTabLine.Go(9)
-- nmap <leader>0 <Plug>BufTabLine.Go(10)

-- Improve scroll, credits: https://github.com/Shougo
nnoremap <expr> zz (winline() == (winheight(0)+1) / 2) ?
	\ 'zt' : (winline() == 1) ? 'zb' : 'zz'
noremap <expr> <C-f> max([winheight(0) - 2, 1])
	\ ."\<C-d>".(line('w$') >= line('$') ? "L" : "M")
noremap <expr> <C-b> max([winheight(0) - 2, 1])
	\ ."\<C-u>".(line('w0') <= 1 ? "H" : "M")
noremap <expr> <C-e> (line("w$") >= line('$') ? "j" : "3\<C-e>")
noremap <expr> <C-y> (line("w0") <= 1         ? "k" : "3\<C-y>")


-- Disable some keymappings that don't do anything useful, and get in the way
map q: <Nop>
nnoremap Q <nop>

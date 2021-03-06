" default to UTF-8
set encoding=utf-8

" just to be sure
set nocompatible

" stop saving children
set shortmess+=I

" hail to the leader!
let mapleader = ','

" setup pathogen
let g:pathogen_disabled = []
call add(g:pathogen_disabled, 'vim-powerline')
execute pathogen#infect()
filetype plugin indent on

" configure vim-slime for tmux
let g:slime_target = "tmux"

" vim-airline powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_theme = 'solarized'

" set solarized theme
syntax on
set background=dark
colorscheme solarized

" searching
set hlsearch

" line numbers
set number

" highlight the cursorline
set cursorline

" show tabs, line endings and trailing spaces
set listchars=tab:▸\ ,eol:¬,trail:␣,extends:⇉,precedes:⇇,nbsp:·
set list

" no linewrapping
set nowrap

" fancy powerline symbols
let g:Powerline_symbols='fancy'

" stop bugging me with unsaved buffers
set hidden

" expansion of the active file directory
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>

if has("autocmd")
  " Enable file type detection
  filetype on

  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  " Customisations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType erb setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType json setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType coffee setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType php setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType cucumber setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType zsh setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType tf setlocal ts=2 sts=2 sw=2 expandtab

  autocmd FileType go set nolist

  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss,*.atom setfiletype xml
  autocmd BufNewFile,BufRead *.pp,Puppetfile setfiletype ruby

  " Thrift syntax highlighting
  autocmd BufNewFile,BufRead *.thrift setfiletype thrift
  autocmd FileType thrift setlocal ts=4 sts=4 sw=4 expandtab
endif

" configuration of vdebug
let g:vdebug_options = {}
let g:vdebug_options["debug_file"] = "~/.vdebug.log"
let g:vdebug_options["path_maps"] = {"/var/www/jimdo/prod": "/Users/hauke/code/jimdo-blob"}
let g:vdebug_options["server"] = '0.0.0.0'

" configuration of vim markdown
let g:vim_markdown_folding_disabled=1

" configuration of ack plugin
let g:ackprg="/usr/local/bin/ack -H --nocolor --nogroup --column"

" map FufBuffer
nnoremap <leader>f :FufBuffer<cr>

" map BufExplorer
nnoremap <leader>b :BufExplorer<cr>

" map NERDTreeToggle
nnoremap <leader>t :NERDTreeToggle<cr>

" easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" remap nohighlight
nnoremap <C-W><C-L> :nohl<cr>

" more natural split opening
set splitbelow
set splitright

" move single line up and down
nnoremap - dd\|p
nnoremap _ dd\|<up>\|P

" instantly edit my vim
nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" quick exit for visual mode
inoremap jj <esc>
" inoremap <esc> <nop>

" fast jump to line start / end
nnoremap H 0
nnoremap L $
nnoremap $ :echo 'meeep!'<cr>

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  let g:ackprg = 'ag --vimgrep'

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Enable goimports to automatically insert import paths instead of gofmt
let g:go_fmt_command = "goimports"

" Disable this backup shit
set nobackup
set nowritebackup
set noswapfile

" Setup awesome vim-go

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

au FileType go nmap <Leader>s <Plug>(go-implements)

au FileType go nmap <Leader>i <Plug>(go-info)

au FileType go nmap <Leader>e <Plug>(go-rename)


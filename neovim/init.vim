" Plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " auto-completion for various languages
Plug 'deoplete-plugins/deoplete-jedi'			" Auto-completion for Python 
Plug 'vim-airline/vim-airline'				" Status bar plugin
Plug 'vim-airline/vim-airline-themes'			" air-line themes
Plug 'jiangmiao/auto-pairs'				" Automatic quote and bracket completion
Plug 'preservim/nerdcommenter'				" Comment plugin
Plug 'preservim/nerdtree'				" File managing and exploration plugin
Plug 'morhetz/gruvbox'					" Color theme
Plug 'joshdick/onedark.vim'				" Color theme
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}	" Semantic Highlighting for Python in Neovim
Plug 'sbdchd/neoformat' 				" Code auto-format plugin
Plug 'davidhalter/jedi-vim'				" Auto-completion plugin for Python
Plug 'mg979/vim-visual-multi', {'branch': 'master'}	" Multiple cursor editing plugin
Plug 'tpope/vim-fugitive'				" Git wrapper plugin
Plug 'SirVer/ultisnips'					" Snippet engine for Vim
Plug 'honza/vim-snippets'				" vim-snipmate default snippets
Plug 'tpope/vim-eunuch'					" Helpers for UNIX

call plug#end()


"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


let g:deoplete#enable_at_startup = 1
let g:airline_theme='onedark'
" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


syntax on
colorscheme onedark 	" one of the: gruvbox onedark
set background=dark
set number 		" Show line numbers

"""""""""""""" custom commands 
""" moving lines
" Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" Insert mode
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi

" Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv


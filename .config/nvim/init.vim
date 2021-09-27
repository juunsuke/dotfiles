let skip_defaults_vim=1

call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'

call plug#end()


let g:gruvbox_contrast_dark = 'hard'
:colorscheme gruvbox

:set nocompatible
:syntax on
:set nu
:set iminsert=0
:set imdisable
:set noswf
:set ts=4
:set shiftwidth=4
:set autoindent
:set bs=2
:set nosmartindent
:set nocindent
:set indentexpr=""
:filetype indent off
:filetype plugin off

autocmd StdinReadPre * let s:std=in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | wincmd p | endif
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 | let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

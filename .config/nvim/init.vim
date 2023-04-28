:set nocompatible
let skip_defaults_vim=1

call plug#begin()

" Color schemes / Visual stuff
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'sainnhe/edge'

" File management/browsing
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Syntax / Language
Plug 'tikhomirov/vim-glsl'
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'ziglang/zig.vim'
"Plug 'nvim-lua/completion-nvim'
"Plug 'hrsh7th/cmp-nvim-lsp'
"Plug 'hrsh7th/cmp-buffer'
"Plug 'hrsh7th/nvim-cmp'

call plug#end()


let g:gruvbox_contrast_dark = 'hard'
":colorscheme gruvbox
":colorscheme onedark

if has('termguicolors')
  set termguicolors
endif

:colorscheme edge
let g:lightline = {'colorscheme' : 'edge'}

"let g:lightline = {
"      \ 'colorscheme': 'one',
"      \ }

let g:rust_recommended_style = 0
let g:rustfmt_options = '--config hard_tabs=true'
let g:rustfmt_autosave = 0
let g:rustfmt_fail_silently = 1


" LSP configuration
lua << END
local lspconfig = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  -- Forward to other plugins
  --require'completion'.on_attach(client)
end

local servers = { "rust_analyzer" }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)
END

"lua <<EOF
"  -- Setup nvim-cmp.
"  local cmp = require'cmp'
"
"  cmp.setup({
"    snippet = {
"      expand = function(args)
"        -- For `vsnip` user.
"        --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.
"
"        -- For `luasnip` user.
"        -- require('luasnip').lsp_expand(args.body)
"
"        -- For `ultisnips` user.
"        -- vim.fn["UltiSnips#Anon"](args.body)
"      end,
"    },
"    mapping = {
"      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
"      ['<C-f>'] = cmp.mapping.scroll_docs(4),
"      ['<C-Space>'] = cmp.mapping.complete(),
"      ['<C-e>'] = cmp.mapping.close(),
"      ['<CR>'] = cmp.mapping.confirm({ select = true }),
"      ['<tab>'] = cmp.mapping.confirm({ select = true }),
"    },
"    sources = {
"      { name = 'nvim_lsp' },
"
"      -- For vsnip user.
"      -- { name = 'vsnip' },
"
"      -- For luasnip user.
"      -- { name = 'luasnip' },
"
"      -- For ultisnips user.
"      -- { name = 'ultisnips' },
"
"      { name = 'buffer' },
"    }
"  })
"
"  -- Setup lspconfig.
"  require('lspconfig')["rust_analyzer"].setup {
"    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
"  }
"EOF


:set completeopt=menu,menuone,noinsert,noselect
:set cmdheight=1
:set updatetime=300

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
:set noshowmode
:set signcolumn=yes
:set nohlsearch
:filetype indent off
:filetype plugin off

:set colorcolumn=120


nnoremap <C-f> :Files<CR>

nnoremap <C-Space> <C-x><C-o>
inoremap <C-Space> <C-x><C-o>

nnoremap <S-Left> <C-PageUp>
nnoremap <S-Right> <C-PageDown>

inoremap <S-Left> <C-PageUp>
inoremap <S-Right> <C-PageDown>


:set mouse=a
:map <ScrollWheelUp> <C-Y>
:map <ScrollWheelDown> <C-E>




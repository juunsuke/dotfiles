
local lsp = require('lsp-zero').preset({})

lsp.ensure_installed({
	'rust_analyzer',
	--'sumneko_lua',
})

local cmp = require('cmp')
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<Tab>'] = cmp.mapping.confirm({select=true}),
	['<C-Space>'] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

require('lspconfig').rust_analyzer.setup({
	settings = {
		["rust-analyzer"] = {
			completion = {
				addCallParenthesis = false,
				callable = {
					snippets = "none"
				}
			}
		}
	}
})

lsp.setup()




local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- html, css lsp
require'lspconfig'.html.setup {
  capabilities = capabilities
}

require'lspconfig'.cssls.setup{
  capabilities = capabilities
}
-- typescript, javascript lsp
require'lspconfig'.tsserver.setup{}

-- python lsp
require'lspconfig'.pyright.setup{}

-- C, C++ lsp (clang)
require'lspconfig'.clangd.setup{
  cmd = { 'clangd',
		'--background-index',
		'--inlay-hints',
		'--clang-tidy',
		'--compile-commands-dir=build', }
}

-- DiagnosticSign styling
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

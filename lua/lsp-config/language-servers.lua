local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- html, css lsp
require 'lspconfig'.html.setup {
  capabilities = capabilities
}

require 'lspconfig'.cssls.setup {
  capabilities = capabilities
}
-- typescript, javascript lsp
require 'lspconfig'.tsserver.setup {
  capabilities = capabilities
}

-- python lsp
require 'lspconfig'.pyright.setup {
  capabilities = capabilities
}

-- C, C++ lsp (clang)
require 'lspconfig'.clangd.setup {
  cmd = { 'clangd',
    '--background-index',
     "--enable-config",
    "-log=verbose"
  }
}

-- lua lsp
require 'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- DiagnosticSign styling
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

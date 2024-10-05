local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- mason
require("mason").setup {
  ui = {
    border = "single",
    height = 0.8
  }
}

require("mason-lspconfig").setup {
  ensure_installed = { 'volar' }
}

local mason_registry = require('mason-registry')
local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path() .. '/node_modules/@vue/language-server'

-- html, css lsp
require 'lspconfig'.html.setup {
  capabilities = capabilities
}

require 'lspconfig'.cssls.setup {
  capabilities = capabilities
}
-- typescript, javascript lsp
require 'lspconfig'.ts_ls.setup {
  -- Initial options for the TypeScript language server
  init_options = {
    plugins = {
      {
        -- Name of the TypeScript plugin for Vue
        name = '@vue/typescript-plugin',

        -- Location of the Vue language server module (path defined in step 1)
        location = vue_language_server_path,

        -- Specify the languages the plugin applies to (in this case, Vue files)
        languages = { 'vue' },
      },
    },
  },

  -- Specify the file types that will trigger the TypeScript language server
  filetypes = {
    'typescript', -- TypeScript files (.ts)
    'javascript', -- JavaScript files (.js)
    'javascriptreact', -- React files with JavaScript (.jsx)
    'typescriptreact', -- React files with TypeScript (.tsx)
    'vue' -- Vue.js single-file components (.vue)
  },
}

require'lspconfig'.volar.setup{}

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
local signs = { Error = " ", Warn = "󱝾 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

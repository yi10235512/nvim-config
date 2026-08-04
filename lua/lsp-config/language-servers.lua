-- mason
require("mason").setup {
  ui = {
    border = "single",
    height = 0.8
  }
}

require("mason-lspconfig").setup {
  ensure_installed = { 'vue_ls', 'ts_ls' },
  automatic_enable = false,
}

local mason_registry = require('mason-registry')
local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path() ..
    '/node_modules/@vue/language-server'

-- Shared settings for every server (nvim-lspconfig only ships the defaults in
-- `lsp/`, the wiring below is core `vim.lsp.config` / `vim.lsp.enable`).
vim.lsp.config('*', {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

-- typescript, javascript lsp
vim.lsp.config('ts_ls', {
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
})

-- C, C++ lsp (clang)
vim.lsp.config('clangd', {
  cmd = { 'clangd',
    '--background-index',
    "--enable-config",
    "-log=verbose"
  }
})

-- lua lsp
vim.lsp.config('lua_ls', {
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
})

-- html, css, python servers use the defaults shipped by nvim-lspconfig
vim.lsp.enable({
  'html',
  'cssls',
  'ts_ls',
  'vue_ls',
  'pyright',
  'clangd',
  'lua_ls',
})

-- Diagnostic styling
vim.diagnostic.config {
  underline = true,
  virtual_text = {
    spacing = 5,
    severity = { min = vim.diagnostic.severity.WARN },
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = "󱝾 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
}

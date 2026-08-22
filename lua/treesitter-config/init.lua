require("nvim-treesitter").setup {
  -- A list of parser names, or "all"
  ensure_installed = { "html", "lua", "javascript", "cpp", "c", "python", "typescript", "markdown", "markdown_inline" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  --  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  autotag = {
    enable = true,
  },
  autopairs = {
    enable = true,
  },
  indent = {
    disable = { "typescript" },
  }
}

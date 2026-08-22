require('telescope').setup {
  defaults = {
    layout_config = {
      width = 0.8,
      prompt_position = "top",
      preview_cutoff = 120,
      preview_width = 0.6,
    },
    find_command = {
      'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'
    },
    prompt_prefix = "  ",
    selection_caret = "󰋇 ",
    multi_icon = "",
    file_sorter = require 'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = { 'node_modules', '.git' },
    generic_sorter = require 'telescope.sorters'.get_generic_fuzzy_sorter,
    path_display = {
      shorten = {
        len = 1,
        exclude = {1, -1, -2}
      }
    },
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
  }
}

local db = require('dashboard')
db.header_pad = 1
db.footer_pad = 5
db.hide_statusline = false
db.custom_header = {
  [[                                                    ]],
  [[                                                    ]],
  [[                                                    ]],
  [[                                                    ]],
  [[                                                    ]],
  [[                                                    ]],
  [[                                                    ]],
  [[                                                    ]],
  [[                       --------------------         ]],
  [[      ( ( (           <  Have a Nice Day ! >        ]],
  [[       ) ) )           --------------------         ]],
  [[    _........                                       ]],
  [[   [_|       |                   |\__/.|   (`\      ]],
  [[     \      /                  _.|o o  |___ ) )     ]],
  [[ -----`===='------------------(((---(((------------ ]],
  [[                                                    ]],
  [[                                                    ]],
  [[                                                    ]],
  [[                                                    ]],
}

db.custom_center = {
  { icon = '  ', desc = 'Load Sessions               ', action = ':lua MySessionLoad()' },
  { icon = '  ', desc = 'Recently Opened Files       ', action = 'Telescope oldfiles' },
  { icon = '  ', desc = 'Find File                   ', action = 'Telescope find_files find_command=rg,--files' },
  { icon = '  ', desc = 'Find Word                   ', action = 'Telescope live_grep' },
  { icon = '  ', desc = 'Edit Neovim                 ', action = 'edit ~/.config/nvim' },
}

db.custom_footer = {
  '\"We are all in the gutter, but some of us are looking at the stars.\"', '',
  '                                              - Oscar Wilde'
}

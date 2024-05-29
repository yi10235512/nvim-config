local db = require('dashboard')
db.setup({
  theme = 'doom',
  hide = {
    statusline,
    tabline,
    winbar
  },
  config = {
    header = {
      '',
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
      '',
      '',
    },
    center = {
      { icon = '  ', desc = 'Load Sessions           ', action = ':lua loadSession()' },
      { icon = '  ', desc = 'Recently Opened Files   ', action = 'Telescope oldfiles' },
      { icon = '  ', desc = 'Find File               ', action = 'Telescope find_files find_command=rg,--files' },
      { icon = '  ', desc = 'Find Word               ', action = 'Telescope live_grep' },
      { icon = '  ', desc = 'Edit Neovim             ', action = 'edit ~/.config/nvim' },
    },
    footer = {
      '',
      '',
      '\"We are all in the gutter, but some of us are looking at the stars.\"', '',
      '                                              - Oscar Wilde'
    }
  }
})

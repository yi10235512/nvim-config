require('toggleterm').setup {
  direction = 'horizontal',
  shade_terminals = false,
  open_mapping = [[<C-\>]],
  winbar = {
    enabled = false,
  },
  on_open = function(t)
    vim.schedule(function()
      if t.direction == 'horizontal' and t.window and vim.api.nvim_win_is_valid(t.window) then
        vim.api.nvim_win_call(t.window, function()
          vim.cmd('wincmd J')
        end)
        local conf = require('toggleterm.config').get()
        local size = type(conf.size) == 'function' and conf.size(t) or conf.size or 12
        vim.api.nvim_win_set_height(t.window, math.floor(size))
      end
      local ok, cc = pcall(require, 'claudecode-config')
      if ok and type(cc) == 'table' and cc.reposition_claude then
        cc.reposition_claude()
      end
    end)
  end,
}

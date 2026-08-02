local term = nil
local last_cmd = nil

local provider_setup_config = nil

local function term_width(effective_config)
  local cfg = effective_config or provider_setup_config or {}
  local pct = cfg.split_width_percentage or 0.35
  return math.floor(vim.o.columns * pct)
end

local function ensure_terminal(cmd_string, env_table, effective_config)
  if term and last_cmd ~= cmd_string then
    term:shutdown()
    term = nil
  end
  if not term then
    local Terminal = require('toggleterm.terminal').Terminal
    term = Terminal:new {
      cmd = cmd_string,
      env = env_table,
      -- Dedicated terminal ID to avoid taking over id=1
      count = 99,
      direction = 'vertical',
      hidden = true,
      close_on_exit = true,
      on_open = function(t)
        if t.window and vim.api.nvim_win_is_valid(t.window) then
          vim.api.nvim_win_call(t.window, function()
            vim.cmd('wincmd L')
          end)
          vim.api.nvim_win_set_width(t.window, term_width(nil))
          vim.wo[t.window].winfixwidth = true
        end
      end,
      on_exit = function()
        term = nil
        last_cmd = nil
      end,
    }
    last_cmd = cmd_string
  end
  return term
end

local function open_without_focus(t, size)
  local cur_win = vim.api.nvim_get_current_win()
  t:open(size, 'vertical')
  if vim.api.nvim_win_is_valid(cur_win) then
    vim.api.nvim_set_current_win(cur_win)
  end
end

local toggleterm_provider = {
  setup = function(config)
    provider_setup_config = config
  end,

  open = function(cmd_string, env_table, effective_config, focus)
    if focus == nil then
      focus = true
    end
    local t = ensure_terminal(cmd_string, env_table, effective_config)
    if focus then
      if not t:is_open() then
        t:open(term_width(effective_config), 'vertical')
      end
      t:focus()
    elseif not t:is_open() then
      open_without_focus(t, term_width(effective_config))
    end
  end,

  ensure_visible = function()
    if term and not term:is_open() then
      open_without_focus(term, term_width(nil))
    end
  end,

  close = function()
    if term and term:is_open() then
      term:close()
    end
  end,

  simple_toggle = function(cmd_string, env_table, effective_config)
    local t = ensure_terminal(cmd_string, env_table, effective_config)
    if t:is_open() then
      t:toggle()
    else
      t:toggle(term_width(effective_config), 'vertical')
    end
  end,

  focus_toggle = function(cmd_string, env_table, effective_config)
    local t = ensure_terminal(cmd_string, env_table, effective_config)
    if t:is_open() then
      if t:is_focused() then
        t:close()
      else
        t:focus()
      end
    else
      t:open(term_width(effective_config), 'vertical')
    end
  end,

  get_active_bufnr = function()
    if term and term.bufnr and vim.api.nvim_buf_is_valid(term.bufnr) then
      return term.bufnr
    end
    return nil
  end,

  is_available = function()
    return (pcall(require, 'toggleterm.terminal'))
  end,
}

require('claudecode').setup {
  terminal = {
    provider = toggleterm_provider,
    split_side = 'right',
    split_width_percentage = 0.35,
  },
  diff_opts = {
    layout = 'unified',
  },
}

local M = {}

-- Move the Claude terminal back to the far-right column and restore its fixed width.
-- Claude's own `on_open` callback is invoked, and ToggleTerm's global `on_open`
-- callback (used for regular terminals) is also triggered, ensuring that the
-- Claude terminal always stays docked on the far right whenever it is open.
function M.reposition_claude()
  if term and term:is_open() and term.window and vim.api.nvim_win_is_valid(term.window) then
    vim.api.nvim_win_call(term.window, function()
      vim.cmd('wincmd L')
    end)
    vim.api.nvim_win_set_width(term.window, term_width(nil))
  end
end

local function diff_action(action)
  local diff = require('claudecode.diff')
  if vim.b[vim.api.nvim_get_current_buf()].claudecode_diff_tab_name then
    diff[action]()
    return
  end
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.b[buf].claudecode_diff_tab_name then
      vim.api.nvim_win_call(win, function()
        diff[action]()
      end)
      return
    end
  end
  vim.notify('No Claude diff in this tab', vim.log.levels.WARN)
end

function M.diff_accept()
  diff_action('accept_current_diff')
end

function M.diff_deny()
  diff_action('deny_current_diff')
end

local layouts = { 'unified', 'vertical', 'horizontal' }
vim.api.nvim_create_user_command('ClaudeCodeDiffLayout', function(opts)
  local diff_opts = require('claudecode').state.config.diff_opts
  if opts.args ~= '' then
    diff_opts.layout = opts.args
  else
    local idx = 1
    for i, l in ipairs(layouts) do
      if diff_opts.layout == l then
        idx = i
        break
      end
    end
    diff_opts.layout = layouts[idx % #layouts + 1]
  end
  vim.notify('Claude diff layout: ' .. diff_opts.layout)
end, {
  nargs = '?',
  complete = function()
    return layouts
  end,
  desc = 'Cycle or set Claude diff layout (unified/vertical/horizontal)',
})

return M

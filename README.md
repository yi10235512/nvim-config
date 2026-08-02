# nvim-config
My Neovim configuration

## Requirements
- Neovim v0.10.0+ (for use lazy.nvim and built-in `gc` commenting)
- iTerm2 with nerdfont (for display devicons)

## Quick Start
1. Copy `lua/` and `init.lua` to `~/.config/nvim/` (or Clone this repository and save as `~/.config/nvim/` directly)
2. Start Neovim — [lazy.nvim](https://github.com/folke/lazy.nvim) bootstraps itself and installs every plugin on the first launch
3. Use `:Lazy` to check status, `:Lazy sync` to install/update/clean, `:Lazy restore` to pin everything back to `lazy-lock.json`

`lazy-lock.json` is committed, so a fresh clone reproduces the exact plugin versions. Run `:Lazy sync` and commit the updated lockfile whenever you bump plugins.

For Ubuntu users, if Neovim installed through APT cannot get a high enough version, remove it first, then add the [Neovim PPA](https://launchpad.net/~neovim-ppa/+archive/ubuntu/stable):
```
sudo apt-get remove neovim
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
```

## Language Server Protocol(LSP)
If language server is not installed, there will show the warning when opening the file.  
E.g. use nvim to open a `*.py` file will show a message like "_Spawning language server with cmd: `pyright-langserver` failed. The language server is either not installed, missing from PATH, or not executable._"

Following [**nvim-lspconfig**'s Quickstart](https://github.com/neovim/nvim-lspconfig#quickstart) can install ___pyright___ language server. After installation, open a python file and type `:LspInfo` or `<space> l i` will show the LSP information (should see "_1 client(s) attached to this buffer_" and the client is ___pyright___)

For more details about other language servers supported by **nvim-lspconfig** plugin, see [server_configurations.md](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md).

In [language-servers.lua](lua/lsp-config/language-servesrs.lua), six language servers were configured: ___cssls___, ___tsserver___, ___pyright___, ___clangd___, ___html___, ___lua_ls___.  
Uncomment/Delete unwanted language servers to get rid of warning.

## Plugins 
- [nord.nvim](https://github.com/shaunsingh/nord.nvim) : Neovim theme
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) : for syntax higelight
- [lualin.nvim](https://github.com/nvim-lualine/lualine.nvim) : status line
- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) : buffer line 
- [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) : file explorer (`<space> e` to toggle, `A` create file, `D` delete file, `r` for rename file)
- [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) : used for autoclose and autorename html tag 
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) : used for autopair
- [which-key](https://github.com/folke/which-key.nvim) : definded and displayed key bindings 
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) : beautiful & powerful fuzzy finder (`<space> f` and `<space> F`)
- [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) : open terminal in Neovim (`Ctrl + \` or `Control + \` to toggle)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) : used for config LSP clients ( keybindings prefix is `<space> l`)
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp), [cmp-buffer](https://github.com/hrsh7th/cmp-buffer), [cmp-path](https://github.com/hrsh7th/cmp-path), [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline) : source for **nvim-cmp** plugin
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) : completion engine
- [cmp-vsnip](https://github.com/hrsh7th/cmp-vsnip) : source for **vim-vsnip** plugin
- [vim-vsnip](https://github.com/hrsh7th/vim-vsnip) : create code snippets
- [lspkind](https://github.com/onsails/lspkind.nvim) : beautify the **nvim-cmp**
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) : signs for git (`<space> g D` and `<space> g d` can see diff, `<space> g R` can rollback)
- [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim) : used for customizing fancy start screen of Neovim 
- [claudecode.nvim](https://github.com/coder/claudecode.nvim) : Claude Code IDE integration (keybindings prefix is `<space> a`, see below)

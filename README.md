# nvim-config
My Neovim configuration

## Requirements
- Neovim v0.5.0+ (for use packer)
- iTerm2 with nerdfont (for display devicons)

## Quick Start
1. Clone this repository and save as ~/.config/nvim
2. Install [packer.nvim](https://github.com/wbthomason/packer.nvim#quickstart)
3. in Neovim, type `:PackerInstall` 

For Ubuntu users, if getting the message "Not an editor command: PackerInstall" 
Check the Neovim version and update it to v0.5.0+.
If Neovim installed through APT cannot get the version higher than v0.5.0. 
Remove neovim first, then add (Neovim PPA)[https://launchpad.net/~neovim-ppa/+archive/ubuntu/stable]
```
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update
```
install Neovim again after updating finished.
Check the Neovim version and run `:PackerInstall` again.

## Language Server Protocol(LSP)
If language server is not installed, there will show the warning when opening the file.
e.g. use nvim to open a `*.py` file will show a message like "Spawning language server with cmd: `pyright` failed. The language server is either not installed, missing from PATH, or not executable."

Follow [nvim-lspconfig's Quickstart](https://github.com/neovim/nvim-lspconfig#quickstart) can install the pyright language server.
open a python file and type `:LspInfo` or `<space> l i` can show the LSP information(should see "1 client(s) attached to this buffer" and the client is pyright)

For more details about other language servers supported by nvim-lspconfig plugin, see [server configurations.md](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)

In `/lua/lsp-config/language-servesrs.lua`, five language servers were configured: `cssls`, `tsserver`, `pyright`, `clangd`, `html` 
Uncomment/Delete unwanted language servers to get rid of warning.

## Plugins 
- [nord.nvim](https://github.com/shaunsingh/nord.nvim): Neovim theme
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): for syntax higelight
- [lualin.nvim](https://github.com/nvim-lualine/lualine.nvim): status line
- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim): buffer line 
- [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua): file explorer (`<space> e` to toggle) 
- [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag): used for autoclose and autorename html tag 
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs): used for autopair
- [which-key](https://github.com/folke/which-key.nvim): definded and displayed key bindings 
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim): beautiful & powerful fuzzy finder (`<space> f` and `<space> F`)
- [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim): open terminal in Neovim (`Ctrl + \`/`Control + \` to toggle)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig): used for config LSP clients
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp), [cmp-buffer](https://github.com/hrsh7th/cmp-buffer), [cmp-path](https://github.com/hrsh7th/cmp-path), [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline): source for nvim-cmp plugin
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp): completion engine
- [cmp-vsnip](https://github.com/hrsh7th/cmp-vsnip): source for vim-vsnip plugin
- [vim-vsnip](https://github.com/hrsh7th/vim-vsnip): create code snippets
- [lspkind](https://github.com/onsails/lspkind.nvim): beautify the nvim-cmp
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim): signs for git
- [nvim-comment](https://github.com/terrortylor/nvim-comment): easily comment depends on filetype (`gcc` for comment line)

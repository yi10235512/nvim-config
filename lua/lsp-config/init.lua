require('lsp-config/cmp')
require('lsp-config/language-servers')

-- auto formatting after write
vim.cmd("autocmd BufWritePost *.jsx,*.js :lua vim.lsp.buf.formatting()")


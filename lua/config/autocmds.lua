-- dont really know if this is even needed?

vim.cmd([[
augroup jdtls_lsp
autocmd!
autocmd FileType java lua require'config.jdtls'.setup_jdtls()
augroup end
]])

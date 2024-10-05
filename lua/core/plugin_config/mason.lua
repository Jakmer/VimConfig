-- Mason configuration
require("mason").setup()
-- LSP for C/C++
require("mason-lspconfig").setup({
  ensure_installed = { "clangd" },  -- Install clangd
})
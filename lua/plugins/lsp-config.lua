return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "rust_analyzer", "bashls", "clangd" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local function on_attach(client, bufnr)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { buffer = bufnr })
        vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { buffer = bufnr })
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })
        vim.keymap.set("n", "<leader>f", function() 
          vim.lsp.buf.format({ bufnr = bufnr }) 
        end, { noremap = true, silent = true })
      end

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach
      })

      lspconfig.clangd.setup({
        capabilities = capabilities,
        root_dir = lspconfig.util.root_pattern("compile_commands.json", ".git"),
        handlers = {
          ["textDocument/publishDiagnostics"] = function() end
        },
        on_attach = on_attach
      })

      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
        on_attach = on_attach
      })

      lspconfig.bashls.setup({
        capabilities = capabilities,
        filetypes = { "sh", "bash" },
        on_attach = on_attach
      })

      lspconfig.texlab.setup({
        capabilities = capabilities,
        on_attach = on_attach
      })
    end
  }
}

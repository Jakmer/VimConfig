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
        ensure_installed = { "lua_ls", "rust_analyzer", "bashls", "clangd", "pyright", "julials", "omnisharp", "texlab", "cmake" }
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
        vim.keymap.set("n", "<leader>fc", function()
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
        settings = {
          clangd = {
            diagnostics = {
              enable = true,
            },
          },
        },
        on_attach = on_attach,
        cmd = { "clangd", "--fallback-style=none" },
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

      lspconfig.pyright.setup({
        capabilities = capabilities,
        on_attach = on_attach
      })

      lspconfig.julials.setup({
        cmd = { "julia", "--startup-file=no", "--history-file=no", "-e", "using LanguageServer, SymbolServer; server = LanguageServer.LanguageServerInstance(stdin, stdout); run(server)" },
        filetypes = { "julia" },
        root_dir = lspconfig.util.root_pattern("Project.toml", ".git"),
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          julia = {
            format = {
              indent = 4,
              indentChar = " ",
              useTabs = false,
            },
            diagnostics = {
              enable = true,
            },
            languageServer = {
              useCompiler = true,
            }
          }
        }
      })

    lspconfig.omnisharp.setup{
        cmd = { "dotnet", "/home/jakub/Tools/omnisharp/OmniSharp.dll" },
        on_attach = on_attach,
        capabilities = capabilities,
        root_dir = lspconfig.util.root_pattern(".git", "global.json", "*.sln", "*.csproj"),
        settings = {
            omnisharp = {
                useModernNet = true,
            },
        },
    }

    lspconfig.texlab.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          texlab = {
            build = {
              executable = "latexmk",
              args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
              onSave = true
            },
            forwardSearch = {
              executable = "zathura",
              args = { "--synctex-forward", "%l:1:%f", "%p" }
            },
            lint = {
              onChange = true
            },
          }
        }
      })

    lspconfig.cmake.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        cmd = { "cmake-language-server" },
        filetypes = { "cmake" },
        root_dir = lspconfig.util.root_pattern("CMakeLists.txt", ".git"),
    })

    end
  }
}

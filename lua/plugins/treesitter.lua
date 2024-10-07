return {
  'nvim-treesitter/nvim-treesitter',
  url = 'git@github.com:nvim-treesitter/nvim-treesitter.git',
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {"lua", "javascript"},
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true }
    })
  end
}

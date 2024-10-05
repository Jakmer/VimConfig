-- ~/.config/nvim/lua/core/plugin_config/tokyonight.lua
require("tokyonight").setup({
  style = "night",  -- Opcje: night, storm, day, moon
  transparent = false,  -- Przezroczystość
})

vim.cmd("colorscheme tokyonight")  -- Ustaw motyw


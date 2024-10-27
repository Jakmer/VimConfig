return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup{
      open_mapping = [[<c-t>]],
      direction = 'horizontal',
      size = 20,
    }
    local opts = { noremap = true, silent = true }

    vim.api.nvim_set_keymap('t', '<C-n>', [[<C-\><C-n>]], opts)

    vim.api.nvim_set_keymap('t', '<C-v>', [[<C-\><C-n>v]], opts)
  end
}

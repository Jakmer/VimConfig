return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  init = function() 
    vim.g.barbar_auto_setup = false 
  end,
  config = function()
    require('barbar').setup({
    })

    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    -- Move to previous/next buffer
    map('n', '<C-h>', '<Cmd>BufferPrevious<CR>', opts)
    map('n', '<C-l>', '<Cmd>BufferNext<CR>', opts)
  end,
}

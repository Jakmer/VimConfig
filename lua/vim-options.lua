vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- for c++ files set 4 spaces
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cpp", "c", "h" },
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 4
    vim.bo.shiftwidth = 4
  end,
})

vim.g.mapleader = ' '

-- Sets the minimum number of lines visible around the cursor.
-- The screen will start scrolling when the cursor is within 10 lines from the top or bottom of the visible area.
vim.opt.scrolloff = 10

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

-- use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.o.smartindent = true

vim.cmd [[ set noswapfile ]]
vim.cmd [[ set termguicolors ]]

--Line numbers
vim.wo.number = true
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Restart lsp
vim.keymap.set('n', '<leader>lp', ':LspRestart<CR>')

-- Paste from system clipboard in normal mode
vim.api.nvim_set_keymap('n', 'p', '"+p', { noremap = true, silent = true })

-- Paste from system clipboard in visual mode (replaces selection)
vim.api.nvim_set_keymap('v', 'p', '"+p', { noremap = true, silent = true })


vim.api.nvim_set_keymap('n', 'y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'yy', '"+yy', { noremap = true, silent = true })

-- Delete and copy to system clipboard
vim.api.nvim_set_keymap('n', 'd', '"+d', { noremap = true, silent = true })  -- Normal delete
vim.api.nvim_set_keymap('n', 'dd', '"+dd', { noremap = true, silent = true })  -- Normal delete
vim.api.nvim_set_keymap('v', 'd', '"+d', { noremap = true, silent = true })  -- Visual delete

-- Map Ctrl + J in insert mode to exit to normal mode
vim.api.nvim_set_keymap('i', '<C-J>', '<Esc>', { noremap = true, silent = true })

-- Map Ctrl + J in visual mode to exit to normal mode
vim.api.nvim_set_keymap('v', '<C-J>', '<Esc>', { noremap = true, silent = true })

-- Some setting for latex
vim.cmd([[filetype plugin indent on]])
vim.cmd([[syntax enable]])

vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_compiler_method = 'latexmk'

-- Auto save
vim.api.nvim_create_autocmd({"InsertLeave", "TextChanged"}, {
  pattern = "*",
  callback = function()
    if vim.fn.expand("%:e") ~= "lua" and vim.bo.modifiable and vim.bo.modified then
      vim.cmd("silent! write")
    end
  end
})

-- Show file full path
vim.api.nvim_set_keymap('n', '<leader>p', ':echo expand("%:p")<CR>', { noremap = true, silent = true})

-- Enable line wrapping globally
vim.opt.wrap = true

-- Set mouse off
vim.opt.mouse = ""

-- Set relative number
vim.opt.number = true
vim.opt.relativenumber = true

-- Set python
vim.g.python3_host_prog = '/usr/bin/python3'

vim.api.nvim_set_keymap('n', '<leader>lp', ':LspRestart<CR>', { noremap = true, silent = true })


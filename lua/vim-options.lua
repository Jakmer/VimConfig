vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.g.mapleader = ' '

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

vim.cmd [[ set noswapfile ]]
vim.cmd [[ set termguicolors ]]

--Line numbers
vim.wo.number = true
vim.keymap.set('n', '<leader>h', 'nohlsearch<CR>')

-- Paste from system clipboard in normal mode
vim.api.nvim_set_keymap('n', 'p', '"+p', { noremap = true, silent = true })

-- Paste from system clipboard in visual mode (replaces selection)
vim.api.nvim_set_keymap('v', 'p', '"+p', { noremap = true, silent = true })


vim.api.nvim_set_keymap('n', 'y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'yy', '"+yy', { noremap = true, silent = true })

-- Map Ctrl + J in insert mode to exit to normal mode
vim.api.nvim_set_keymap('i', '<C-J>', '<Esc>', { noremap = true, silent = true })

-- Map Ctrl + J in visual mode to exit to normal mode
vim.api.nvim_set_keymap('v', '<C-J>', '<Esc>', { noremap = true, silent = true })

-- Some setting for latex
vim.cmd([[filetype plugin indent on]])
vim.cmd([[syntax enable]])

vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_compiler_method = 'latexmk'

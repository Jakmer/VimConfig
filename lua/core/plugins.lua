local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use "nvim-tree/nvim-tree.lua" -- File explorer
  use "nvim-tree/nvim-web-devicons" -- Icons
  use "folke/tokyonight.nvim" -- Theme
  use "nvim-lualine/lualine.nvim" -- Status line
  use 'williamboman/mason.nvim' -- Mason plugin
  use 'williamboman/mason-lspconfig.nvim' -- Mason LSP config
  use 'neovim/nvim-lspconfig' -- LSP configurations
  use 'hrsh7th/nvim-cmp' -- autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- snippet plugin
  use 'saadparwaiz1/cmp_luasnip' -- snippet source for nvim-cmp
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn
--
-- ensure that packer is installed
--
local install_path = '~/.local/share/nvim/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  execute 'packadd packer.nvim'
end
vim.cmd('packadd packer.nvim')
local packer = require 'packer'
local util = require 'packer.util'
packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})
--
--- startup and add configure plugins
--
packer.startup(function()
  local use = use
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-fugitive'
  use { 'nvim-treesitter/nvim-treesitter', branch = 'master' }
  use 'pantharshit00/vim-prisma'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'
  use { 'hrsh7th/vim-vsnip' }
  use 'L3MON4D3/LuaSnip'
  use 'nvim-lualine/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'onsails/lspkind-nvim'
  use 'tpope/vim-surround'
  use 'j-hui/fidget.nvim'
  use 'nvim-treesitter/playground'
  use "williamboman/mason.nvim"
  use 'hashivim/vim-terraform'
  use {
    "jiaoshijie/undotree",
  }
  use 'leoluz/nvim-dap-go'
  use "EdenEast/nightfox.nvim"
  use 'towolf/vim-helm'
  use { "zbirenbaum/copilot.lua" }
  use "zbirenbaum/copilot-cmp"
end
)

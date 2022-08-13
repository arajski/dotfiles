local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn
--
-- ensure that packer is installed
--
local install_path = '~/.local/share/nvim/site/pack/packer/start/packer.nvim' 
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end
vim.cmd('packadd packer.nvim')
local packer = require'packer'
local util = require'packer.util'
packer.init({
    package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})
--
--- startup and add configure plugins
--
packer.startup(function()
    local use = use
    use 'wbthomason/packer.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'tpope/vim-fugitive'
    use 'pantharshit00/vim-prisma'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'
    use 'L3MON4D3/LuaSnip'
    use 'nvim-lualine/lualine.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'whatyouhide/vim-gotham'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'leafgarland/typescript-vim'
    use 'peitalin/vim-jsx-typescript'
    use 'scrooloose/nerdtree'
    use 'jparise/vim-graphql'
    use 'onsails/lspkind-nvim'
end
)

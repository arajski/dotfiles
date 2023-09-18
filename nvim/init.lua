--edito
vim.opt.syntax = 'on'
vim.opt.nu = true 
vim.opt.rnu = true
vim.opt.colorcolumn = '100'
vim.opt.scrolloff = 10
vim.opt.signcolumn = 'yes'
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.list = false
vim.opt.spelllang = 'en_us'
vim.opt.spell = true
--vim.opt.listchars = 'eol:¬'
--undreline
vim.opt.cursorline = false
vim.opt.errorbells = false
--tab settings
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
--indentation
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
--buffers
vim.opt.hidden = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath('config') .. '/undodir'
vim.opt.undofile = true
--search
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true

--
--IMPORTS
--
require("mappings")
require("colorscheme")
require("line")
require("plugins")

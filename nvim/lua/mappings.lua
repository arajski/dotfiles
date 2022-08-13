local map = function(mode, key, result)
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    {noremap = true, silent = true}
  )
end

-- Change leader to a space
vim.g.mapleader = ' '

map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

map('v', '<C-y>','"*y')
map('i', '<C-a>', '<Esc>la')
map('n', '<C-l>', '<C-w>l')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-h>', '<C-w>h')

map('i', '(<leader>', '()<Esc>i')
map('i', '{<leader>', '{}<Esc>i')
map('i', '{<CR>', '{<CR>}<Esc>O')
map('i', '[<leader>', '[]<Esc>i')
map('i', '(<CR>', '(<CR>)<Esc>O')
map('i', '[<CR>', '[<CR>]<Esc>O')
map('i', '<>', '<><Esc>i')
map('n', '<leader>p', '<cmd>Telescope find_files<cr>')
map('n', '<leader>f', '<cmd>Telescope live_grep<cr>')

map('n', '<leader>gh', ':diffget //2<CR>')
map('n', '<leader>gl', ':diffget //3<CR>')
map('n', '<leader>e', ':Ex<CR>')
map('n', '<leader>=', ':vertical resize +10<CR>')
map('n', '<leader>-', ':vertical resize -10<CR>')
map('n', '<space>gj', '<cmd>lua vim.diagnostic.open_float()<CR>')


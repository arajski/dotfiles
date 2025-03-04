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
map('n', '<C-l>', '<C-w>l')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-h>', '<C-w>h')

map('i', '{<CR>', '{<CR>}<Esc>O')
map('i', '(<CR>', '(<CR>)<Esc>O')
map('i', '[<CR>', '[<CR>]<Esc>O')
map('n', '<leader>p', '<cmd>Telescope find_files<cr>')
map('n', '<leader>f', '<cmd>Telescope live_grep<cr>')

-- git
map('n', '<leader>gh', ':diffget //2<CR>')
map('n', '<leader>gl', ':diffget //3<CR>')
map('n', '<leader>ga', ':G<CR>')
map('n', '<leader>gc', ':G commit<CR>')
map('n', '<leader>gp', ':G push<CR>')

-- windows
map('n', '<leader>e', ':Ex<CR>')
map('n', '<leader>=', ':vertical resize +10<CR>')
map('n', '<leader>-', ':vertical resize -10<CR>')
map('n', '<space>do', '<cmd>lua vim.diagnostic.open_float()<CR>')

-- moving around
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')

-- testing
map('n', '<space>tt', '<cmd>lua require("neotest").run.run()<CR>')
map('n', '<space>tf', '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>')
map('n', '<space>td', '<cmd>lua require("neotest").run.run({strategy="dap"})<CR>')
map('n', '<space>to', '<cmd>lua require("neotest").output.open({ enter = true })<CR>')

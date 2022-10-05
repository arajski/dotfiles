vim.g.neoformat_try_node_exe=1

local fmt = vim.api.nvim_create_augroup("fmt", {
  clear = false
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = {"*.ts", "*.tsx"},
  command = "Neoformat",
  group = fmt,
})

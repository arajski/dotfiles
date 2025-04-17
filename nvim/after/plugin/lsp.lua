local cmp = require 'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      -- setting up snippet engine
      -- this is for vsnip, if you're using other
      -- snippet engine, please refer to the `nvim-cmp` guide
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ behaviour = cmp.ConfirmBehavior.Replace, select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'copilot' },
    { name = 'vsnip' },
    { name = 'buffer' }
  })
})

local opts = { noremap = true, silent = true }
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
  end
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
vim.diagnostic.config({
  virtual_text = true,
})

require("lspconfig").solargraph.setup {
  cmd = { os.getenv("HOME") .. "/.rbenv/shims/solargraph", 'stdio' },
  capabilities = capabilities,
  on_attach = on_attach,
}

require("lspconfig").gopls.setup {
  on_attach = on_attach,
  settings = {
    gopls = {
      env = {
        GOFLAGS = "-tags=integration"
      },
      buildFlags = { "-tags=integration unit bench" },
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  }
}

require('lspconfig').pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

require("lspconfig").lua_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require("lspconfig").terraformls.setup {}


require("lspconfig").helm_ls.setup {
  settings = {
    ['helm-ls'] = {
      yamlls = {
        path = "yaml-language-server",
      }
    }
  }
}

require("lspconfig").yamlls.setup {}

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*.tf", "*.tfvars" },
  callback = function()
    vim.lsp.buf.format()
  end,
})

vim.o.completeopt = "menuone,noinsert,noselect"

require("fidget").setup {}
require("mason").setup {}

require("copilot").setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
})

require("copilot_cmp").setup()

vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    local mode = vim.api.nvim_get_mode().mode
    local filetype = vim.bo.filetype
    if vim.bo.modified == true and mode == 'n' then
      vim.cmd('lua vim.lsp.buf.format()')
    else
    end
  end
})

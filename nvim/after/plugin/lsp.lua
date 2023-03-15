 local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-e>'] = cmp.mapping({
           i = cmp.mapping.abort(),
           c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({behaviour = cmp.ConfirmBehavior.Replace, select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' }
        })
      })

local opts = {noremap=true, silent=true} 
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({
          filter = function(client)
            return client.name == "null-ls"
          end,
          bufnr = bufnr})
      end,
    })
  end
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
require("lspconfig").tsserver.setup {
 capabilities = capabilities,
 on_attach = on_attach,
}

require("lspconfig").gopls.setup{
 on_attach = on_attach,
 settings = {
   gopls = {
     analyses = {
       unusedparams = true,
     },
     staticcheck = true,
   },
 }
}

require('lspconfig').pyright.setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

require("lspconfig").rust_analyzer.setup{
   on_attach=on_attach,
   settings = {
     ["rust-analyzer"] = {
       imports = {
         granularity = {
           group = "module",
         },
         prefix = "self",
       },
       cargo = {
         buildScripts = {
           enable = true,
         },
       },
       procMacro = {
         enable = true
       },
     }
   }
}

require("lspconfig").eslint.setup({
	capabilities = capabilities,
})

vim.o.completeopt="menuone,noinsert,noselect"

vim.api.nvim_create_autocmd("FileType", {
 pattern = "go",
 callback = function()
   vim.bo.expandtab = false
 end,
})

require("fidget").setup{}

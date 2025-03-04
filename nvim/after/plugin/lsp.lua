 local cmp = require'cmp'
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
        ['<CR>'] = cmp.mapping.confirm({behaviour = cmp.ConfirmBehavior.Replace, select = true }),
    },
    sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'vsnip' },
          { name = 'buffer' }
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
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").solargraph.setup {
 cmd = { os.getenv( "HOME" ) .. "/.rbenv/shims/solargraph", 'stdio' },
 capabilities = capabilities,
 on_attach = on_attach,
}

require("lspconfig").gopls.setup{
 on_attach = on_attach,
 settings = {
   gopls = {
     env = {
       GOFLAGS="-tags=integration"
     },
     buildFlags =  {"-tags=integration unit bench"},
     analyses = {
       unusedparams = true,
     },
     staticcheck = true,
   },
 }
}

require('lspconfig').pyright.setup{
    on_attach = on_attach,
   capabilities = capabilities
}

require("lspconfig").lua_ls.setup({
   on_attach = on_attach,
   capabilities = capabilities,
})

require("lspconfig").terraformls.setup{}


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

vim.api.nvim_create_autocmd({"BufWritePre"}, {
  pattern = {"*.tf", "*.tfvars"},
  callback = function()
    vim.lsp.buf.format()
  end,
})

require("lspconfig").templ.setup({
   on_attach = on_attach,
   capabilities = capabilities,
})

vim.filetype.add({ extension = { templ = "templ" }})

vim.o.completeopt="menuone,noinsert,noselect"

vim.api.nvim_create_autocmd("FileType", {
 pattern = "go",
 callback = function()
   vim.bo.expandtab = false
 end,
})

local templ_fmt = function()
    if vim.bo.filetype == "templ" then
        local bufnr = vim.api.nvim_get_current_buf()
        local filename = vim.api.nvim_buf_get_name(bufnr)
        local cmd = "templ fmt " .. vim.fn.shellescape(filename)

        vim.fn.jobstart(cmd, {
            on_exit = function()
                -- Reload the buffer only if it's still the current buffer
                if vim.api.nvim_get_current_buf() == bufnr then
                    vim.cmd('e!')
                end
            end,
        })
    else
        vim.lsp.buf.format()
    end
end

vim.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { "*.templ" }, callback = templ_fmt })

require("fidget").setup{}
require("mason").setup{}
require("lspconfig").tsserver.setup {
 capabilities = capabilities,
 on_attach = on_attach,
}
 require("neotest").setup({
  adapters = {
    require("neotest-go")({
      experimental = {
        test_table = true,
      },
      args = { "-v", "-count=1", "-timeout=60s" }
    })
  }
})

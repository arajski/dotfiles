local null_ls = require("null-ls")
null_ls.setup({
	sources = {
      null_ls.builtins.formatting.gofmt,
    	null_ls.builtins.formatting.prettierd,
--   	null_ls.builtins.formatting.opentofu_fmt,
      null_ls.builtins.diagnostics.terraform_validate,
      null_ls.builtins.diagnostics.tfsec
	},
})

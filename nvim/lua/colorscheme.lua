vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.g.gruvbox_italic = 1
vim.g.gruvbox_bold = 0
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_sign_column = 'bg0'
vim.g.material_style = "darker"
require('rose-pine').setup({
	--- @usage 'auto'|'main'|'moon'|'dawn'
	variant = 'auto',
	--- @usage 'main'|'moon'|'dawn'
	dark_variant = 'main',
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = false,
	disable_float_background = false,
	disable_italics = true,

	--- @usage string hex value or named color from rosepinetheme.com/palette
	groups = {
		background = 'base',
		background_nc = '_experimental_nc',
		panel = 'surface',
		panel_nc = 'base',
		border = 'highlight_med',
		comment = 'muted',
		link = 'iris',
		punctuation = 'subtle',
	},
})

vim.g.nord_bold = false
vim.g.nord_italic=false

vim.g.everforest_background='hard'
vim.g.everforest_better_performance=1
vim.g.everforest_ui_contrast='low'
vim.g.everforest_disable_italic_comment=1
vim.g.everforest_dim_inactive_windows=0
color_overrides = {}
color_overrides["bg0"]='#232A2E'
vim.g.everforest_colors_override=color_overrides

require("everforest").setup({
  background = "hard",
  transparent_background_level = 0,
  italics = false,
  disable_italic_comments = false,
})
require('kanagawa').setup({
  compile = true,             -- enable compiling the colorscheme
  undercurl = true,            -- enable undercurls
  functionStyle = {},
  typeStyle = {},
  statementStyle = { italic = false, bold = false },
  commentStyle = { italic = false, bold = false },
  keywordStyle = { italic = false, bold = false },
  transparent = false,         -- do not set background color
  dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
  terminalColors = true,       -- define vim.g.terminal_color_{0,17}
  colors = {                   -- add/modify theme and palette colors
    palette = {},
    theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
  },
  overrides = function(colors)
    local theme = colors.theme
    return {
      ["@constant.builtin"] = { bold = false, italic = false },
      ["@variable.builtin"] = { bold = false, italic = false },
      ["@keyword.operator"] = { bold = false, italic = false },
      ["@operator"] = { bold = false, italic = false },
      ["@comment"] = { fg = colors.palette.dragonBlack6, bold = false, italic = false },
      Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
      PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
      PmenuSbar = { bg = theme.ui.bg_m1 },
      PmenuThumb = { bg = theme.ui.bg_p2 },
    }
  end,
  theme = "dragon",              -- Load "wave" theme when 'background' option is not set
  background = {               -- map the value of 'background' option to a theme
    dark = "dragon",           -- try "dragon" !
    light = "lotus"
  },
})
vim.cmd("colorscheme kanagawa")

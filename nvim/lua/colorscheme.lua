vim.opt.termguicolors = true
vim.opt.background = 'dark'

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

require('solarized').setup({
  theme = 'neo',
  styles = {
    comments = { italic = false, bold = false },
    functions = { italic = false },
    variables = { italic = false },
    parameters = { italic = false },
  },
  hightlights = {}
})

require("gruvbox").setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = false,
  bold = false,
  italic = {
    strings = false,
    emphasis = false,
    comments = false,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "hard", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})

require("catppuccin").setup({
    flavour = "auto", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false, -- disables setting the background color.
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    color_overrides = {},
    custom_highlights = function(colors)
      return {
        goBlock = { fg = colors.none, bg = colors.none },
        goParen = { fg = colors.none, bg = colors.none },
      }
    end,
    default_integrations = true,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

vim.cmd("colorscheme terafox")

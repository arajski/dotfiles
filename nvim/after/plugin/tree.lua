local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
 },
  indent = {
    enable = true,
    disable = {},
  },
  auto_install = true,
  ensure_installed = {
    "tsx",
    "javascript",
    "json",
    "yaml",
    "css",
    "html",
    "lua",
    "svelte",
    "go",
    "rust"
  },
  autotag = {
    enable = true,
  },
}

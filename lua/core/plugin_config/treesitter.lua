require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "cpp", "c_sharp", "css", "html", "json", "markdown", "php", "python", "typescript" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}

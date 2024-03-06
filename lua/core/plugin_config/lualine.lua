require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'vscode',
    disabled_filetypes = {
      statusline = { "toggleterm" },
      winbar = { "toggleterm" },
    },
  },
  sections = {
    lualine_a = {
      {
        'filename',
        path = 1,
      }
    }
  }
}


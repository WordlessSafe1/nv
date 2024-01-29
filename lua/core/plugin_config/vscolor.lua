vim.o.termguicolors = true


local c = require('vscode.colors').get_colors()
require('vscode').setup({
  transparent = true,
  italic_comments = true,
  disable_nvim_tree_bg = true,

  color_overrides = {
    vscLineNumber = '#FFFFFF',
  },

  group_overrides = {
    Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
  }
})
require('vscode').load()


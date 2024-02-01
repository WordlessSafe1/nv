require('nvim-listchars').setup({
	save_state = false, -- If enabled, save toggled state in a cache file. Will overwrite current `vim.opt.list` value.
	listchars = { -- `listchars` to be displayed. See available options by running `:help listchars`
		tab = "→ ",
		--trail = "-",
		nbsp = "+",
		space = "•",
	},
	exclude_filetypes = {}, -- List of filetypes where `listchars` is disabled
	lighten_step = 10, -- Amount to add/remove from base color
})

vim.cmd(':ListcharsEnable')
vim.api.nvim_set_hl(0, 'Whitespace', { fg='#4a4a4a', })

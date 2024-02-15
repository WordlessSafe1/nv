local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


local plugins = {
  'wbthomason/packer.nvim',
  {'ellisonleao/gruvbox.nvim', enabled = false},
  {'bluz71/vim-moonfly-colors', enabled = false},
  'Mofiqul/vscode.nvim',
  'nvim-tree/nvim-tree.lua',
  'nvim-lualine/lualine.nvim',
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
  },
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  'rafamadriz/friendly-snippets',
  '0xfraso/nvim-listchars',
  'lewis6991/gitsigns.nvim',
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  "onsails/lspkind.nvim",
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = { {'nvim-lua/plenary.nvim'} }
  },
  'nvim-tree/nvim-web-devicons',
  {
    "utilyre/barbecue.nvim",
    --tag = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
  },
}

local opts = {};

require("lazy").setup(plugins, opts);


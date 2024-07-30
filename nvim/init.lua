vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"
require("plugins")


-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- Initialize vim-plug
vim.cmd([[
  call plug#begin('~/.local/share/nvim/plugged')

  " Specify your plugins here
  Plug 'neovim/nvim-lspconfig'     
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'tpope/vim-fugitive'         
  Plug 'ThePrimeagen/vim-be-good'  
  Plug 'nvim-lua/plenary.nvim'
  " End plugin section
  call plug#end()
]])

local lspconfig = require('lspconfig')
lspconfig.pyright.setup{}

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"
require('custom.mappings')

vim.schedule(function()
  require "mappings"
end)

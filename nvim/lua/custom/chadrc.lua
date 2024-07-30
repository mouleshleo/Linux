-- ~/.config/nvim/lua/custom/chadrc.lua

-- Set Python 3 host program
vim.g.python3_host_prog = '/usr/bin/python3'

-- Ensure Python 3 provider is loaded
vim.g.loaded_python3_provider = nil

-- Load plugins
local customPlugins = {
  { "neovim/nvim-lspconfig" },   -- Configure language servers
  { "hrsh7th/nvim-cmp" },        -- Completion framework
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
}

local M = {}
M.plugins = {
  install = customPlugins,
}

-- Function to set key mappings for specific filetypes
local api = vim.api

local function set_keymaps()
  -- C file mappings
  api.nvim_create_autocmd("FileType", {
    pattern = "c",
    callback = function()
      api.nvim_buf_set_keymap(0, "n", "<F9>", ":w <bar> !gcc % -o %:r<CR>", { noremap = true, silent = true })
      api.nvim_buf_set_keymap(0, "n", "<F10>", ":!%:r<CR>", { noremap = true, silent = true })
    end,
  })

  -- Java file mappings
  api.nvim_create_autocmd("FileType", {
    pattern = "java",
    callback = function()
      api.nvim_buf_set_keymap(0, "n", "<F9>", ":w <bar> !javac %<CR>", { noremap = true, silent = true })
      api.nvim_buf_set_keymap(0, "n", "<F10>", ":!java %:r<CR>", { noremap = true, silent = true })
    end,
  })

  -- Python file mappings
  api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
      api.nvim_buf_set_keymap(0, "n", "<F10>", ":w <bar> !python -u %<CR>", { noremap = true, silent = true })
    end,
  })
end

-- Call the function to set key mappings
set_keymaps()

return M


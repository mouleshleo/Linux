-- Map <leader>c to compile the C file
vim.api.nvim_set_keymap('n', '<leader>c', ':w<CR>:!gcc % -o %:r && ./%:r<CR>', { noremap = true, silent = true })

 vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n','<leader>j',':w<CR>:!javac % && java %:r<CR>',{noremap = true,silent = true})

require "nvchad.mappings"
-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("i","sout","System.out.println();<Left><Left>")
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("i","pf","printf(\"\\n\");<Left><Left><Left><Left><Left>")
map({"n","i","v"},"<leader>a","<ESC>gg\"+yG",{noremap = true,desc = "copy all the content of the page"})

vim.keymap.set("", "<Space>", "<Nop>")
vim.keymap.set("", "<BS>", "<Nop>")

-- Keywordprg
vim.keymap.set("n", "<leader>K", "<cmd>norm! K<cr>")

-- list
vim.keymap.set("n", "<leader>l", "<cmd>set list!<cr>")

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

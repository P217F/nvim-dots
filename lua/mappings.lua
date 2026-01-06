require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")


map('n', '<C-Left>', '<CMD>vertical resize -1<CR>', { silent = true })
map('n', '<C-Right>', '<CMD>vertical resize +1<CR>', { silent = true })
map('n', '<C-Down>', '<CMD>resize +1<CR>', { silent = true })
map('n', '<C-Up>', '<CMD>resize -1<CR>', { silent = true })

vim.api.nvim_set_keymap('n', '<C-z>', 'u', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-z>', '<Esc>u', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-z>', '<Esc>u', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-y>', '<C-r>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-y>', '<Esc><C-r>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-y>', '<Esc><C-r>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<F1>', ':sp<CR>', { noremap=true, silent=true })
vim.api.nvim_set_keymap('n', '<F2>', ':vs<CR>', { noremap=true, silent=true })

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "gruvbox",
}

M.ui = {
  tabufline = {
    enabled = true,
    lazyload = false,
    show_on_single_buffer = true,
  },
}

M.terminal = {
  n = {
    ["<C-h>"] = { "<cmd>wincmd h<CR>", "window left" },
    ["<C-l>"] = { "<cmd>wincmd l<CR>", "window right" },
    ["<C-j>"] = { "<cmd>wincmd j<CR>", "window down" },
    ["<C-k>"] = { "<cmd>wincmd k<CR>", "window up" },
  },
  t = {
    ["<C-h>"] = { "<C-\\><C-n><cmd>wincmd h<CR>", "terminal left" },
    ["<C-l>"] = { "<C-\\><C-n><cmd>wincmd l<CR>", "terminal right" },
    ["<C-j>"] = { "<C-\\><C-n><cmd>wincmd j<CR>", "terminal down" },
    ["<C-k>"] = { "<C-\\><C-n><cmd>wincmd k<CR>", "terminal up" },
  },
}

M.general = {
  n = {
    ["<Tab>"]   = { "<cmd>bnext<CR>", "Next buffer" },
    ["<S-Tab>"] = { "<cmd>bprevious<CR>", "Prev buffer" },
  },
}

return M

return {
  "nvzone/showkeys",
  cmd = "ShowkeysToggle",
  opts = {
    timeout = 2,
    maxkeys = 6,
    show_count = true,
    excluded_modes = { "" },
    position = "top-right",
    winopts = {
      relative = "editor",
      border = "rounded",
      row = 1,
      col = 0,
      zindex = 50,
    },
    keyformat = {
      ["<Space>"] = "SPC",
      ["<CR>"]    = "RET",
      ["<Esc>"]   = "ESC",
      ["<Tab>"]   = "TAB",
      ["<BS>"]    = "BS",
    },
  },
}

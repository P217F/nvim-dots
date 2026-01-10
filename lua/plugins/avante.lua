return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  build = vim.fn.has("win32") ~= 0
    and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    or "make",
  version = false,

  opts = {
    instructions_file = "avante.md",
    provider = "openai",
    providers = {
      openai = {
        endpoint = "https://api.openai.com/v1",
        model = "gpt-5-mini",
        timeout = 30000,
        extra_request_body = {
          temperature = 0.2,
          top_p = 0.1,
          max_tokens = 2048,
        },
      },
    },
  },

  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-tree/nvim-web-devicons",
  },
}

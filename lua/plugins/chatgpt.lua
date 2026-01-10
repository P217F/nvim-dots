return {
  "jackMort/ChatGPT.nvim",
  cmd = {
    "ChatGPT",
    "ChatGPTActAs",
    "ChatGPTEditWithInstructions",
  },
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "folke/trouble.nvim",
    "nvim-telescope/telescope.nvim",
  },

  config = function()
    require("chatgpt").setup({
      openai_params = {
        model = "gpt-5-mini",
        temperature = 0.2,
        top_p = 0.1,
        max_tokens = 2048,
        frequency_penalty = 0,
        presence_penalty = 0,
        n = 1,
      },
    })
  end,
}

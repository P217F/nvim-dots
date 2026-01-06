return {
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
      require("nvchad.configs.lspconfig").defaults()

      local capabilities =
        require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(_, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      end

      require("plugins.lsp.clangd").setup(on_attach, capabilities)
      require("plugins.lsp.pyright").setup(on_attach, capabilities)

      vim.api.nvim_create_autocmd("CursorHold", {
        callback = function()
          vim.diagnostic.open_float(nil, {
            focus = false,
            scope = "cursor",
            border = "rounded",
          })
        end,
      })
    end,
  },
}

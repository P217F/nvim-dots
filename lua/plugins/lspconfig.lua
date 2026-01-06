return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      end

      local clangd_config = {
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--completion-style=detailed",
          "--cross-file-rename",
        },
        capabilities = capabilities,
        on_attach = on_attach,
        root_dir = function(fname)
          local found = vim.fs.find({ ".clangd", "compile_commands.json", ".git" }, { upward = true, path = fname })
          return #found > 0 and vim.fs.dirname(found[1]) or vim.fn.getcwd()
        end,
      }

      local pyright_config = {
        cmd = { "pyright-langserver", "--stdio" },
        capabilities = capabilities,
        on_attach = on_attach,
        root_dir = function(fname)
          local found = vim.fs.find({ "pyrightconfig.json", ".git", "pyproject.toml", "setup.py" }, { upward = true, path = fname })
          return #found > 0 and vim.fs.dirname(found[1]) or vim.fn.getcwd()
        end,
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "c", "cpp", "h", "hpp", "objc", "objcpp" },
        callback = function()
          local clients = vim.lsp.get_clients({ bufnr = 0 })
          for _, c in ipairs(clients) do
            if c.name == "clangd" then return end
          end
          vim.lsp.start(clangd_config)
        end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "python",
        callback = function()
          local clients = vim.lsp.get_clients({ bufnr = 0 })
          for _, c in ipairs(clients) do
            if c.name == "pyright" then return end
          end
          vim.lsp.start(pyright_config)
        end,
      })

      vim.api.nvim_create_autocmd("CursorHold", {
        callback = function()
          vim.diagnostic.open_float(nil, { focus = false, scope = "cursor", border = "rounded" })
        end,
      })

      vim.diagnostic.config({
        virtual_text = false,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN]  = " ",
            [vim.diagnostic.severity.HINT]  = " ",
            [vim.diagnostic.severity.INFO]  = " ",
          },
        },
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })
    end,
  },
}

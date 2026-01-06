local M = {}

function M.setup(on_attach, capabilities)
  vim.lsp.config.clangd = {
    cmd = {
      "clangd",
      "--background-index",
      "--clang-tidy",
      "--completion-style=detailed",
      "--cross-file-rename",
    },
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "c", "cpp", "objc", "objcpp", "h", "hpp" },
    root_dir = function(bufnr)
      return vim.fs.root(bufnr, {
        ".clangd",
        "compile_commands.json",
        ".git",
      })
    end,
  }

  vim.lsp.enable("clangd")
end

return M

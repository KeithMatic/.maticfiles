local M = {}

local augroup = require("mvim.util").augroup

--- @param client vim.lsp.Client
--- @param buffer number
function M.on_attach(client, buffer)
  if client.supports_method("textDocument/codeLens") then
    augroup(("LspCodeLens:%d"):format(buffer), {
      event = { "BufEnter", "CursorHold", "InsertLeave" },
      buffer = buffer,
      command = vim.lsp.codelens.refresh,
      desc = "Toggle codelens",
    })
  end
end

return M

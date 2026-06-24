local M = {}

function M.hover()
  vim.lsp.buf.hover({
    border = "rounded",
    focusable = true,
    max_width = math.max(80, math.floor(vim.o.columns * 0.75)),
    max_height = math.max(20, math.floor(vim.o.lines * 0.5)),
  })
end

function M.signature_help()
  vim.lsp.buf.signature_help({
    border = "rounded",
    focusable = true,
    max_width = math.max(80, math.floor(vim.o.columns * 0.75)),
    max_height = math.max(12, math.floor(vim.o.lines * 0.4)),
  })
end

return M

local function module_exists(name)
  local ok, _ = pcall(require, name)

  return ok
end

require("set")
require("remap")

WITH_CATS = module_exists("nixCats")
if not WITH_CATS then
  require("lze")
end

DEFAULT_COLOR = "sonokai"
-- DEFAULT_COLOR = "gruvbox"
DEFAULT_BAR_COLOR = "none"

vim.diagnostic.config({
  virtual_text = {
    prefix = '●',
  },
})

vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])
vim.cmd("TransparentEnable")

SC()

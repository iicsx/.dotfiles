require("pck")
require("set")
require("remap")

DEFAULT_COLOR = "oh-lucy"
DEFAULT_BAR_COLOR = "none"

vim.diagnostic.config({
  virtual_text = {
    prefix = '●',
  },
})

function sync_all()
  require("packer").sync()

  vim.cmd("TSUpdate")
  vim.cmd("MasonUpdate")
end

vim.cmd([[autocmd VimEnter * lua sync_all()]])

vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])

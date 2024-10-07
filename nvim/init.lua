require("pck")
require("set")
require("remap")

DEFAULT_COLOR = "oh-lucy"

function sync_all()
  require("packer").sync()

  vim.cmd("TSUpdate")
  vim.cmd("MasonUpdate")
end

vim.cmd([[let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro']])

vim.cmd([[autocmd VimEnter * lua sync_all()]])

vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])

vim.diagnostic.config({
  virtual_text = {
    prefix = '●',
  },
})

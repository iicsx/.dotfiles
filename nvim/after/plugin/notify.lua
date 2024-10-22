require("notify").setup({
  background_colour = "#000000",
  render = "default",
  stages = "slide",
  timeout = 3000,
  top_down = false,
  on_open = function(win)
    local height = vim.api.nvim_win_get_height(win)
    local width = vim.api.nvim_win_get_width(win)
    local row = vim.o.lines - height - 3

    vim.api.nvim_win_set_config(win, { relative = 'editor', row = row, col = (vim.o.columns - width) / 2 })
  end,
})

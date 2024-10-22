require("notify").setup({
  background_colour = "#000000",
  render = "default",
  stages = "slide",
  timeout = 3000,
  top_down = false,
  on_open = function(win)
    vim.api.nvim_win_set_config(win, {
      -- vim.cmd [[:TransparentEnable]]
    })
  end,
})

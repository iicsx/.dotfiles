require("notify").setup({
  -- level = vim.log.levels.DEBUG,
  background_colour = "#000000",
  render = "compact",
  stages = "fade",
  timeout = 3000,
  top_down = false,
  on_open = function(win)
    vim.api.nvim_win_set_config(win, {
      -- vim.cmd [[:TransparentEnable]]
    })
  end,
})

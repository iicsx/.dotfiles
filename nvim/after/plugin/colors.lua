local function set_telescope_colors()
  local elements = {
    "TelescopeBorder",
    "TelescopePromptBorder",

    "TelescopeResultsTitle",
    "TelescopePreviewTitle",
    "TelescopePromptTitle",

    "TelescopeResultsNormal",
    "TelescopePreviewNormal",
    "TelescopePromptNormal",
  }

  for _, element in ipairs(elements) do
    vim.api.nvim_set_hl(0, element, { fg = "white", bg = "none" })
  end
end

function setColor(color)
  color = color or "oxocarbon"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "FloatBorder", { fg = "white", bg = "none" })

  vim.cmd('highlight SignColumn guibg=NONE')

  set_telescope_colors()
end

setColor()

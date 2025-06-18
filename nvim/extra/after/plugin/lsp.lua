local lsp = require('lsp-zero')

if not WITH_CATS then
  require('mason').setup({
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
      },
      border = "rounded",
    }
  })
  require('mason-lspconfig').setup({
    ensure_installed = {
      "ts_ls",
      "eslint",
      "rust_analyzer",
    },
    handlers = {
      lsp.default_setup,
    },
  })

  local cmp = require('cmp')
  local lspkind = require('lspkind')

  local cmp_select = { behavior = cmp.SelectBehavior.Select }
  local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-Space>'] = cmp.mapping.confirm({ select = true }),
    ['<C-y>'] = cmp.mapping.complete()
  })

  cmp.setup({
    mapping = cmp_mappings,
    window = {
      completion = {
        border = 'rounded',
      },
      documentation = {
        border = 'rounded',
      },
    },
    formatting = {
      format = lspkind.cmp_format({
        mode = 'symbol', -- show only symbol annotations
        maxwidth = {
          -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
          -- can also be a function to dynamically calculate max width such as
          -- menu = function() return math.floor(0.45 * vim.o.columns) end,
          menu = 50,              -- leading text (labelDetails)
          abbr = 50,              -- actual suggestion item
        },
        ellipsis_char = '...',    -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
        show_labelDetails = true, -- show labelDetails in menu. Disabled by default

        -- The function below will be called before any actual modifications from lspkind
        -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
        before = function(entry, vim_item)
          -- ...
          return vim_item
        end
      })
    }
  })
end

lsp.preset('recommended')

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function()
    vim.lsp.buf.hover { border = "rounded", max_height = 25, max_width = 120 }
  end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  --	vim.keymap.set("n", "<leader>vd", function() vim.diagnostics,open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostics.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostics.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

require("lspconfig").rust_analyzer.setup({
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        command = "clippy"
      }
    }
  }
})

if WITH_CATS then
  -- LSP Servers
  local lspconfig = require("lspconfig")

  lspconfig.pyright.setup({})
  lspconfig.lua_ls.setup({})
  lspconfig.nil_ls.setup({})
  lspconfig.marksman.setup({})
  lspconfig.rust_analyzer.setup({})
  lspconfig.ts_ls.setup({})
  lspconfig.yamlls.setup({})
  lspconfig.bashls.setup({})
  lspconfig.emmet_language_server.setup({})
  lspconfig.clangd.setup({
    cmd = { "clangd", "--offset-encoding=utf-16" }, -- Custom command for clangd
  })
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = "rounded" }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = "rounded" }
)

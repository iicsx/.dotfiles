local M = {}

M.plugins = {
  -- git
  'tpope/vim-fugitive',

  -- Tree Sitter
  'nvim-treesitter/nvim-treesitter',
  'nvim-treesitter/nvim-treesitter-context',
  'nvim-treesitter/playground',

  -- LSP
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      { 'neovim/nvim-lspconfig' },
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
    }
  },
  'onsails/lspkind.nvim',
  'windwp/nvim-ts-autotag',

  -- File Management
  'theprimeagen/harpoon',
  "stevearc/oil.nvim",
  {
    'nvim-telescope/telescope.nvim',
    version = '0.1.4',
    dependencies = { { 'nvim-lua/plenary.nvim' } }
  },

  -- Undotree
  'mbbill/undotree',

  -- Themes
  'olivercederborg/poimandres.nvim',
  'Tsuzat/NeoSolarized.nvim',
  'Yazeed1s/oh-lucy.nvim',
  'sainnhe/sonokai',
  "folke/tokyonight.nvim",

  -- Visual
  "HiPhish/rainbow-delimiters.nvim",
  'echasnovski/mini.indentscope',
  'nvim-tree/nvim-web-devicons',
  'xiyaowong/transparent.nvim',
  'lewis6991/gitsigns.nvim',
  'romgrk/barbar.nvim',
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
  },
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },
  {
    'nvimdev/dashboard-nvim',
    dependencies = {
      'MaximilianLloyd/ascii.nvim',
    }
  },
  "norcalli/nvim-colorizer.lua",

  -- Formatting
  'elentok/format-on-save.nvim',
  'MunifTanjim/prettier.nvim',
  'm4xshen/autoclose.nvim',
  'alvan/vim-closetag',

  -- Linting
  "danarth/sonarlint.nvim",

  -- Markdown
  {
    'MeanderingProgrammer/markdown.nvim',
    dependencies = {
      { 'nvim-tree/nvim-web-devicons',    lazy = true },
      { 'nvim-treesitter/nvim-treesitter' }
    }
  },

  "oflisback/obsidian-bridge.nvim",
  "coddingtonbear/obsidian-local-rest-api",
  "epwalsh/obsidian.nvim",

  -- MISC --
  "diepm/vim-rest-console",
  "chomosuke/typst-preview.nvim",
  {
    "sphamba/smear-cursor.nvim",
    opts ={
      smear_between_buffers = false,
      smear_insert_mode = true,
      legacy_computing_symbols_support = true,
    }
  },
  "echasnovski/mini.animate",

  -- Git integration
  "iicsx/gint-nvim",

  -- AI Integration
  -- "robitx/gp.nvim",
  -- 'github/copilot.vim',

  'numToStr/Comment.nvim',
  { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},

  'nvim-mini/mini.ai'
}

return M

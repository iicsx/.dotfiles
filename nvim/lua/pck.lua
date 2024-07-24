vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use('wbthomason/packer.nvim')
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('nvim-treesitter/nvim-treesitter-context', {run = ':TSUpdate'})
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('williamboman/mason.nvim')
  use('williamboman/mason-lspconfig.nvim')
  use('m4xshen/autoclose.nvim')
  use('nyoom-engineering/oxocarbon.nvim')
  use('echasnovski/mini.indentscope')
  use('MunifTanjim/prettier.nvim')
  use('github/copilot.vim')
  use('elentok/format-on-save.nvim')
  use('andweeb/presence.nvim')
  use("stevearc/oil.nvim")

  use('nvim-tree/nvim-web-devicons') 
  use('lewis6991/gitsigns.nvim') 
  use('romgrk/barbar.nvim')
  use('alvan/vim-closetag')

  use('AlexvZyl/nordic.nvim')

  use('roflolilolmao/oceanic-next.nvim')
  use('xiyaowong/transparent.nvim')

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.4',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
    'MeanderingProgrammer/markdown.nvim',
    after = { 'nvim-treesitter' },
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
        require('render-markdown').setup({})
    end,
  })

  use({
	  "folke/tokyonight.nvim",
	  config = function()
		  require("tokyonight").setup({
			  style = "moon", 
		  })
	  end,
  })

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		  {'neovim/nvim-lspconfig'},
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'L3MON4D3/LuaSnip'},
	  }
  }

  use {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      requires = { 
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons", 
          "MunifTanjim/nui.nvim",
      }
  }

end)

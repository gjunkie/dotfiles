local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'

  use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client

  use({'scalameta/nvim-metals',
    config = function()
      require('configs.metals-config')
    end,
  })

  -- Nvim Tree file explorer
  use({
    "kyazdani42/nvim-tree.lua",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require('configs.nvim-tree-config')
    end,
  })

  use({
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = require("configs.gitsigns-config"),
  })

  use({'nvim-lualine/lualine.nvim',
    config = function()
      require('configs.lualine-config')
    end,
  })

  use({'nvim-treesitter/nvim-treesitter',
	  requires = { "p00f/nvim-ts-rainbow" },
    config = require("configs.treesitter-config"),
	})

	use({
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "onsails/lspkind-nvim", -- Adds icons to autocompletion menu
            -- cmp requires a snippet engine
            "hrsh7th/cmp-vsnip",
            "hrsh7th/vim-vsnip",
        },
        config = require("configs.nvim-cmp-config"),
	})

  -- use { 'autozimu/LanguageClient-neovim', branch = 'next', run = 'bash install.sh'}

  -- Linting
  use({'w0rp/ale',
    config = require('configs.ale-config'),
  })

  use 'vimwiki/vimwiki'

  use 'arcticicestudio/nord-vim'

    -- Emmet/Snippets
  use({
    "mattn/emmet-vim",
    requires = { "mattn/webapi-vim" },
    config = function()
        vim.cmd([[
    let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.config/nvim/snippets.json')), "\n"))
  ]])
    end,
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- Colorschemes
-- Plug {'cocopon/iceberg.vim'}
-- Plug 'gjunkie/vim-grid-color'}
-- Plug 'sonph/onehalf', { 'rtp': 'vim' }

--Plug 'Raimondi/delimitMate'}

-- Syntax Highlighting
-- Plug 'godlygeek/tabular'}
-- Plug 'plasticboy/vim-markdown'}
-- Plug 'MaxMEllon/vim-jsx-pretty'}
-- Plug 'amadeus/vim-xml'}
-- Plug 'pangloss/vim-javascript'}
-- Plug 'jparise/vim-graphql'}


-- Plug {'leafgarland/typescript-vim'}
-- Plug {'peitalin/vim-jsx-typescript'}
-- Plug {'ianks/vim-tsx'}
-- Plug {'yuezk/vim-js'}

-- Use release branch (recommend)
-- Plug {'nvim-lua/plenary.nvim'}
-- Plug {'neovim/nvim-lsp'}

-- Plug {'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}}
-- Plug {'janko/vim-test'}

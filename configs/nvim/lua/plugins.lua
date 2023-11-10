local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'       -- Packer can manage itself

  use 'kyazdani42/nvim-web-devicons' -- File icons

  -- Fuzzy searcher
  use 'nvim-lua/plenary.nvim' -- Common utilities
  use 'nvim-telescope/telescope.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
  }

  use 'onsails/lspkind-nvim'               -- vscode-like pictograms
  use 'hrsh7th/cmp-buffer'                 -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp'               -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp'                   -- Completion
  use 'neovim/nvim-lspconfig'              -- LSP
  use 'jose-elias-alvarez/typescript.nvim' -- convenience commands
  use 'L3MON4D3/LuaSnip'

  -- Auto pairs for brackets, parenthesis, etc
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  use { 'nvim-treesitter/nvim-treesitter', -- Syntax highlighting
    run = ':TSUpdate'
  }

  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server toinject LSP diagnostics, code actions, and more via Lua
  use 'mfussenegger/nvim-jdtls'

  use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client

  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim'      -- For git blame and browser

  use "kyazdani42/nvim-tree.lua" -- Nvim Tree file explorer

  use { 'akinsho/toggleterm.nvim',
    tag = '*'
  }

  use 'EdenEast/nightfox.nvim'
  use 'AlexvZyl/nordic.nvim'
  use 'nordtheme/vim'
  use 'rmehri01/onenord.nvim'

  use({ 'codeindulgence/vim-tig' })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

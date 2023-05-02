local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use({ 'wbthomason/packer.nvim' })

  -- Fuzzy searcher
  -- use({'junegunn/fzf'})
  -- use({'junegunn/fzf.vim'})

  -- Fuzzy searcher
  use 'kyazdani42/nvim-web-devicons' -- File icons
  use 'glepnir/lspsaga.nvim'         -- LSP UIs
  use 'nvim-lua/plenary.nvim'        -- Common utilities
  use 'nvim-telescope/telescope.nvim'
  -- use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Custom status line
  use 'nvim-lualine/lualine.nvim'

  use 'onsails/lspkind-nvim'  -- vscode-like pictograms
  use 'hrsh7th/cmp-buffer'    -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp'  -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp'      -- Completion
  use 'neovim/nvim-lspconfig' -- LSP
  use 'L3MON4D3/LuaSnip'

  -- Auto pairs for brackets, parenthesis, etc
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  use { 'nvim-treesitter/nvim-treesitter', -- Syntax highlighting
    run = ':TSUpdate'
  }

  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server toinject LSP diagnostics, code actions, and more via Lua
  use 'MunifTanjim/prettier.nvim'       -- Prettier plugin for Neovim's built-in LSP client

  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim' -- For git blame and browser

  -- local ft_to_parser = require"nvim-treesitter.parsers".filetype_to_parsername
  -- ft_to_parser['javascript.jsx'] = "typescriptreact" -- the someft filetype will use the python parser and queries.

  -- Nvim Tree file explorer
  use "kyazdani42/nvim-tree.lua"

  -- Code formatting
  -- use({'prettier/vim-prettier', run = 'yarn install --frozen-lockfile --production'})

  -- Personal Wiki
  -- use({'vimwiki/vimwiki'})

  use 'EdenEast/nightfox.nvim'
  use 'AlexvZyl/nordic.nvim'
  use 'nordtheme/vim'
  use 'rmehri01/onenord.nvim'

  -- use({'codeindulgence/vim-tig'})

  -- use({'dense-analysis/ale', config = require('configs.ale-config')})

  -- use({'mhartington/formatter.nvim', config = require('configs.formatter-config')})

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

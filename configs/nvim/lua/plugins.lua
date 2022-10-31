local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use({'wbthomason/packer.nvim'})

  -- Collection of configurations for the built-in LSP client
  use({'neovim/nvim-lspconfig', config = require('configs.nvim-lspconfig-config')})

  -- Fuzzy searcher
  use({'junegunn/fzf'})
  use({'junegunn/fzf.vim'})

  -- Fuzzy searcher
  -- use({'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} }})
  -- use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Custom status line
  use({'nvim-lualine/lualine.nvim', config = require('configs.lualine-config')})

  -- Completion
  use({"hrsh7th/nvim-cmp",
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

  -- Auto pairs for brackets, parenthesis, etc
  use({'windwp/nvim-autopairs', config = require('configs.autopairs-config')})

  -- Syntax highlighting
  use({'nvim-treesitter/nvim-treesitter', requires = { "p00f/nvim-ts-rainbow" }, config = require("configs.treesitter-config")})

  -- Nvim Tree file explorer
  use({"kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" }, config = require('configs.nvim-tree-config')})

  -- Code formatting
  use({'prettier/vim-prettier', run = 'yarn install --frozen-lockfile --production'})

  use({'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" }, config = require('configs.metals-config')})

  -- Personal Wiki
  use({'vimwiki/vimwiki'})

  -- Git status in gutter
  -- use({"lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" }, config = require("configs.gitsigns-config")})

  -- Nord colorscheme
  use({'arcticicestudio/nord-vim'})

  use({'codeindulgence/vim-tig'})

  -- use({'dense-analysis/ale', config = require('configs.ale-config')})

  -- Emmet/Snippets
  -- use({
  --   "mattn/emmet-vim",
  --   requires = { "mattn/webapi-vim" },
  --   config = function()
  --     vim.cmd(
  --       [[let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.config/nvim/snippets.json')), "\n"))]]
  --     )
  --   end,
  -- })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

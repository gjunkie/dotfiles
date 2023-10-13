-------------
-- Aliases --
-------------

local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local map = vim.api.nvim_set_keymap
local o = vim.opt

cmd 'colorscheme onenord'

-- let vimDir = '$HOME/.vim'
-- let &runtimepath.=','.vimDir

-- o.term = 'xterm-256color'
-- o.autoread
o.backspace = 'indent,eol,start'
o.cmdheight = 1
o.cursorline = true
o.enc = 'utf-8'
o.expandtab = true
-- o.foldlevel = 2
-- o.foldmethod = 'indent'
-- o.foldnestmax = 10
-- o.hidden
o.history = 10000
-- o.hlsearch
o.ignorecase = true
o.incsearch = true
o.laststatus = 2
-- o.nobackup
o.belloff = 'all'
-- o.nofoldenable
-- o.noshowmode
-- o.nostartofline
-- o.noswapfile = true
o.number = true
o.scrolloff = 20
o.shiftwidth = 2
-- o.smartcase
o.softtabstop = 2
o.splitbelow = true
o.splitright = true
o.tabstop = 2
o.termguicolors = true
-- o.undodir = '~/.vim/undodir'
o.undofile = true
o.undolevels = 1000
o.undoreload = 10000
o.wildignore = o.wildignore + 'node_modules'

o.updatetime = 500

-- o.completeopt to have a better completion experience
o.completeopt = 'menuone,noinsert,noselect'

-- Avoid showing extra message when using completion
-- o.shortmess:append({'c'})

-- Ensure autocmd works for Filetype
o.shortmess:remove({ 'F' })

o.diffopt = o.diffopt + 'iwhiteall'
o.diffopt = o.diffopt + 'hiddenoff'
o.diffopt = o.diffopt + 'internal,algorithm:patience'

g.omni_sql_no_default_maps = 1

-- g.LanguageClient_serverCommands = { 'javascript' = ['flow-language-server', '--stdio'] }

-- g.LanguageClient_rootMarkers = { javascript: ['.flowconfig', 'package.json'] }

-- g.LanguageClient_serverCommands={ javascript: ['flow', 'lsp'], 'javascript.jsx': ['flow', 'lsp'] }
vim.cmd('source ~/.vim/config/autocmd.vim')
vim.cmd('source ~/.vim/autoload/comment.vim')
vim.cmd('source ~/.vim/autoload/git.vim')
vim.cmd('source ~/.vim/plugin/git.vim')
vim.cmd('source ~/.vim/plugin/fzf.vim')

-- cmd [[augroup lsp]]
-- cmd [[au!]]
-- cmd [[au FileType java,scala,sbt lua require("metals").initialize_or_attach({})]]
-- cmd [[augroup end]]

g.user_emmet_leader_key = '<C-f>'

o.updatetime = 250
-- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
-- vim.cmd [[autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]]

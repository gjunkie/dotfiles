local map = vim.api.nvim_set_keymap

map('n', '<Space>', '<NOP>', { noremap = true, silent = true })
vim.g.mapleader = ' '
map('n', '<Leader>h', ':set hlsearch!<CR>', { noremap = true, silent = true })

-- Window Management
-- -------------------------------------
-- map('n', '<M-h>', ':TmuxNavigateLeft<CR>',  {noremap = true, silent = true})
map('n', 'fh', '<C-w>h', { noremap = true })
map('n', 'fj', '<C-w>j', { noremap = true })
map('n', 'fk', '<C-w>k', { noremap = true })
map('n', 'fl', '<C-w>l', { noremap = true })
map('n', 'fp', '<C-w><C-p>', { noremap = true })

-- Neovim Terminal Control
map('n', 'tt', ':terminal<CR>', { noremap = true })

-- Toggle terminal on/off (neovim)
map('n', '<C-e>', ':call TermToggle(13)<CR>', { noremap = true })
map('i', '<C-e>', ':call TermToggle(12)<CR>', { noremap = true })
-- map('t', '<C-e>', '<C-\><C-n>:call TermToggle(12)<CR>', {noremap = true})

-- Terminal go back to normal mode
-- map('t', '<Esc>', '<C-\><C-n>', {noremap = true})
-- map('t', ':q!', '<C-\><C-n>:q!<CR>', {noremap = true})

-- Windown resizing
map('n', '=', ':vertical resize +5<CR>', { noremap = true })
map('n', '-', ':vertical resize -5<CR>', { noremap = true })
-- nnoremap <C-H> :5wincmd <<CR> " Left
-- nnoremap <C-L> :5wincmd ><CR> " Right

-- Split windows verticall/horizontally
map('n', '+', ':vsp<CR>', { noremap = true })
map('n', '_', ':sp<CR>', { noremap = true })

-- Close current window
map('n', 'qq', ':q<CR>', { noremap = true })

-- Invoke help QuickFix windows
map('n', 'HV', ':call CheatVim()<CR>', { noremap = true })
map('n', 'HT', ':call CheatTmux()<CR>', { noremap = true })

-- Toggle Filetree (netrw)
--map('n', '<Tab>', ':call NetrwToggle("%:p:h")<CR>', {noremap = true})
--map('n', '<S-Tab>', ':call NetrwToggle(getcwd())<CR>', {noremap = true})

map('n', 'r', ':redo<CR>', { noremap = true })

-- replace
map('n', 'RR', ':%s:', { noremap = true })            -- replace word
map('n', 'RW', ':%s:<C-R><C-W>:', { noremap = true }) -- replace cursor word

-- move lines
map('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true })
-- map('v', 'W', ':%s:<C-R><C-W>:', {noremap = true})
map('v', 'K', ":m '>-2<CR>gv=gv", { noremap = true })
map('n', 'J', ":m .+1<CR>==", { noremap = true })
map('n', 'K', ":m .-2<CR>==", { noremap = true })
-- inoremap <C-j> :m .+1<CR>==
-- inoremap <C-k> :m .-2<CR>==

-- search cursor word in buffer
map('n', '?', '/<C-R><C-W><CR>', { noremap = true })
map('n', 'n', 'nzz', { noremap = true })
map('n', 'N', 'Nzz', { noremap = true })

-- navigate to wrappinng lines
map('n', 'j', 'gj', { noremap = true })
map('n', 'k', 'gk', { noremap = true })

-- move lines without dd
map('n', '<C-k>', ':m-2<CR>', { noremap = true })
map('n', '<C-j>', ':m+<CR>', { noremap = true })
map('v', '<C-k>', "'<-2<CR>gv=gv", { noremap = true })
map('v', '<C-j>', "'>+1<CR>gv=gv", { noremap = true })

-- toggle commenting
map('n', 'C', ':set opfunc=comment#toggle_comment<cr>g@<Right>', { noremap = true, silent = true })
map('v', 'C', ':<c-u>call comment#toggle_comment(visualmode(), 1)<cr>', { noremap = true, silent = true })

-- indentation
map('v', '<Tab>', '>gv', { noremap = true })
map('v', '<S-Tab>', '<gv', { noremap = true })

-- Completion list
-- function! s:check_back_space() abort
--   let col = col('.') - 1
--   return !col || getline('.')[col - 1]  =~ '\s'
-- endfunction

-- -----------------------------------------------------------------------------
-- completion-nvim settings
-- -----------------------------------------------------------------------------
-- Use <Tab> and <S-Tab> to navigate through popup menu
-- inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
-- inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
-- map('i', '<C-j>', "'>+1<CR>gv=gv", {noremap = true, expr = true})
-- map('i, '<C-j>', "'>+1<CR>gv=gv", {noremap = true})

-- Spacing (tabs and spaces)
-- nmap <leader>tt :set noet tabstop=4 shiftwidth=4 softtabstop=4<CR>
-- nmap <leader>ss :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>

-- Git helpers
-- xnoremap g\ :<c-u>call git#OpenCurrentFileInGithub()<CR>
-- noremap g\ V:<c-u>call git#OpenCurrentFileInGithub()<CR>

-- Plugins
-- -------------------------------------

-- DelimitMate
-- imap <C-l> <C-G>g

-- FZF
-- map('n', 'fs', ':Rg<SPACE>', {noremap = true})
-- map('n', 'fw', ':Rg <C-R><C-W><CR>', {noremap = true})
-- map('v', 'fw', 'y:Rg <c-r>"<CR>', {noremap = true})
-- map('n', 'ff', ':Files<CR>', {noremap = true})
-- map('n', 'FF', ':Files %:p:h<CR>', { noremap = true })
-- map('n', 'FL', ':Lines<CR>', { noremap = true })
-- map('n', 'FB', ':BLines<CR>', { noremap = true })
-- map('n', 'fb', ':Buffers<CR>', {noremap = true})
map('n', 'f<Space>', ':b#<CR>', { noremap = true })
-- map('n', 'gs', ':GFiles?<CR>', { noremap = true })
map('n', 'gb', ':GitBlame<CR>', { noremap = true })
-- map('n', 'gc', ':BCommits<CR>', { noremap = true })
-- map('n', 'gac', ':Commits!<CR>', { noremap = true })

-- Telescope
map('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>', { noremap = true })
map('n', '<leader>nc', '<cmd>lua require"user.telescope".nvim_config()<cr>', { noremap = true })
map('n', '<leader>fw', '<cmd>lua require("telescope.builtin").grep_string()<cr>', { noremap = true })
map('n', '<leader>fs', '<cmd>lua require("telescope.builtin").live_grep()<cr>', { noremap = true })
map('n', '<leader>b', '<cmd>lua require("telescope.builtin").buffers()<cr>', { noremap = true })
local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
-- map('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>', {noremap = true})
-- map('n', '<leader>d', '<cmd>lua require("telescope.builtin").lsp_definitions()<cr>', {noremap = true})
-- map('n', '<leader>r', '<cmd>lua require("telescope.builtin").lsp_references()<cr>', {noremap = true})
-- map('n', 'nc', '<cmd>lua require("telescope").nvim_config()<cr>', {noremap = true})

-- Language Server
map('n', '<leader>d', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
map('n', '<leader>h', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
map('n', '<leader>i', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true })
map('n', '<leader>r', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })
map('n', 'gds', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', { noremap = true, silent = true })
map('n', 'gws', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', { noremap = true, silent = true })
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })
map('n', '[c', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
map('n', ']c', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', { noremap = true, silent = true })

-- ALE Linter
map('n', '<C-k>', '<Plug>(ale_previous_wrap)', { silent = true })
map('n', '<C-j>', '<Plug>(ale_next_wrap)', { silent = true })

-- Vim Wiki
map('n', '<Leader>ww', ':VimwikiIndex<CR>', { noremap = true })

map("n", "<S-Tab>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
map("n", "<Tab>", ":NvimTreeFindFileToggle<CR>", { noremap = true, silent = true })
map("n", "<C-c>", ":NvimTreeClose<CR>", { noremap = true, silent = true })
-- " pmenu and vim-vsnip
-- imap <expr> <Tab>   pumvisible() ? "<C-n>" : vsnip#jumpable(1)   ? "<Plug>(vsnip-jump-next)" : "<Tab>"
-- imap <expr> <S-Tab> pumvisible() ? "<C-p>" : vsnip#jumpable(-1)  ? "<Plug>(vsnip-jump-prev)" : "<S-Tab>"
-- map('i', '<Tab>', 'pumvisible() ? "<C-n>" : vsnip#jumpable(1)   ? "<Plug>(vsnip-jump-next)" : "<Tab>"', {expr = true})
-- map('i', '<S-Tab>', 'pumvisible() ? "<C-p>" : vsnip#jumpable(-1)  ? "<Plug>(vsnip-jump-prev)" : "<S-Tab>"', {expr = true})

-- " vim-vsnip
-- smap <expr> <Tab>   vsnip#jumpable(1)  ? "<Plug>(vsnip-jump-next)" : "<Tab>"
-- smap <expr> <S-Tab> vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<S-Tab>"
-- Copy to clipboard
-- vnoremap  <leader>y "+y
-- nnoremap  <leader>Y :"+yg_<CR>
-- nnoremap  <leader>y :"+y<CR>
-- nnoremap  <leader>yy :"+yy<CR>

-- Paste from clipboard
-- nnoremap <leader>p "+p
-- nnoremap <leader>P "+P
-- vnoremap <leader>p "+p
-- vnoremap <leader>P "+P

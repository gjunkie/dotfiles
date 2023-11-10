local map = vim.api.nvim_set_keymap
local utils = require("utils")

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

-- Toggle to most recent buffer
map('n', 'f<Space>', ':b#<CR>', { noremap = true })

-- replace and redo
map('n', 'r', ':redo<CR>', { noremap = true })
map('n', 'RR', ':%s:', { noremap = true })            -- replace word
map('n', 'RW', ':%s:<C-R><C-W>:', { noremap = true }) -- replace cursor word

-- move lines
map('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true })
-- map('v', 'W', ':%s:<C-R><C-W>:', {noremap = true})
map('v', 'K', ":m '>-2<CR>gv=gv", { noremap = true })
map('n', 'J', ":m .+1<CR>==", { noremap = true })
map('n', 'K', ":m .-2<CR>==", { noremap = true })

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

-- Git helpers
map('n', '<leader>go', '<cmd>lua utils.open_current_file_in_github()<CR>', { noremap = true, silent = true })
map('n', 'gb', ':GitBlame<CR>', { noremap = true })

-- Plugins
-- -------------------------------------

-- Telescope
map('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>', { noremap = true })
map('n', '<leader>nc', '<cmd>lua require"user.telescope".nvim_config()<cr>', { noremap = true })
map('n', '<leader>fw', '<cmd>lua require("telescope.builtin").grep_string()<cr>', { noremap = true })
map('n', '<leader>fs', '<cmd>lua require("telescope.builtin").live_grep()<cr>', { noremap = true })
map('n', '<leader>b', '<cmd>lua require("telescope.builtin").buffers()<cr>', { noremap = true })

-- Language Server
map('n', '<leader>d', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
map('n', '<leader>h', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
map('n', '<leader>i', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true })
map('n', '<leader>r', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })
map('n', 'gds', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', { noremap = true, silent = true })
map('n', 'gws', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', { noremap = true, silent = true })
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })
map('n', '<C-k>', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
map('n', '<C-j>', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })

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

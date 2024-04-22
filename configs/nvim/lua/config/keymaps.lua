local comment = require("config.modules.comment")
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<Space>", "<NOP>", { noremap = true, silent = true })
map("n", "<Leader>h", ":set hlsearch!<CR>", { noremap = true, silent = true })

-- Window Management
-- -------------------------------------
-- map('n', '<M-h>', ':TmuxNavigateLeft<CR>',  {noremap = true, silent = true})
map("n", "fh", "<C-w>h", { noremap = true })
map("n", "fj", "<C-w>j", { noremap = true })
map("n", "fk", "<C-w>k", { noremap = true })
map("n", "fl", "<C-w>l", { noremap = true })
map("n", "fp", "<C-w><C-p>", { noremap = true })

-- Windown resizing
map("n", "=", ":vertical resize +5<CR>", { noremap = true })
map("n", "-", ":vertical resize -5<CR>", { noremap = true })
-- nnoremap <C-H> :5wincmd <<CR> " Left
-- nnoremap <C-L> :5wincmd ><CR> " Right

-- Split windows verticall/horizontally
map("n", "+", ":vsp<CR>", { noremap = true })
map("n", "_", ":sp<CR>", { noremap = true })

-- Close current window
map("n", "qq", ":q<CR>", { noremap = true })

-- Toggle to most recent buffer
map("n", "f<Space>", ":b#<CR>", { noremap = true })

-- replace and redo
map("n", "r", ":redo<CR>", { noremap = true })
map("n", "RR", ":%s:", { noremap = true }) -- replace word
map("n", "RW", ":%s:<C-R><C-W>:", { noremap = true }) -- replace cursor word

-- move lines
-- map("v", "W", ":%s:<C-R><C-W>:", { noremap = true })
-- map("v", "D", ":m '>+1<CR>gv=gv", { noremap = true })
-- map("v", "U", ":m '>-2<CR>gv=gv", { noremap = true })
map("n", "D", ":m .+1<CR>==", { noremap = true })
map("n", "U", ":m .-2<CR>==", { noremap = true })

-- search cursor word in buffer
map("n", "?", "/<C-R><C-W><CR>", { noremap = true })
map("n", "n", "nzz", { noremap = true })
map("n", "N", "Nzz", { noremap = true })

-- navigate to wrappinng lines
map("n", "j", "gj", { noremap = true })
map("n", "k", "gk", { noremap = true })

-- move lines without dd
--map("n", "<C-k>", ":m-2<CR>", { noremap = true })
--map("n", "<C-j>", ":m+<CR>", { noremap = true })
--map("v", "<C-k>", "'<-2<CR>gv=gv", { noremap = true })
--map("v", "<C-j>", "'>+1<CR>gv=gv", { noremap = true })

-- indentation
map("v", "<Tab>", ">gv", { noremap = true })
map("v", "<S-Tab>", "<gv", { noremap = true })

-- Git helpers
map("n", "<leader>go", "<cmd>lua utils.open_current_file_in_github()<CR>", { noremap = true, silent = true })
map("n", "gb", ":GitBlame<CR>", { noremap = true })

-- Plugins
-- -------------------------------------

-- Language Server
map("n", "<leader>d", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
map("n", "<leader>h", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
map("n", "<leader>i", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
map("n", "<leader>r", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
map("n", "gds", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", { noremap = true, silent = true })
map("n", "gws", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", { noremap = true, silent = true })
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })
map("n", "<C-k>", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })
map("n", "<C-j>", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })

-- map("n", "<S-Tab>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
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

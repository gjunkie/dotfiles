-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/fcarthy/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/fcarthy/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/fcarthy/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/fcarthy/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/fcarthy/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ale = {
    config = { "\27LJ\2\n¾\4\0\0\3\0\24\0:6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0005\2\4\0=\2\6\1=\1\3\0006\0\0\0009\0\1\0009\0\3\0'\1\b\0=\1\a\0006\0\0\0009\0\1\0)\1\1\0=\1\t\0006\0\0\0009\0\1\0)\1\1\0=\1\n\0006\0\0\0009\0\1\0)\1\1\0=\1\v\0006\0\0\0009\0\1\0'\1\r\0=\1\f\0006\0\0\0009\0\1\0)\1\1\0=\1\14\0006\0\0\0009\0\1\0005\1\17\0005\2\16\0=\2\6\1=\1\15\0006\0\0\0009\0\1\0)\1\1\0=\1\18\0006\0\0\0009\0\1\0'\1\20\0=\1\19\0006\0\0\0009\0\1\0'\1\22\0=\1\21\0006\0\0\0009\0\1\0'\1\22\0=\1\23\0K\0\1\0\21ale_sign_warning\bâ–ˆ\19ale_sign_error\31[%linter%] %s [%severity%]\24ale_echo_msg_format\20ale_fix_on_save\1\0\0\1\2\0\0\veslint\15ale_fixers\29ale_lint_on_insert_leave\valways\29ale_lint_on_text_changed\21ale_lint_on_save\22ale_lint_on_enter\25ale_linters_explicit\veslint\19javascript.jsx\15javascript\1\0\0\1\2\0\0\veslint\16ale_linters%ale_javascript_eslint_use_global\6g\bvim\0" },
    loaded = true,
    path = "/Users/fcarthy/.local/share/nvim/site/pack/packer/start/ale",
    url = "https://github.com/w0rp/ale"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/fcarthy/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/fcarthy/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/fcarthy/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/fcarthy/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/Users/fcarthy/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["emmet-vim"] = {
    config = { "\27LJ\2\n—\1\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0x    let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.config/nvim/snippets.json')), \"\\n\"))\n  \bcmd\bvim\0" },
    loaded = true,
    path = "/Users/fcarthy/.local/share/nvim/site/pack/packer/start/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  fzf = {
    loaded = true,
    path = "/Users/fcarthy/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/Users/fcarthy/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n–\1\0\4\v\1\6\0\0196\4\0\0009\4\1\4'\6\2\0005\a\3\0\f\b\3\0X\b\1€4\b\0\0B\4\4\2\18\3\4\0006\4\0\0009\4\4\0049\4\5\4-\6\0\0\18\a\0\0\18\b\1\0\18\t\2\0\18\n\3\0B\4\6\1K\0\1\0\0À\24nvim_buf_set_keymap\bapi\1\0\2\fnoremap\2\vsilent\2\nforce\15tbl_extend\bvim€\b\1\1\b\0#\0Z3\1\0\0\18\2\1\0'\4\1\0'\5\2\0'\6\3\0005\a\4\0B\2\5\1\18\2\1\0'\4\1\0'\5\5\0'\6\6\0005\a\a\0B\2\5\1\18\2\1\0'\4\1\0'\5\b\0'\6\t\0B\2\4\1\18\2\1\0'\4\n\0'\5\b\0'\6\t\0B\2\4\1\18\2\1\0'\4\1\0'\5\v\0'\6\f\0B\2\4\1\18\2\1\0'\4\n\0'\5\v\0'\6\f\0B\2\4\1\18\2\1\0'\4\1\0'\5\r\0'\6\14\0B\2\4\1\18\2\1\0'\4\1\0'\5\15\0'\6\16\0B\2\4\1\18\2\1\0'\4\1\0'\5\17\0'\6\18\0B\2\4\1\18\2\1\0'\4\1\0'\5\19\0'\6\20\0B\2\4\1\18\2\1\0'\4\1\0'\5\21\0'\6\22\0B\2\4\1\18\2\1\0'\4\1\0'\5\23\0'\6\24\0B\2\4\1\18\2\1\0'\4\1\0'\5\25\0'\6\26\0B\2\4\1\18\2\1\0'\4\1\0'\5\27\0'\6\28\0B\2\4\1\18\2\1\0'\4\1\0'\5\29\0'\6\30\0B\2\4\1\18\2\1\0'\4\31\0'\5 \0'\6!\0B\2\4\1\18\2\1\0'\4\"\0'\5 \0'\6!\0B\2\4\0012\0\0€K\0\1\0\6x#:<C-U>Gitsigns select_hunk<CR>\aih\6o%<cmd>Gitsigns toggle_deleted<CR>\15<leader>td1<cmd>lua require\"gitsigns\".diffthis(\"~\")<CR>\15<leader>hD\31<cmd>Gitsigns diffthis<CR>\15<leader>hd0<cmd>Gitsigns toggle_current_line_blame<CR>\15<leader>tb9<cmd>lua require\"gitsigns\".blame_line{full=true}<CR>\15<leader>hb#<cmd>Gitsigns preview_hunk<CR>\15<leader>hp#<cmd>Gitsigns reset_buffer<CR>\15<leader>hR&<cmd>Gitsigns undo_stage_hunk<CR>\15<leader>hu#<cmd>Gitsigns stage_buffer<CR>\15<leader>hS\29:Gitsigns reset_hunk<CR>\15<leader>hr\6v\29:Gitsigns stage_hunk<CR>\15<leader>hs\1\0\1\texpr\0021&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'\a[c\1\0\1\texpr\0021&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'\a]c\6n\0û\1\1\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0023\3\b\0=\3\t\2B\0\2\1K\0\1\0\14on_attach\0&current_line_blame_formatter_opts\1\0\1\18relative_time\2\28current_line_blame_opts\1\0\4\14virt_text\2\22ignore_whitespace\1\ndelay\3d\18virt_text_pos\beol\1\0\1\23current_line_blame\2\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/fcarthy/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/fcarthy/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n©\2\0\0\5\0\18\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\16\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\3=\3\17\2B\0\2\1K\0\1\0\rsections\1\0\0\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\4\0\0\vbranch\tdiff\16diagnostics\14lualine_a\1\0\0\1\2\0\0\tmode\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/fcarthy/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["nord-vim"] = {
    loaded = true,
    path = "/Users/fcarthy/.local/share/nvim/site/pack/packer/start/nord-vim",
    url = "https://github.com/arcticicestudio/nord-vim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n;\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvimÀ\1\0\1\5\1\b\1\24-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\14€6\1\2\0009\1\3\0019\1\4\1)\3\1\0B\1\2\2\t\1\0\0X\1\5€6\1\5\0'\3\6\0'\4\a\0B\1\3\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\5!<Plug>(vsnip-expand-or-jump)\ffeedkey\20vsnip#available\afn\bvim\21select_next_item\fvisible\2®\1\0\0\4\1\b\1\21-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\4€-\0\0\0009\0\1\0B\0\1\1X\0\v€6\0\2\0009\0\3\0009\0\4\0)\2ÿÿB\0\2\2\t\0\0\0X\0\4€6\0\5\0'\2\6\0'\3\a\0B\0\3\1K\0\1\0\0À\5\28<Plug>(vsnip-jump-prev)\ffeedkey\19vsnip#jumpable\afn\bvim\21select_prev_item\fvisible\2Ã\b\1\0\n\0A\0\0016\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0003\5\3\0=\5\5\4=\4\a\0035\4\v\0009\5\b\0009\a\b\0009\a\t\a)\tüÿB\a\2\0025\b\n\0B\5\3\2=\5\f\0049\5\b\0009\a\b\0009\a\t\a)\t\4\0B\a\2\0025\b\r\0B\5\3\2=\5\14\0049\5\b\0009\a\b\0009\a\15\aB\a\1\0025\b\16\0B\5\3\2=\5\17\0049\5\18\0009\5\19\5=\5\20\0049\5\b\0005\a\22\0009\b\b\0009\b\21\bB\b\1\2=\b\23\a9\b\b\0009\b\24\bB\b\1\2=\b\25\aB\5\2\2=\5\26\0049\5\b\0009\5\27\0055\a\28\0B\5\2\2=\5\29\0049\5\b\0003\a\30\0005\b\31\0B\5\3\2=\5 \0049\5\b\0003\a!\0005\b\"\0B\5\3\2=\5#\4=\4\b\0039\4\18\0009\4$\0044\6\3\0005\a%\0>\a\1\0065\a&\0>\a\2\0064\a\3\0005\b'\0>\b\1\aB\4\3\2=\4$\3B\1\2\0019\1\2\0009\1(\1'\3)\0005\4,\0009\5\18\0009\5$\0054\a\3\0005\b*\0>\b\1\a4\b\3\0005\t+\0>\t\1\bB\5\3\2=\5$\4B\1\3\0019\1\2\0009\1-\1'\3.\0005\0040\0004\5\3\0005\6/\0>\6\1\5=\5$\4B\1\3\0019\1\2\0009\1-\1'\0031\0005\0044\0009\5\18\0009\5$\0054\a\3\0005\b2\0>\b\1\a4\b\3\0005\t3\0>\t\1\bB\5\3\2=\5$\4B\1\3\0016\1\0\0'\0035\0B\1\2\0029\0016\0016\0037\0009\0038\0039\0039\0039\3:\3B\3\1\0A\1\0\0026\2\0\0'\4;\0B\2\2\0029\2<\0029\2\2\0025\4=\0=\1>\4B\2\2\0016\2\0\0'\4;\0B\2\2\0029\2?\0029\2\2\0025\4@\0=\1>\4B\2\2\0012\0\0€K\0\1\0\1\0\0\tflow\17capabilities\1\0\0\rtsserver\14lspconfig\29make_client_capabilities\rprotocol\blsp\bvim\24update_capabilities\17cmp_nvim_lsp\1\0\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\6:\1\0\0\1\0\1\tname\vbuffer\6/\fcmdline\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\fcmp_git\14gitcommit\rfiletype\1\0\1\tname\vbuffer\1\0\1\tname\nvsnip\1\0\1\tname\rnvim_lsp\fsources\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\6c\nclose\6i\1\0\0\nabort\n<C-y>\fdisable\vconfig\14<C-Space>\1\3\0\0\6i\6c\rcomplete\n<C-f>\1\3\0\0\6i\6c\n<C-b>\1\0\0\1\3\0\0\6i\6c\16scroll_docs\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\frequire\0" },
    loaded = true,
    path = "/Users/fcarthy/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/fcarthy/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-metals"] = {
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26configs.metals-config\frequire\0" },
    loaded = true,
    path = "/Users/fcarthy/.local/share/nvim/site/pack/packer/start/nvim-metals",
    url = "https://github.com/scalameta/nvim-metals"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nº\1\0\0\6\0\n\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0\18\1\0\0'\3\5\0'\4\6\0'\5\a\0B\1\4\1\18\1\0\0'\3\5\0'\4\b\0'\5\t\0B\1\4\1K\0\1\0\26:NvimTreeFindFile<CR>\n<Tab>\24:NvimTreeToggle<CR>\f<S-Tab>\6n\vkeymap\nutils\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/Users/fcarthy/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n´\2\0\0\6\0\18\0\0216\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0005\5\5\0=\5\6\4=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\3B\1\2\1K\0\1\0\26context_commentstring\1\0\1\venable\2\fautotag\1\0\1\venable\2\frainbow\1\0\1\venable\2\14autopairs\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\fdisable\1\2\0\0\tjson\1\0\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/fcarthy/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/Users/fcarthy/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/fcarthy/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/fcarthy/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/fcarthy/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/fcarthy/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  vimwiki = {
    loaded = true,
    path = "/Users/fcarthy/.local/share/nvim/site/pack/packer/start/vimwiki",
    url = "https://github.com/vimwiki/vimwiki"
  },
  ["webapi-vim"] = {
    loaded = true,
    path = "/Users/fcarthy/.local/share/nvim/site/pack/packer/start/webapi-vim",
    url = "https://github.com/mattn/webapi-vim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n;\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvimÀ\1\0\1\5\1\b\1\24-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\14€6\1\2\0009\1\3\0019\1\4\1)\3\1\0B\1\2\2\t\1\0\0X\1\5€6\1\5\0'\3\6\0'\4\a\0B\1\3\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\5!<Plug>(vsnip-expand-or-jump)\ffeedkey\20vsnip#available\afn\bvim\21select_next_item\fvisible\2®\1\0\0\4\1\b\1\21-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\4€-\0\0\0009\0\1\0B\0\1\1X\0\v€6\0\2\0009\0\3\0009\0\4\0)\2ÿÿB\0\2\2\t\0\0\0X\0\4€6\0\5\0'\2\6\0'\3\a\0B\0\3\1K\0\1\0\0À\5\28<Plug>(vsnip-jump-prev)\ffeedkey\19vsnip#jumpable\afn\bvim\21select_prev_item\fvisible\2Ã\b\1\0\n\0A\0\0016\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0003\5\3\0=\5\5\4=\4\a\0035\4\v\0009\5\b\0009\a\b\0009\a\t\a)\tüÿB\a\2\0025\b\n\0B\5\3\2=\5\f\0049\5\b\0009\a\b\0009\a\t\a)\t\4\0B\a\2\0025\b\r\0B\5\3\2=\5\14\0049\5\b\0009\a\b\0009\a\15\aB\a\1\0025\b\16\0B\5\3\2=\5\17\0049\5\18\0009\5\19\5=\5\20\0049\5\b\0005\a\22\0009\b\b\0009\b\21\bB\b\1\2=\b\23\a9\b\b\0009\b\24\bB\b\1\2=\b\25\aB\5\2\2=\5\26\0049\5\b\0009\5\27\0055\a\28\0B\5\2\2=\5\29\0049\5\b\0003\a\30\0005\b\31\0B\5\3\2=\5 \0049\5\b\0003\a!\0005\b\"\0B\5\3\2=\5#\4=\4\b\0039\4\18\0009\4$\0044\6\3\0005\a%\0>\a\1\0065\a&\0>\a\2\0064\a\3\0005\b'\0>\b\1\aB\4\3\2=\4$\3B\1\2\0019\1\2\0009\1(\1'\3)\0005\4,\0009\5\18\0009\5$\0054\a\3\0005\b*\0>\b\1\a4\b\3\0005\t+\0>\t\1\bB\5\3\2=\5$\4B\1\3\0019\1\2\0009\1-\1'\3.\0005\0040\0004\5\3\0005\6/\0>\6\1\5=\5$\4B\1\3\0019\1\2\0009\1-\1'\0031\0005\0044\0009\5\18\0009\5$\0054\a\3\0005\b2\0>\b\1\a4\b\3\0005\t3\0>\t\1\bB\5\3\2=\5$\4B\1\3\0016\1\0\0'\0035\0B\1\2\0029\0016\0016\0037\0009\0038\0039\0039\0039\3:\3B\3\1\0A\1\0\0026\2\0\0'\4;\0B\2\2\0029\2<\0029\2\2\0025\4=\0=\1>\4B\2\2\0016\2\0\0'\4;\0B\2\2\0029\2?\0029\2\2\0025\4@\0=\1>\4B\2\2\0012\0\0€K\0\1\0\1\0\0\tflow\17capabilities\1\0\0\rtsserver\14lspconfig\29make_client_capabilities\rprotocol\blsp\bvim\24update_capabilities\17cmp_nvim_lsp\1\0\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\6:\1\0\0\1\0\1\tname\vbuffer\6/\fcmdline\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\fcmp_git\14gitcommit\rfiletype\1\0\1\tname\vbuffer\1\0\1\tname\nvsnip\1\0\1\tname\rnvim_lsp\fsources\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\6c\nclose\6i\1\0\0\nabort\n<C-y>\fdisable\vconfig\14<C-Space>\1\3\0\0\6i\6c\rcomplete\n<C-f>\1\3\0\0\6i\6c\n<C-b>\1\0\0\1\3\0\0\6i\6c\16scroll_docs\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n–\1\0\4\v\1\6\0\0196\4\0\0009\4\1\4'\6\2\0005\a\3\0\f\b\3\0X\b\1€4\b\0\0B\4\4\2\18\3\4\0006\4\0\0009\4\4\0049\4\5\4-\6\0\0\18\a\0\0\18\b\1\0\18\t\2\0\18\n\3\0B\4\6\1K\0\1\0\0À\24nvim_buf_set_keymap\bapi\1\0\2\fnoremap\2\vsilent\2\nforce\15tbl_extend\bvim€\b\1\1\b\0#\0Z3\1\0\0\18\2\1\0'\4\1\0'\5\2\0'\6\3\0005\a\4\0B\2\5\1\18\2\1\0'\4\1\0'\5\5\0'\6\6\0005\a\a\0B\2\5\1\18\2\1\0'\4\1\0'\5\b\0'\6\t\0B\2\4\1\18\2\1\0'\4\n\0'\5\b\0'\6\t\0B\2\4\1\18\2\1\0'\4\1\0'\5\v\0'\6\f\0B\2\4\1\18\2\1\0'\4\n\0'\5\v\0'\6\f\0B\2\4\1\18\2\1\0'\4\1\0'\5\r\0'\6\14\0B\2\4\1\18\2\1\0'\4\1\0'\5\15\0'\6\16\0B\2\4\1\18\2\1\0'\4\1\0'\5\17\0'\6\18\0B\2\4\1\18\2\1\0'\4\1\0'\5\19\0'\6\20\0B\2\4\1\18\2\1\0'\4\1\0'\5\21\0'\6\22\0B\2\4\1\18\2\1\0'\4\1\0'\5\23\0'\6\24\0B\2\4\1\18\2\1\0'\4\1\0'\5\25\0'\6\26\0B\2\4\1\18\2\1\0'\4\1\0'\5\27\0'\6\28\0B\2\4\1\18\2\1\0'\4\1\0'\5\29\0'\6\30\0B\2\4\1\18\2\1\0'\4\31\0'\5 \0'\6!\0B\2\4\1\18\2\1\0'\4\"\0'\5 \0'\6!\0B\2\4\0012\0\0€K\0\1\0\6x#:<C-U>Gitsigns select_hunk<CR>\aih\6o%<cmd>Gitsigns toggle_deleted<CR>\15<leader>td1<cmd>lua require\"gitsigns\".diffthis(\"~\")<CR>\15<leader>hD\31<cmd>Gitsigns diffthis<CR>\15<leader>hd0<cmd>Gitsigns toggle_current_line_blame<CR>\15<leader>tb9<cmd>lua require\"gitsigns\".blame_line{full=true}<CR>\15<leader>hb#<cmd>Gitsigns preview_hunk<CR>\15<leader>hp#<cmd>Gitsigns reset_buffer<CR>\15<leader>hR&<cmd>Gitsigns undo_stage_hunk<CR>\15<leader>hu#<cmd>Gitsigns stage_buffer<CR>\15<leader>hS\29:Gitsigns reset_hunk<CR>\15<leader>hr\6v\29:Gitsigns stage_hunk<CR>\15<leader>hs\1\0\1\texpr\0021&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'\a[c\1\0\1\texpr\0021&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'\a]c\6n\0û\1\1\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0023\3\b\0=\3\t\2B\0\2\1K\0\1\0\14on_attach\0&current_line_blame_formatter_opts\1\0\1\18relative_time\2\28current_line_blame_opts\1\0\4\14virt_text\2\22ignore_whitespace\1\ndelay\3d\18virt_text_pos\beol\1\0\1\23current_line_blame\2\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-metals
time([[Config for nvim-metals]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26configs.metals-config\frequire\0", "config", "nvim-metals")
time([[Config for nvim-metals]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nº\1\0\0\6\0\n\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0\18\1\0\0'\3\5\0'\4\6\0'\5\a\0B\1\4\1\18\1\0\0'\3\5\0'\4\b\0'\5\t\0B\1\4\1K\0\1\0\26:NvimTreeFindFile<CR>\n<Tab>\24:NvimTreeToggle<CR>\f<S-Tab>\6n\vkeymap\nutils\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: emmet-vim
time([[Config for emmet-vim]], true)
try_loadstring("\27LJ\2\n—\1\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0x    let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.config/nvim/snippets.json')), \"\\n\"))\n  \bcmd\bvim\0", "config", "emmet-vim")
time([[Config for emmet-vim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n©\2\0\0\5\0\18\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\16\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\3=\3\17\2B\0\2\1K\0\1\0\rsections\1\0\0\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\4\0\0\vbranch\tdiff\16diagnostics\14lualine_a\1\0\0\1\2\0\0\tmode\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: ale
time([[Config for ale]], true)
try_loadstring("\27LJ\2\n¾\4\0\0\3\0\24\0:6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0005\2\4\0=\2\6\1=\1\3\0006\0\0\0009\0\1\0009\0\3\0'\1\b\0=\1\a\0006\0\0\0009\0\1\0)\1\1\0=\1\t\0006\0\0\0009\0\1\0)\1\1\0=\1\n\0006\0\0\0009\0\1\0)\1\1\0=\1\v\0006\0\0\0009\0\1\0'\1\r\0=\1\f\0006\0\0\0009\0\1\0)\1\1\0=\1\14\0006\0\0\0009\0\1\0005\1\17\0005\2\16\0=\2\6\1=\1\15\0006\0\0\0009\0\1\0)\1\1\0=\1\18\0006\0\0\0009\0\1\0'\1\20\0=\1\19\0006\0\0\0009\0\1\0'\1\22\0=\1\21\0006\0\0\0009\0\1\0'\1\22\0=\1\23\0K\0\1\0\21ale_sign_warning\bâ–ˆ\19ale_sign_error\31[%linter%] %s [%severity%]\24ale_echo_msg_format\20ale_fix_on_save\1\0\0\1\2\0\0\veslint\15ale_fixers\29ale_lint_on_insert_leave\valways\29ale_lint_on_text_changed\21ale_lint_on_save\22ale_lint_on_enter\25ale_linters_explicit\veslint\19javascript.jsx\15javascript\1\0\0\1\2\0\0\veslint\16ale_linters%ale_javascript_eslint_use_global\6g\bvim\0", "config", "ale")
time([[Config for ale]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n´\2\0\0\6\0\18\0\0216\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0005\5\5\0=\5\6\4=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\3B\1\2\1K\0\1\0\26context_commentstring\1\0\1\venable\2\fautotag\1\0\1\venable\2\frainbow\1\0\1\venable\2\14autopairs\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\fdisable\1\2\0\0\tjson\1\0\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end

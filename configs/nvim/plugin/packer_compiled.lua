-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

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
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

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
    config = { "\27LJ\2\n�\1\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0qlet g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.config/nvim/snippets.json')), \"\\n\"))\bcmd\bvim\0" },
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
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/fcarthy/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\5\0\22\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\0025\3\t\0005\4\b\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\3=\3\21\2B\0\2\1K\0\1\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\2\0\0\16diagnostics\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\1\0\0\1\2\0\0\rNvimTree\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/fcarthy/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["nord-vim"] = {
    loaded = true,
    path = "/Users/fcarthy/.local/share/nvim/site/pack/packer/start/nord-vim",
    url = "https://github.com/arcticicestudio/nord-vim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/Users/fcarthy/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\6\0\0176\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0B\1\2\2\14\0\1\0X\2\5�9\1\4\0'\3\5\0B\1\2\2\19\1\1\0X\2\3�+\1\1\0X\2\1�+\1\2\0L\1\2\0\fComment\20in_syntax_group\fcomment\26in_treesitter_capture\23cmp.config.context\frequire/\0\1\4\0\2\0\0046\1\0\0'\3\1\0B\1\2\1K\0\1\0\20mattn/emmet-vim\frequire�\1\0\1\5\1\b\1\24-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\14�6\1\2\0009\1\3\0019\1\4\1)\3\1\0B\1\2\2\t\1\0\0X\1\5�6\1\5\0'\3\6\0'\4\a\0B\1\3\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\0�\5!<Plug>(vsnip-expand-or-jump)\ffeedkey\20vsnip#available\afn\bvim\21select_next_item\fvisible\2�\1\0\0\4\1\b\1\21-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\4�-\0\0\0009\0\1\0B\0\1\1X\0\v�6\0\2\0009\0\3\0009\0\4\0)\2��B\0\2\2\t\0\0\0X\0\4�6\0\5\0'\2\6\0'\3\a\0B\0\3\1K\0\1\0\0�\5\28<Plug>(vsnip-jump-prev)\ffeedkey\19vsnip#jumpable\afn\bvim\21select_prev_item\fvisible\2�\a\1\0\n\0008\0y6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0003\4\3\0=\4\5\0035\4\a\0003\5\6\0=\5\b\4=\4\t\0035\4\r\0009\5\n\0009\a\n\0009\a\v\a)\t��B\a\2\0025\b\f\0B\5\3\2=\5\14\0049\5\n\0009\a\n\0009\a\v\a)\t\4\0B\a\2\0025\b\15\0B\5\3\2=\5\16\0049\5\n\0009\a\n\0009\a\17\aB\a\1\0025\b\18\0B\5\3\2=\5\19\0049\5\20\0009\5\21\5=\5\22\0049\5\n\0005\a\24\0009\b\n\0009\b\23\bB\b\1\2=\b\25\a9\b\n\0009\b\26\bB\b\1\2=\b\27\aB\5\2\2=\5\28\0049\5\n\0009\5\29\0055\a\30\0B\5\2\2=\5\31\0049\5\n\0003\a \0005\b!\0B\5\3\2=\5\"\0049\5\n\0003\a#\0005\b$\0B\5\3\2=\5%\4=\4\n\0039\4\20\0009\4&\0044\6\5\0005\a'\0>\a\1\0065\a(\0>\a\2\0065\a)\0>\a\3\0065\a*\0>\a\4\6B\4\2\2=\4&\3B\1\2\0019\1\2\0009\1+\1'\3,\0005\4/\0009\5\20\0009\5&\0054\a\3\0005\b-\0>\b\1\a4\b\3\0005\t.\0>\t\1\bB\5\3\2=\5&\4B\1\3\0019\1\2\0009\0010\1'\0031\0005\0043\0004\5\3\0005\0062\0>\6\1\5=\5&\4B\1\3\0019\1\2\0009\0010\1'\0034\0005\0047\0009\5\20\0009\5&\0054\a\3\0005\b5\0>\b\1\a4\b\3\0005\t6\0>\t\1\bB\5\3\2=\5&\4B\1\3\0012\0\0�K\0\1\0\1\0\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\6:\1\0\0\1\0\1\tname\vbuffer\6/\fcmdline\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\fcmp_git\14gitcommit\rfiletype\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\nvsnip\1\0\1\tname\rnvim_lsp\fsources\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\6c\nclose\6i\1\0\0\nabort\n<C-y>\fdisable\vconfig\14<C-Space>\1\3\0\0\6i\6c\rcomplete\n<C-f>\1\3\0\0\6i\6c\n<C-b>\1\0\0\1\3\0\0\6i\6c\16scroll_docs\fmapping\fsnippet\vexpand\1\0\0\0\fenabled\1\0\0\0\nsetup\bcmp\frequire\0" },
    loaded = true,
    path = "/Users/fcarthy/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nk\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\1'\3\3\0B\1\2\1K\0\1\0;command! Format execute 'lua vim.lsp.buf.formatting()'\17nvim_command\bapi\bvim�\18\1\0\v\0@\0i6\0\0\0'\2\1\0B\0\2\0023\1\2\0006\2\3\0009\2\4\2'\4\5\0B\2\2\0016\2\3\0009\2\4\2'\4\6\0B\2\2\0014\2\t\0005\3\a\0>\3\1\0025\3\b\0>\3\2\0025\3\t\0>\3\3\0025\3\n\0>\3\4\0025\3\v\0>\3\5\0025\3\f\0>\3\6\0025\3\r\0>\3\a\0025\3\14\0>\3\b\0025\3\21\0006\4\3\0009\4\15\0049\4\16\0046\6\3\0009\6\15\0069\6\17\0069\6\18\0065\a\19\0=\2\20\aB\4\3\2=\4\22\0036\4\3\0009\4\15\0049\4\16\0046\6\3\0009\6\15\0069\6\17\0069\6\23\0065\a\24\0=\2\20\aB\4\3\2=\4\25\0039\4\26\0009\4\27\0045\6\28\0=\3\17\6=\1\29\6B\4\2\0019\4\30\0009\4\27\0045\6\31\0=\1\29\0065\a \0=\a!\0065\a\"\0=\a#\0065\a.\0005\b,\0005\t$\0005\n%\0=\n!\t5\n&\0=\n'\t5\n(\0=\n)\t5\n*\0=\n+\t=\t-\b=\b/\a5\b0\0=\b#\a5\b4\0005\t1\0005\n2\0=\n+\t5\n3\0=\n!\t=\t-\b5\t5\0005\n6\0=\n!\t5\n7\0=\n+\t=\t8\b=\b9\a5\b:\0=\b;\a=\a<\6B\4\2\0016\4\3\0009\4=\0049\4>\0045\6?\0B\4\2\1K\0\1\0\1\0\5\14underline\2\nsigns\2\17virtual_text\1\18severity_sort\1\21update_in_insert\1\vconfig\15diagnostic\17init_options\20formatFiletypes\1\0\t\bcss\rprettier\tscss\rprettier\tless\rprettier\tjson\rprettier\20typescriptreact\rprettier\15typescript\rprettier\20javascriptreact\rprettier\15javascript\rprettier\19javascript.jsx\rprettier\15formatters\rprettier\1\f\0\0\16.prettierrc\21.prettierrc.json\21.prettierrc.toml\21.prettierrc.json\20.prettierrc.yml\21.prettierrc.yaml\22.prettierrc.json5\19.prettierrc.js\20.prettierrc.cjs\23prettier.config.js\24prettier.config.cjs\1\4\0\0\f--stdin\21--stdin-filepath\14%filename\1\0\2\fcommand\rprettier\15sourceName\rprettier\1\0\0\1\5\0\0\f--stdin\21--stdin-filename\14%filename\20--fix-to-stdout\1\a\0\0\14.eslintrc\18.eslintrc.cjs\17.eslintrc.js\19.eslintrc.json\19.eslintrc.yaml\18.eslintrc.yml\1\0\1\fcommand\reslint_d\1\0\5\20typescriptreact\veslint\15typescript\veslint\20javascriptreact\veslint\15javascript\veslint\19javascript.jsx\veslint\flinters\1\0\0\veslint\1\0\0\17rootPatterns\1\a\0\0\14.eslintrc\18.eslintrc.cjs\17.eslintrc.js\19.eslintrc.json\19.eslintrc.yaml\18.eslintrc.yml\15securities\1\0\2\0062\nerror\0061\fwarning\14parseJson\1\0\a\fendLine\fendLine\vcolumn\vcolumn\tline\tline\15errorsRoot\17[0].messages\fmessage$[eslint] ${message} [${ruleId}]\rsecurity\rseverity\14endColumn\14endColumn\1\6\0\0\f--stdin\21--stdin-filename\14%filepath\r--format\tjson\1\0\3\fcommand\reslint_d\rdebounce\3d\15sourceName\reslint_d\14filetypes\1\v\0\0\19javascript.jsx\15javascript\20javascriptreact\tjson\15typescript\20typescriptreact\bcss\tless\tscss\vpandoc\targs\1\6\0\0\14%filename\18%relativepath\n%file\14%filepath\r%dirname\1\0\0\17diagnosticls\14on_attach\1\0\0\nsetup\tflow\31textDocument/signatureHelp\1\0\0\19signature_help\23textDocument/hover\1\0\0\vborder\1\0\0\nhover\rhandlers\twith\blsp\1\3\0\0\b║\16FloatBorder\1\3\0\0\b╚\16FloatBorder\1\3\0\0\b═\16FloatBorder\1\3\0\0\b╝\16FloatBorder\1\3\0\0\b║\16FloatBorder\1\3\0\0\b╗\16FloatBorder\1\3\0\0\b═\16FloatBorder\1\3\0\0\b╔\16FloatBorderKautocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335?autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335\bcmd\bvim\0\14lspconfig\frequire\0" },
    loaded = true,
    path = "/Users/fcarthy/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-metals"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14on_attach\15completion\frequire�\3\1\0\a\0\23\0\"6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0029\1\3\0'\2\5\0=\2\4\0015\1\a\0005\2\b\0=\2\t\1=\1\6\0003\1\v\0=\1\n\0009\1\f\0006\2\14\0009\2\15\0029\2\16\0026\4\14\0009\4\15\0049\4\17\0049\4\18\0045\5\20\0005\6\19\0=\6\21\5B\2\3\2=\2\r\0016\1\0\0'\3\1\0B\1\2\0029\1\22\1\18\3\0\0B\1\2\1K\0\1\0\25initialize_or_attach\17virtual_text\1\0\0\1\0\1\vprefix\b\27on_publish_diagnostics\15diagnostic\twith\blsp\bvim$textDocument/publishDiagnostics\rhandlers\0\14on_attach\21excludedPackages\1\3\0\0\29akka.actor.typed.javadsl$com.github.swagger.akka.javadsl\1\0\1\26showImplicitArguments\2\rsettings\aon\22statusBarProvider\17init_options\16bare_config\vmetals\frequire\0" },
    loaded = true,
    path = "/Users/fcarthy/.local/share/nvim/site/pack/packer/start/nvim-metals",
    url = "https://github.com/scalameta/nvim-metals"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n�\3\0\0\6\0\26\0(6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0005\3\3\0005\4\4\0004\5\0\0=\5\5\4=\4\6\3=\3\b\0025\3\t\0=\3\n\0025\3\14\0005\4\v\0005\5\f\0=\5\r\4=\4\15\3=\3\16\2B\0\2\0016\0\0\0'\2\17\0B\0\2\0029\0\18\0\18\1\0\0'\3\19\0'\4\20\0'\5\21\0B\1\4\1\18\1\0\0'\3\19\0'\4\22\0'\5\23\0B\1\4\1\18\1\0\0'\3\19\0'\4\24\0'\5\25\0B\1\4\1K\0\1\0\23:NvimTreeClose<CR>\n<C-c> :NvimTreeFindFileToggle<CR>\n<Tab>\24:NvimTreeToggle<CR>\f<S-Tab>\6n\vkeymap\nutils\factions\14open_file\1\0\0\18window_picker\1\0\1\venable\1\1\0\1\17quit_on_open\2\bgit\1\0\1\venable\1\tview\1\0\0\rmappings\tlist\1\0\1\16custom_only\1\1\0\a preserve_window_proportions\1\tside\tleft\nwidth\0032\vnumber\1\vheight\3\30\15signcolumn\byes\19relativenumber\1\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/Users/fcarthy/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n�\2\0\0\6\0\18\0\0216\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\3\0005\5\4\0=\5\5\4=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\3B\1\2\1K\0\1\0\26context_commentstring\1\0\1\venable\2\fautotag\1\0\1\venable\2\frainbow\1\0\1\venable\2\14autopairs\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\0\fdisable\1\2\0\0\tjson\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
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
  ["vim-prettier"] = {
    loaded = true,
    path = "/Users/fcarthy/.local/share/nvim/site/pack/packer/start/vim-prettier",
    url = "https://github.com/prettier/vim-prettier"
  },
  ["vim-tig"] = {
    loaded = true,
    path = "/Users/fcarthy/.local/share/nvim/site/pack/packer/start/vim-tig",
    url = "https://github.com/codeindulgence/vim-tig"
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
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n�\2\0\0\6\0\18\0\0216\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\3\0005\5\4\0=\5\5\4=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\3B\1\2\1K\0\1\0\26context_commentstring\1\0\1\venable\2\fautotag\1\0\1\venable\2\frainbow\1\0\1\venable\2\14autopairs\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\0\fdisable\1\2\0\0\tjson\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nk\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\1'\3\3\0B\1\2\1K\0\1\0;command! Format execute 'lua vim.lsp.buf.formatting()'\17nvim_command\bapi\bvim�\18\1\0\v\0@\0i6\0\0\0'\2\1\0B\0\2\0023\1\2\0006\2\3\0009\2\4\2'\4\5\0B\2\2\0016\2\3\0009\2\4\2'\4\6\0B\2\2\0014\2\t\0005\3\a\0>\3\1\0025\3\b\0>\3\2\0025\3\t\0>\3\3\0025\3\n\0>\3\4\0025\3\v\0>\3\5\0025\3\f\0>\3\6\0025\3\r\0>\3\a\0025\3\14\0>\3\b\0025\3\21\0006\4\3\0009\4\15\0049\4\16\0046\6\3\0009\6\15\0069\6\17\0069\6\18\0065\a\19\0=\2\20\aB\4\3\2=\4\22\0036\4\3\0009\4\15\0049\4\16\0046\6\3\0009\6\15\0069\6\17\0069\6\23\0065\a\24\0=\2\20\aB\4\3\2=\4\25\0039\4\26\0009\4\27\0045\6\28\0=\3\17\6=\1\29\6B\4\2\0019\4\30\0009\4\27\0045\6\31\0=\1\29\0065\a \0=\a!\0065\a\"\0=\a#\0065\a.\0005\b,\0005\t$\0005\n%\0=\n!\t5\n&\0=\n'\t5\n(\0=\n)\t5\n*\0=\n+\t=\t-\b=\b/\a5\b0\0=\b#\a5\b4\0005\t1\0005\n2\0=\n+\t5\n3\0=\n!\t=\t-\b5\t5\0005\n6\0=\n!\t5\n7\0=\n+\t=\t8\b=\b9\a5\b:\0=\b;\a=\a<\6B\4\2\0016\4\3\0009\4=\0049\4>\0045\6?\0B\4\2\1K\0\1\0\1\0\5\14underline\2\nsigns\2\17virtual_text\1\18severity_sort\1\21update_in_insert\1\vconfig\15diagnostic\17init_options\20formatFiletypes\1\0\t\bcss\rprettier\tscss\rprettier\tless\rprettier\tjson\rprettier\20typescriptreact\rprettier\15typescript\rprettier\20javascriptreact\rprettier\15javascript\rprettier\19javascript.jsx\rprettier\15formatters\rprettier\1\f\0\0\16.prettierrc\21.prettierrc.json\21.prettierrc.toml\21.prettierrc.json\20.prettierrc.yml\21.prettierrc.yaml\22.prettierrc.json5\19.prettierrc.js\20.prettierrc.cjs\23prettier.config.js\24prettier.config.cjs\1\4\0\0\f--stdin\21--stdin-filepath\14%filename\1\0\2\fcommand\rprettier\15sourceName\rprettier\1\0\0\1\5\0\0\f--stdin\21--stdin-filename\14%filename\20--fix-to-stdout\1\a\0\0\14.eslintrc\18.eslintrc.cjs\17.eslintrc.js\19.eslintrc.json\19.eslintrc.yaml\18.eslintrc.yml\1\0\1\fcommand\reslint_d\1\0\5\20typescriptreact\veslint\15typescript\veslint\20javascriptreact\veslint\15javascript\veslint\19javascript.jsx\veslint\flinters\1\0\0\veslint\1\0\0\17rootPatterns\1\a\0\0\14.eslintrc\18.eslintrc.cjs\17.eslintrc.js\19.eslintrc.json\19.eslintrc.yaml\18.eslintrc.yml\15securities\1\0\2\0062\nerror\0061\fwarning\14parseJson\1\0\a\fendLine\fendLine\vcolumn\vcolumn\tline\tline\15errorsRoot\17[0].messages\fmessage$[eslint] ${message} [${ruleId}]\rsecurity\rseverity\14endColumn\14endColumn\1\6\0\0\f--stdin\21--stdin-filename\14%filepath\r--format\tjson\1\0\3\fcommand\reslint_d\rdebounce\3d\15sourceName\reslint_d\14filetypes\1\v\0\0\19javascript.jsx\15javascript\20javascriptreact\tjson\15typescript\20typescriptreact\bcss\tless\tscss\vpandoc\targs\1\6\0\0\14%filename\18%relativepath\n%file\14%filepath\r%dirname\1\0\0\17diagnosticls\14on_attach\1\0\0\nsetup\tflow\31textDocument/signatureHelp\1\0\0\19signature_help\23textDocument/hover\1\0\0\vborder\1\0\0\nhover\rhandlers\twith\blsp\1\3\0\0\b║\16FloatBorder\1\3\0\0\b╚\16FloatBorder\1\3\0\0\b═\16FloatBorder\1\3\0\0\b╝\16FloatBorder\1\3\0\0\b║\16FloatBorder\1\3\0\0\b╗\16FloatBorder\1\3\0\0\b═\16FloatBorder\1\3\0\0\b╔\16FloatBorderKautocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335?autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335\bcmd\bvim\0\14lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\5\0\22\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\0025\3\t\0005\4\b\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\3=\3\21\2B\0\2\1K\0\1\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\2\0\0\16diagnostics\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\1\0\0\1\2\0\0\rNvimTree\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n�\3\0\0\6\0\26\0(6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0005\3\3\0005\4\4\0004\5\0\0=\5\5\4=\4\6\3=\3\b\0025\3\t\0=\3\n\0025\3\14\0005\4\v\0005\5\f\0=\5\r\4=\4\15\3=\3\16\2B\0\2\0016\0\0\0'\2\17\0B\0\2\0029\0\18\0\18\1\0\0'\3\19\0'\4\20\0'\5\21\0B\1\4\1\18\1\0\0'\3\19\0'\4\22\0'\5\23\0B\1\4\1\18\1\0\0'\3\19\0'\4\24\0'\5\25\0B\1\4\1K\0\1\0\23:NvimTreeClose<CR>\n<C-c> :NvimTreeFindFileToggle<CR>\n<Tab>\24:NvimTreeToggle<CR>\f<S-Tab>\6n\vkeymap\nutils\factions\14open_file\1\0\0\18window_picker\1\0\1\venable\1\1\0\1\17quit_on_open\2\bgit\1\0\1\venable\1\tview\1\0\0\rmappings\tlist\1\0\1\16custom_only\1\1\0\a preserve_window_proportions\1\tside\tleft\nwidth\0032\vnumber\1\vheight\3\30\15signcolumn\byes\19relativenumber\1\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\6\0\0176\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0B\1\2\2\14\0\1\0X\2\5�9\1\4\0'\3\5\0B\1\2\2\19\1\1\0X\2\3�+\1\1\0X\2\1�+\1\2\0L\1\2\0\fComment\20in_syntax_group\fcomment\26in_treesitter_capture\23cmp.config.context\frequire/\0\1\4\0\2\0\0046\1\0\0'\3\1\0B\1\2\1K\0\1\0\20mattn/emmet-vim\frequire�\1\0\1\5\1\b\1\24-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\14�6\1\2\0009\1\3\0019\1\4\1)\3\1\0B\1\2\2\t\1\0\0X\1\5�6\1\5\0'\3\6\0'\4\a\0B\1\3\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\0�\5!<Plug>(vsnip-expand-or-jump)\ffeedkey\20vsnip#available\afn\bvim\21select_next_item\fvisible\2�\1\0\0\4\1\b\1\21-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\4�-\0\0\0009\0\1\0B\0\1\1X\0\v�6\0\2\0009\0\3\0009\0\4\0)\2��B\0\2\2\t\0\0\0X\0\4�6\0\5\0'\2\6\0'\3\a\0B\0\3\1K\0\1\0\0�\5\28<Plug>(vsnip-jump-prev)\ffeedkey\19vsnip#jumpable\afn\bvim\21select_prev_item\fvisible\2�\a\1\0\n\0008\0y6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0003\4\3\0=\4\5\0035\4\a\0003\5\6\0=\5\b\4=\4\t\0035\4\r\0009\5\n\0009\a\n\0009\a\v\a)\t��B\a\2\0025\b\f\0B\5\3\2=\5\14\0049\5\n\0009\a\n\0009\a\v\a)\t\4\0B\a\2\0025\b\15\0B\5\3\2=\5\16\0049\5\n\0009\a\n\0009\a\17\aB\a\1\0025\b\18\0B\5\3\2=\5\19\0049\5\20\0009\5\21\5=\5\22\0049\5\n\0005\a\24\0009\b\n\0009\b\23\bB\b\1\2=\b\25\a9\b\n\0009\b\26\bB\b\1\2=\b\27\aB\5\2\2=\5\28\0049\5\n\0009\5\29\0055\a\30\0B\5\2\2=\5\31\0049\5\n\0003\a \0005\b!\0B\5\3\2=\5\"\0049\5\n\0003\a#\0005\b$\0B\5\3\2=\5%\4=\4\n\0039\4\20\0009\4&\0044\6\5\0005\a'\0>\a\1\0065\a(\0>\a\2\0065\a)\0>\a\3\0065\a*\0>\a\4\6B\4\2\2=\4&\3B\1\2\0019\1\2\0009\1+\1'\3,\0005\4/\0009\5\20\0009\5&\0054\a\3\0005\b-\0>\b\1\a4\b\3\0005\t.\0>\t\1\bB\5\3\2=\5&\4B\1\3\0019\1\2\0009\0010\1'\0031\0005\0043\0004\5\3\0005\0062\0>\6\1\5=\5&\4B\1\3\0019\1\2\0009\0010\1'\0034\0005\0047\0009\5\20\0009\5&\0054\a\3\0005\b5\0>\b\1\a4\b\3\0005\t6\0>\t\1\bB\5\3\2=\5&\4B\1\3\0012\0\0�K\0\1\0\1\0\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\6:\1\0\0\1\0\1\tname\vbuffer\6/\fcmdline\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\fcmp_git\14gitcommit\rfiletype\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\nvsnip\1\0\1\tname\rnvim_lsp\fsources\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\6c\nclose\6i\1\0\0\nabort\n<C-y>\fdisable\vconfig\14<C-Space>\1\3\0\0\6i\6c\rcomplete\n<C-f>\1\3\0\0\6i\6c\n<C-b>\1\0\0\1\3\0\0\6i\6c\16scroll_docs\fmapping\fsnippet\vexpand\1\0\0\0\fenabled\1\0\0\0\nsetup\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: emmet-vim
time([[Config for emmet-vim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0qlet g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.config/nvim/snippets.json')), \"\\n\"))\bcmd\bvim\0", "config", "emmet-vim")
time([[Config for emmet-vim]], false)
-- Config for: nvim-metals
time([[Config for nvim-metals]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14on_attach\15completion\frequire�\3\1\0\a\0\23\0\"6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0029\1\3\0'\2\5\0=\2\4\0015\1\a\0005\2\b\0=\2\t\1=\1\6\0003\1\v\0=\1\n\0009\1\f\0006\2\14\0009\2\15\0029\2\16\0026\4\14\0009\4\15\0049\4\17\0049\4\18\0045\5\20\0005\6\19\0=\6\21\5B\2\3\2=\2\r\0016\1\0\0'\3\1\0B\1\2\0029\1\22\1\18\3\0\0B\1\2\1K\0\1\0\25initialize_or_attach\17virtual_text\1\0\0\1\0\1\vprefix\b\27on_publish_diagnostics\15diagnostic\twith\blsp\bvim$textDocument/publishDiagnostics\rhandlers\0\14on_attach\21excludedPackages\1\3\0\0\29akka.actor.typed.javadsl$com.github.swagger.akka.javadsl\1\0\1\26showImplicitArguments\2\rsettings\aon\22statusBarProvider\17init_options\16bare_config\vmetals\frequire\0", "config", "nvim-metals")
time([[Config for nvim-metals]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end

local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

-- local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
      n = {
        ["q"] = actions.close
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,                   -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true,    -- override the file sorter
        case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
      }
    }
  },
  extensions = {
    --     file_browser = {
    --       theme = "dropdown",
    --       -- disables netrw and use telescope-file-browser in its place
    --       hijack_netrw = true,
    mappings = {
      --         -- your custom insert mode mappings
      --         ["i"] = {
      --           ["<C-w>"] = function() vim.cmd('normal vbd') end,
      ["<C-n>"] = actions.cycle_history_next,
      ["<C-p>"] = actions.cycle_history_prev,
      --
      ["<C-j>"] = actions.move_selection_next,
      ["<C-k>"] = actions.move_selection_previous,
      --
      --           ["<C-c>"] = actions.close,
      --
      --           ["<Down>"] = actions.move_selection_next,
      --           ["<Up>"] = actions.move_selection_previous,
      --
      --           ["<C-k>"] = actions.move_selection_previous,
      --           ["<C-j>"] = actions.move_selection_previous,
      --
      --           ["<CR>"] = actions.select_default,
      --           ["<C-x>"] = actions.select_horizontal,
      --           ["<C-v>"] = actions.select_vertical,
      --           ["<C-t>"] = actions.select_tab,
      --
      --           ["<C-u>"] = actions.preview_scrolling_up,
      --           ["<C-d>"] = actions.preview_scrolling_down,
      --
      --           ["<PageUp>"] = actions.results_scrolling_up,
      --           ["<PageDown>"] = actions.results_scrolling_down,
      --
      --           ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
      --           ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
      --           ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
      --           ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
      --           ["<C-l>"] = actions.complete_tag,
      --           ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
      --         },
      --         ["n"] = {
      --           -- your custom normal mode mappings
      --           ["N"] = fb_actions.create,
      --           ["h"] = fb_actions.goto_parent_dir,
      --           ["/"] = function()
      --             vim.cmd('startinsert')
      --           end,
      --           ["<esc>"] = actions.close,
      --           ["<CR>"] = actions.select_default,
      --           ["<C-x>"] = actions.select_horizontal,
      --           ["<C-v>"] = actions.select_vertical,
      --           ["<C-t>"] = actions.select_tab,
      --
      --           ["<C-k>"] = actions.move_selection_previous,
      --           ["<C-j>"] = actions.move_selection_previous,
      --
      --           ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
      --           ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
      --           ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
      --           ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
      --
      --           ["j"] = actions.move_selection_next,
      --           ["k"] = actions.move_selection_previous,
      --           ["H"] = actions.move_to_top,
      --           ["M"] = actions.move_to_middle,
      --           ["L"] = actions.move_to_bottom,
      --
      --           ["<Down>"] = actions.move_selection_next,
      --           ["<Up>"] = actions.move_selection_previous,
      --           ["gg"] = actions.move_to_top,
      --           ["G"] = actions.move_to_bottom,
      --
      --           ["<C-u>"] = actions.preview_scrolling_up,
      --           ["<C-d>"] = actions.preview_scrolling_down,
      --
      --           ["<PageUp>"] = actions.results_scrolling_up,
      --           ["<PageDown>"] = actions.results_scrolling_down,
      --
      --           ["?"] = actions.which_key,
      --         },
    },
    pickers = {
      live_grep = {
        fuzzy_with_index_bias = true,
      },
      buffers = {
        get_fuzzy_file = true,
        mappings = {
          -- i = {
          --     ["<c-d>"] = actions.delete_buffer,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          -- },
          -- n = {
          --     ["<c-d>"] = actions.delete_buffer,
          -- }
        }
      },
    },
    -- --         file_browser = {
    -- --           mappings = {
    -- --             i = {
    -- --               ["<C-n>"] = actions.cycle_history_next,
    -- --               ["<C-p>"] = actions.cycle_history_prev,
    -- --
    -- --               ["<C-j>"] = actions.move_selection_next,
    -- --               ["<C-k>"] = actions.move_selection_previous,
    -- --             }
    -- --           }
    -- --         }
    -- },
  },
}

-- telescope.load_extension("file_browser")

telescope.load_extension('fzf')

vim.keymap.set('n', 'ff',
  function()
    builtin.find_files({
      no_ignore = false,
      hidden = true
    })
  end)
vim.keymap.set('n', 'fs', function()
  builtin.live_grep()
end)
vim.keymap.set('n', 'fw', function()
  builtin.grep_string()
end)
vim.keymap.set('n', 'fb', function()
  builtin.buffers({
    sort_mru = true
  })
end)
vim.keymap.set('n', 'ft', function()
  builtin.help_tags()
end)
vim.keymap.set('n', ';;', function()
  builtin.resume()
end)
vim.keymap.set('n', ';e', function()
  builtin.diagnostics()
end)

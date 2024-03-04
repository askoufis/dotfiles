return {
  {
    branch = '0.1.x',
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'natecraddock/telescope-zf-native.nvim',
        config = function()
          require('telescope').load_extension('zf-native')
        end,
      },
      {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
          require('telescope').load_extension('ui-select')
        end,
      },
    },
    keys = function()
      local telescope = require('telescope.builtin')
      local project_files = function()
        local opts = { hidden = true, show_untracked = true }
        local ok = pcall(require('telescope.builtin').git_files, opts)
        if not ok then
          require('telescope.builtin').find_files(opts)
        end
      end

      return {
        { '<C-p>', project_files, desc = 'Project files picker' },
        { '<leader>g', telescope.live_grep, desc = 'Live grep picker' },
      }
    end,
    config = function(_, opts)
      local telescope = require('telescope')
      telescope.setup(opts)
    end,
    opts = function()
      local actions = require('telescope.actions')

      return {
        defaults = {
          path_display = { 'smart' },
          extensions = {
            ['zf-native'] = {
              file = {
                enable = true,
                highlight_results = true,
                match_filename = true,
              },
              generic = {
                enable = true,
                highlight_results = true,
                match_filename = false,
              },
            },
            ['ui-select'] = {
              -- Nothing I put here seems to have any effect for some reason
              require('telescope.themes').get_dropdown {
                sorting_strategy = 'descending',
                layout_config = {
                  height = 10,
                },
              },
            },
          },
          mappings = {
            i = {
              ['<C-n>'] = actions.cycle_history_next,
              ['<C-p>'] = actions.cycle_history_prev,

              ['<M-j>'] = actions.move_selection_next,
              ['<M-k>'] = actions.move_selection_previous,

              ['<C-c>'] = actions.close,

              ['<Down>'] = actions.move_selection_next,
              ['<Up>'] = actions.move_selection_previous,

              ['<CR>'] = actions.select_default,
              ['<C-x>'] = actions.select_horizontal,
              ['<C-v>'] = actions.select_vertical,
              ['<C-t>'] = actions.select_tab,

              ['<C-u>'] = actions.preview_scrolling_up,
              ['<C-d>'] = actions.preview_scrolling_down,

              ['<PageUp>'] = actions.results_scrolling_up,
              ['<PageDown>'] = actions.results_scrolling_down,

              ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
              ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
              ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
              ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
              ['<C-l>'] = actions.complete_tag,
              ['<C-_>'] = actions.which_key, -- keys from pressing <C-/>
            },

            n = {
              ['<esc>'] = actions.close,
              ['<CR>'] = actions.select_default,
              ['<C-x>'] = actions.select_horizontal,
              ['<C-v>'] = actions.select_vertical,
              ['<C-t>'] = actions.select_tab,

              ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
              ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
              ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
              ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,

              ['j'] = actions.move_selection_next,
              ['k'] = actions.move_selection_previous,
              ['H'] = actions.move_to_top,
              ['M'] = actions.move_to_middle,
              ['L'] = actions.move_to_bottom,

              ['<Down>'] = actions.move_selection_next,
              ['<Up>'] = actions.move_selection_previous,
              ['gg'] = actions.move_to_top,
              ['G'] = actions.move_to_bottom,

              ['<C-u>'] = actions.preview_scrolling_up,
              ['<C-d>'] = actions.preview_scrolling_down,

              ['<PageUp>'] = actions.results_scrolling_up,
              ['<PageDown>'] = actions.results_scrolling_down,

              ['?'] = actions.which_key,
            },
          },
        },
        pickers = {
          find_file = {
            hidden = true,
          },
        },
      }
    end,
  },
}

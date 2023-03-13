return {
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-fzf-native.nvim' },
    branch = '0.1.x',
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
      telescope.load_extension('fzf')
    end,
    opts = function()
      local actions = require('telescope.actions')

      return {
        defaults = {
          path_display = { 'smart' },
          extensions = {
            fzf = {
              fuzzy = true,
              override_generic_sorter = true,
              override_file_sorter = true,
              case_mode = 'smart_case',
            },
            ['ui-select'] = {
              require('telescope.themes').get_dropdown {},
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

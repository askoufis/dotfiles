return {
  'lewis6991/gitsigns.nvim',
  version = '*',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = function()
    return {
      attach_to_untracked = true,
      on_attach = function(bufnr)
        local gitsigns = require('gitsigns')

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk('next')
          end
        end)

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk('prev')
          end
        end)

        -- Actions
        -- Invoke again to unstage hunk
        map('n', '<leader>hs', gitsigns.stage_hunk)
        map('n', '<leader>hr', gitsigns.reset_hunk)

        map('v', '<leader>hs', function()
          gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') }
        end)

        map('v', '<leader>hr', function()
          gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') }
        end)

        map('n', '<leader>hS', gitsigns.stage_buffer)
        map('n', '<leader>hR', gitsigns.reset_buffer)

        map('n', '<leader>hp', gitsigns.preview_hunk)

        -- Toggles
        map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
        map('n', '<leader>tw', gitsigns.toggle_word_diff)

        -- Text object
        -- `vih`
        map({ 'o', 'x' }, 'ih', gitsigns.select_hunk)
      end,
    }
  end,
}

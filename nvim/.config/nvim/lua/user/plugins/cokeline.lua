return {
  'noib3/nvim-cokeline',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  event = 'VeryLazy',
  keys = function()
    local keys = {}

    -- https://vi.stackexchange.com/a/31013 for info why these have to be non-recursive maps
    for i = 1, 9 do
      table.insert(keys, { ('<leader>s%s'):format(i), ('<Plug>(cokeline-switch-%s)'):format(i), noremap = false })
      table.insert(keys, { ('<leader>%s'):format(i), ('<Plug>(cokeline-focus-%s)'):format(i), noremap = false })
    end

    local more_keys = {
      { '<S-h>', '<Plug>(cokeline-focus-prev)', noremap = false },
      { '<S-l>', '<Plug>(cokeline-focus-next)', noremap = false },
      { '<leader>p', '<Plug>(cokeline-switch-prev)', noremap = false },
      { '<leader>n', '<Plug>(cokeline-switch-next)', noremap = false },
      { '<leader>x', '<Plug>(cokeline-pick-close)', noremap = false },
    }

    vim.list_extend(keys, more_keys)

    return keys
  end,
  config = true,
  opts = function()
    local is_picking_focus = require('cokeline/mappings').is_picking_focus
    local is_picking_close = require('cokeline/mappings').is_picking_close
    local get_hex = require('cokeline.hlgroups').get_hl_attr
    local moonfly_palette = require('moonfly').palette

    local comments_fg = get_hex('Comment', 'fg')
    local errors_fg = get_hex('MoonflyRed', 'fg')
    local warnings_fg = get_hex('MoonflyYellow', 'fg')

    local red = moonfly_palette.red
    local yellow = moonfly_palette.yellow
    local green = moonfly_palette.green
    local violet = moonfly_palette.violet
    local grey = moonfly_palette.grey246

    local components = {
      space = {
        text = ' ',
        truncation = { priority = 1 },
      },

      two_spaces = {
        text = '  ',
        truncation = { priority = 1 },
      },

      colon = {
        text = ':',
        truncation = { priority = 1 },
      },

      separator = {
        text = function(buffer)
          return buffer.is_focused and '▎' or '▏'
        end,
        truncation = { priority = 1 },
        fg = function(buffer)
          return buffer.is_focused and violet or nil
        end,
      },

      index = {
        text = function(buffer)
          local letter_or_index = (is_picking_focus() or is_picking_close()) and buffer.pick_letter or buffer.index
          return letter_or_index
        end,
        fg = function()
          return (is_picking_focus() and yellow) or (is_picking_close() and red) or nil
        end,
        style = function()
          return (is_picking_focus()) or (is_picking_close()) and 'bold,underline'
        end,
        truncation = { priority = 1 },
      },

      unique_prefix = {
        text = function(buffer)
          return buffer.unique_prefix
        end,
        fg = comments_fg,
        style = 'italic',
        truncation = {
          priority = 3,
          direction = 'left',
        },
      },

      filename = {
        text = function(buffer)
          return buffer.filename
        end,
        style = function(buffer)
          return ((buffer.is_focused and buffer.diagnostics.errors ~= 0) and 'bold,underline')
            or (buffer.is_focused and 'bold')
            or (buffer.diagnostics.errors ~= 0 and 'underline')
            or nil
        end,
        truncation = {
          priority = 2,
          direction = 'left',
        },
      },

      diagnostics = {
        text = function(buffer)
          return (buffer.diagnostics.errors ~= 0 and '  ' .. buffer.diagnostics.errors)
            or (buffer.diagnostics.warnings ~= 0 and '  ' .. buffer.diagnostics.warnings)
            or ''
        end,
        fg = function(buffer)
          return (buffer.diagnostics.errors ~= 0 and errors_fg)
            or (buffer.diagnostics.warnings ~= 0 and warnings_fg)
            or nil
        end,
        truncation = { priority = 1 },
      },

      close_or_unsaved = {
        text = function(buffer)
          return buffer.is_modified and '󰙏' or '󰖭'
        end,
        fg = function(buffer)
          local modified_color = buffer.is_modified and green
          return buffer.is_focused and modified_color or grey
        end,
        delete_buffer_on_left_click = true,
        truncation = { priority = 1 },
      },
    }

    return {
      show_if_buffers_are_at_least = 1,
      buffers = {
        -- filter_valid = function(buffer) return buffer.type ~= 'terminal' end,
        -- filter_visible = function(buffer) return buffer.type ~= 'terminal' end,
        new_buffers_position = 'next',
      },
      rendering = {
        max_buffer_width = 999,
      },
      default_hl = {
        fg = function(buffer)
          return buffer.is_focused and get_hex('Normal', 'fg') or get_hex('Comment', 'fg')
        end,
        bg = get_hex('ColorColumn', 'bg'),
      },
      components = {
        components.separator,
        components.space,
        components.index,
        components.colon,
        components.space,
        components.unique_prefix,
        components.filename,
        components.diagnostics,
        components.space,
        components.close_or_unsaved,
        components.space,
      },
    }
  end,
}

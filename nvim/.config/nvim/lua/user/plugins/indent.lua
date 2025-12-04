return {
  'saghen/blink.indent',
  version = '*',
  event = { 'BufReadPost', 'BufNewFile' },
  --- @module 'blink.indent'
  --- @type blink.indent.Config
  opts = {
    mappings = {
      object_scope = '',
    },
    static = {
      enabled = true,
      char = '▏',
      -- supported by moonfly theme
      highlight = { 'BlinkIndent' },
    },
    scope = {
      enabled = false,
    },
  },
}

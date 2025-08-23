---@diagnostic disable: undefined-global

return {
  -- Do this instead of &apos;
  s('apos', t('’')),

  postfix({
    trig = '.lsquo',
    desc = 'Convert the previous apostraphe into a opening single quote, or insert if missing',
    match_pattern = "'$",
    hidden = true,
    snippetType = 'autosnippet',
  }, {
    t('‘'),
  }),

  postfix({
    trig = '.apos',
    desc = 'Convert the previous apostraphe into an closing single quote, or insert if missing',
    match_pattern = "'$",
    hidden = true,
    snippetType = 'autosnippet',
  }, {
    t('’'),
  }),
  postfix({
    trig = '.rsquo',
    desc = 'Convert the previous apostraphe into closing single quote, or insert if missing',
    match_pattern = "'$",
    hidden = true,
    snippetType = 'autosnippet',
  }, {
    t('’'),
  }),

  postfix({
    trig = '.ldquo',
    desc = 'Convert the previous apostraphe into an opening double quote, or insert if missing',
    match_pattern = '"$',
    hidden = true,
    snippetType = 'autosnippet',
  }, {
    t('“'),
  }),

  postfix({
    trig = '.rdquo',
    desc = 'Convert the previous apostraphe into a closing double quote, or insert if missing',
    match_pattern = '"$',
    hidden = true,
    snippetType = 'autosnippet',
  }, {
    t('”'),
  }),
}

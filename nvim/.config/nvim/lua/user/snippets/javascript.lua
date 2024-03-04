return {
  s(
    {
      trig = 'clog',
      desc = 'Create a console.log statement and pass an object to it',
    },
    fmt('console.log({{ {} }})', {
      i(1),
    })
  ),

  s(
    {
      trig = 'wrap',
      desc = 'Wrap the selection in a tag',
    },
    fmt('<{}>{}</{}>', {
      i(1),
      f(function(_, snip)
        return snip.env.TM_SELECTED_TEXT[1] or {}
      end, {}),
      rep(1),
    })
  ),
}

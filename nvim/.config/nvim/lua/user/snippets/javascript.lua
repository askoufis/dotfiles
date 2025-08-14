---@diagnostic disable: undefined-global

return {
  s(
    {
      trig = 'clog',
      desc = 'Create a console.log statement and pass an object to it',
      snippetType = 'autosnippet',
      hidden = true,
    },
    fmt('console.log({{ {} }})', {
      i(1),
    })
  ),

  s(
    {
      trig = 'ins',
      desc = 'Log an object with infinite depth and colours',
      snippetType = 'autosnippet',
      hidden = true,
    },
    fmt('console.dir({{ {} }}, {{ colors: true, depth: null, maxArrayLength: null }})', {
      i(1),
    })
  ),
}

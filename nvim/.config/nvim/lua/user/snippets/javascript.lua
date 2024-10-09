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
      trig = 'ins',
      desc = 'Log an object with infinite depth and colours',
    },
    fmt('console.dir({{ {} }}, {{ colors: true, depth: null, maxArrayLength: null }})', {
      i(1),
    })
  ),
}

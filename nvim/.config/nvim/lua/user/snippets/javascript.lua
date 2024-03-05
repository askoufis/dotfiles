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
}

test = (input, expected) ->
  m = "#{input} "
  result = approximate input
  m+= if expected==result then 'ok' else "expected #{expected}, got #{result}"
  console.log m

approximate = require './approximate'
test 7,'7'
test 800,'800'
test 1200,'1.2K'
test 1000,'1K'
test 87821,'88K'
test 412011,'412K'
test 999949,'999K'
test 999950,'1M'
test 1000000,'1M'
test 6123922,'6.1M'
test 27969374,'28M'
test 28001341,'28M'
test 28061341,'28M'
test 812192442,'812M'
test 999949999,'999M'
test 999950000,'1B'
test 1000000000,'1B'

test -8,'-8'
test -5000,'-5K'
test -999949999,'-999M'
test -999950000,'-1B'

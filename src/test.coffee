test = (input, expected, options = {}) ->
  m = "#{input} "
  result = approximate input, options
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

units = {units: {thousand:'e3', million:'e6', billion:'e9'}}

test 7, '7', units
test 800, '800', units
test 1200, '1.2e3', units
test 1000, '1e3', units
test 87821, '88e3', units
test 412011, '412e3', units
test 999949, '999e3', units
test 999950, '1e6', units
test 1000000, '1e6', units
test 6123922, '6.1e6', units
test 27969374, '28e6', units
test 28001341, '28e6', units
test 28061341, '28e6', units
test 812192442, '812e6', units
test 999949999, '999e6', units
test 999950000, '1e9', units
test 1000000000, '1e9', units

test -8, '-8', units
test -5000, '-5e3', units
test -999949999, '-999e6', units
test -999950000, '-1e9', units

metrics = {units: { billion:'G'}}
test 7, '7', metrics
test 800, '800', metrics
test 1200, '1.2K', metrics
test 1000, '1K', metrics
test 87821, '88K', metrics
test 412011,'412K', metrics
test 999949, '999K', metrics
test 999950, '1M', metrics
test 1000000, '1M', metrics
test 6123922, '6.1M', metrics
test 27969374, '28M', metrics
test 28001341, '28M', metrics
test 28061341, '28M', metrics
test 812192442, '812M', metrics
test 999949999, '999M', metrics
test 999950000, '1G', metrics
test 1000000000, '1G', metrics

test -8, '-8', metrics
test -5000, '-5K', metrics
test -999949999, '-999M', metrics
test -999950000, '-1G', metrics
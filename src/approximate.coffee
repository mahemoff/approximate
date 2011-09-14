merge = (a,b) ->
  a[key] = val for key,val of b if b
  a

approximate = (num, options = {}) ->

  units = merge { thousand: 'K', million: 'M', billion: 'B'}, options.units

  num = parseInt(num);
  if Math.abs(num) >=999950000
    format num, 1000000000, units['billion']
  else if Math.abs(num) >=999950
    format num, 1000000, units['million']
  else if Math.abs(num) >= 1000
    format num, 1000, units['thousand']
  else
    num + ''

format = (num, divisor, suffix) ->
  num = num / divisor
  decimals = if Math.abs(num) < 10 then 1 else 0
  num = num.toFixed(decimals).replace('1000', '999') # sloppy (due to > comparisons)
  num.replace(/\.0+$/, '') + suffix

if module? and module.exports
  module.exports = approximate
else
  window.approximate = approximate

/* PLEASE DON'T EDIT THIS FILE AS IT'S AUTOGENERATED. 
 * The source is index.coffee. Change that.
 */

(function() {
  var approximate, format;
  approximate = function(num) {
    num = parseInt(num);
    if (Math.abs(num) >= 999950000) {
      return format(num, 1000000000, 'B');
    } else if (Math.abs(num) >= 999950) {
      return format(num, 1000000, 'M');
    } else if (Math.abs(num) >= 1000) {
      return format(num, 1000, 'K');
    } else {
      return num + '';
    }
  };
  format = function(num, divisor, suffix) {
    var decimals;
    num = num / divisor;
    decimals = Math.abs(num) < 10 ? 1 : 0;
    num = num.toFixed(decimals).replace('1000', '999');
    return num.replace(/\.0+$/, '') + suffix;
  };
  if ((typeof module !== "undefined" && module !== null) && module.exports) {
    module.exports = approximate;
  } else {
    window.approximate = approximate;
  }
}).call(this);
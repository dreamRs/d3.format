
function applyFormat(specifier, vector, prefix, suffix, definition) {
  var locale = d3.formatLocale(definition);
  return vector.map(x => {
    if (x == "NA") {
      return null;
    } else {
      return prefix + locale.format(specifier)(x) + suffix;
    }
  });
}

function widgetFormat(specifier, prefix, suffix, definition) {
  return function(x) {
    var val;
    if (typeof x.value != "undefined") {
      val = x.value;
    } else {
      val = x;
    }
    var locale = d3.formatLocale(JSON.parse(definition));
    return prefix + locale.format(specifier)(val) + suffix;
  };
}


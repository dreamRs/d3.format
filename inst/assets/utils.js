
function applyFormat(format, vector, definition) {
  var locale = d3.formatLocale(definition);
  return vector.map(x => {
    if (x == "NA") {
      return null;
    } else {
      return locale.format(format)(x);
    }
  });
}




function applyFormat(format, vector, definition) {
  var locale = d3.formatLocale(definition);
  return vector.map(x => locale.format(format)(x));
}



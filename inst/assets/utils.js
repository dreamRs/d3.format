
function applyFormat(format, vector) {
  return vector.map(x => d3.format(format)(x));
}



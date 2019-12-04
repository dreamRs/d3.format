
#' d3.format
#'
#' @param specifier Format
#'
#' @return
#' @export
#'
#' @examples
d3.format <- function(specifier) {
  force(specifier)
  function(x) {
    .globals$ctx$call(fun = "apply_format", specifier, x)
  }
}

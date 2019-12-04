
#' @title d3.format
#'
#' @description Format numbers for human consumption
#'  with \href{https://github.com/d3/d3-format}{d3.format}.
#'
#' @param specifier A specifier to format value(s),
#'  see \url{https://github.com/d3/d3-format#format} for details.
#'
#' @return a character vector
#' @export
#'
#' @example examples/d3_format.R
d3_format <- function(specifier) {
  force(specifier)
  function(x) {
    ctx <- get_context()
    ctx$call(fun = "applyFormat", specifier, list1(x))
  }
}

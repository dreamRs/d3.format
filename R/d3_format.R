
#' @title d3.format
#'
#' @description Format numbers for human consumption
#'  with \href{https://github.com/d3/d3-format}{d3.format}.
#'
#' @param specifier A specifier to format value(s),
#'  see \url{https://github.com/d3/d3-format#format} for details.
#' @param locale Locale to use, for example \code{"fr-FR"} for french,
#'  see possible values here: \url{https://github.com/d3/d3-format/tree/master/locale}.
#'
#' @return a character vector
#' @export
#'
#' @example examples/d3_format.R
d3_format <- function(specifier, locale = "en-US") {
  force(specifier)
  locale <- read_locale(locale)
  function(x) {
    ctx <- get_context()
    ctx$call(fun = "applyFormat", specifier, list1(x), locale)
  }
}

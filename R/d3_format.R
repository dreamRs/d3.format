
#' @title d3.format
#'
#' @description Format numbers for human consumption
#'  with \href{https://github.com/d3/d3-format}{d3.format}.
#'
#' @param specifier A specifier to format value(s),
#'  see \url{https://github.com/d3/d3-format#format} for details.
#' @param prefix Character string to append before formatted value.
#' @param suffix Character string to append after formatted value.
#' @param locale Locale to use, for example \code{"fr-FR"} for french,
#'  see possible values here: \url{https://github.com/d3/d3-format/tree/master/locale}.
#'
#' @return a character vector
#' @export
#'
#' @example examples/d3_format.R
d3_format <- function(specifier, prefix = "", suffix = "", locale = "en-US") {
  force(specifier)
  locale <- read_locale(locale)
  function(x) {
    ctx <- get_context()
    ctx$call(
      fun = "applyFormat",
      specifier, list1(x),
      prefix, suffix, locale
    )
  }
}

#' @export
#' @aliases d3_format
#' @rdname d3_format
d3.format <- d3_format


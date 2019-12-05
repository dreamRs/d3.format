
#' @importFrom htmltools htmlDependency
d3_format_dependency <- function() {
  htmlDependency(
    name = "d3-format",
    version = "1.4.2.1",
    src = c(file = "assets"),
    package = "d3.format",
    script = c("d3-format/d3-format.min.js", "utils.js")
  )
}

#' Use d3.format with a htmlwidget
#'
#' @param widget An object of type \code{htmlwidget}.
#'
#' @return The same \code{htmlwidget} with an extra dependency.
#' @export
#'
#' @examples
use_d3_format <- function(widget) {
  if (!inherits(x = widget, what = "htmlwidget")) {
    stop("use_d3_format must be used with an htmlwidget !")
  }
  widget$dependencies <- c(
    widget$dependencies,
    list(d3_format_dependency())
  )
  widget
}


#' Format numbers in htmlwidgets
#'
#' @param specifier Format for numbers, currency, percentage, e.g. \code{".0\%"} for rounded percentage.
#'  See online documentation : \url{https://github.com/d3/d3-format}.
#' @param prefix Character string to append before formatted value.
#' @param suffix Character string to append after formatted value.
#' @param locale Localization to use, for example \code{"fr-FR"} for french,
#'  see possible values here: \url{https://github.com/d3/d3-format/tree/master/locale}.
#'
#' @return a \code{JS} function
#' @export
#'
# @examples
d3_format_js <- function(specifier, prefix = "", suffix = "", locale = "en-US") {
  locale <- read_locale(locale, as_text = TRUE)
  js <- sprintf(
    "widgetFormat('%s', '%s', '%s', '%s');",
    specifier, prefix, suffix, locale
  )
  class(js) <- c("JS_EVAL", class(js))
  return(js)
}


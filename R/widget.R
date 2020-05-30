
#' @title HTML dependency for d3.format
#'
#' @description This can be used to add a dependency in \code{htmlwidget}
#'  but also to load d3.format in shiny applications or RMarkdown
#'
#' @return an \code{\link[htmltools]{htmlDependency}} object.
#' @export
#'
#' @importFrom htmltools htmlDependency
#'
#' @examples
#' # This will return an HTML dependency
#' html_dependency_d3format()
#' # Using it in shiny or markdown will allow
#' # to use d3.format JavaScript API
#'
#' \dontrun{
#'
#' # when autoring htmlwidgets, you can
#' # add the dependency in createWidget:
#'
#' createWidget(
#'   name = "mywidget",
#'   x = x,
#'   dependencies = list(
#'     html_dependency_d3format()
#'   )
#' )
#'
#' }
#'
html_dependency_d3format <- function() {
  htmlDependency(
    name = "d3-format",
    version = "1.4.4",
    src = c(file = "assets"),
    package = "d3.format",
    script = c("d3-format/d3-format.min.js", "utils.js"),
    all_files = FALSE
  )
}

#' Use d3.format with a htmlwidget
#'
#' @description Format numbers in htmlwidgets with \href{https://github.com/d3/d3-format}{d3.format}.
#'
#' @param widget An object of type \code{htmlwidget}.
#'
#' @return The same \code{htmlwidget} with an extra dependency.
#' @export
#'
#' @example examples/widget.R
use_d3_format <- function(widget) {
  if (!inherits(x = widget, what = "htmlwidget")) {
    stop("use_d3_format must be used with an htmlwidget !")
  }
  widget$dependencies <- c(
    widget$dependencies,
    list(html_dependency_d3format())
  )
  widget
}



#' @param specifier Format for numbers, currency, percentage, e.g. \code{".0\%"} for rounded percentage.
#'  See online documentation : \url{https://github.com/d3/d3-format}.
#' @param prefix Character string to append before formatted value.
#' @param suffix Character string to append after formatted value.
#' @param locale Localization to use, for example \code{"fr-FR"} for french,
#'  see possible values here: \url{https://github.com/d3/d3-format/tree/master/locale}.
#'
#' @return a \code{JS} function
#' @export
#' @aliases use_d3_format
#' @rdname use_d3_format
#'
d3_format_js <- function(specifier, prefix = "", suffix = "", locale = "en-US") {
  locale <- read_locale(locale, as_text = TRUE)
  js <- sprintf(
    "widgetFormat('%s', '%s', '%s', '%s');",
    specifier, prefix, suffix, locale
  )
  class(js) <- c("JS_EVAL", class(js))
  return(js)
}


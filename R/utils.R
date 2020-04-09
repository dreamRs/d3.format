
path_d3_format_js <- function() {
  system.file("assets/d3-format/d3-format.min.js", package = "d3.format")
}
path_utils_js <- function() {
  system.file("assets/utils.js", package = "d3.format")
}

path_locales_js <- function() {
  system.file("assets/d3-format/locale", package = "d3.format")
}

#' @importFrom V8 new_context
get_context <- function() {
  if (!is.null(.globals$ctx)) {
    return(.globals$ctx)
  } else {
    ctx <- V8::new_context()
    ctx$source(file = path_d3_format_js())
    ctx$source(file = path_utils_js())
    return(ctx)
  }
}

list1 <- function (x) {
  if (length(x) == 1) {
    list(x)
  } else {
    x
  }
}

check_locale <- function(x) {
  if(is.character(x)){
    json <- list.files(path = path_locales_js())
    njson <- gsub("\\.json", "", json)
    if (!x %in% njson) {
      stop(paste(
        "Invalid locale, must be one of:",
        paste(njson, collapse = ", ")
      ), call. = FALSE)
    }
  }
}

#' @importFrom jsonlite read_json
read_locale <- function(locale, as_text = FALSE) {
  check_locale(locale)
  if(is.character(locale)){
    path <- file.path(path_locales_js(), paste0(locale, ".json"))
    if (as_text) {
      locale <- paste(readLines(con = path, encoding = "UTF-8"), collapse = "")
    } else {
      locale <- jsonlite::read_json(path = path)
    }
  }
  if(is.list(locale)){
    default_locale <- read_default_locale()
    locale <- modifyList(default_locale, locale)
  }
  locale
}

read_default_locale <- function(){
  path <- file.path(path_locales_js(), "en-US.json")
  jsonlite::read_json(path = path)
}


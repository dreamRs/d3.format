
path_d3_format_js <- function() {
  system.file("assets/d3-format/d3-format.min.js", package = "d3.format")
}
path_utils_js <- function() {
  system.file("assets/utils.js", package = "d3.format")
}

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

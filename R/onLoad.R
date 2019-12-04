.globals <- new.env(parent = emptyenv())

#' @importFrom V8 new_context
.onLoad <- function(libname, pkgname){
  .globals$ctx <- V8::new_context()
  .globals$ctx$source(file = path_d3_format_js())
  .globals$ctx$source(file = path_utils_js())
}

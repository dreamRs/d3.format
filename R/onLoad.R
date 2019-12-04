.globals <- new.env(parent = emptyenv())

.onLoad <- function(libname, pkgname){
  .globals$ctx <- V8::new_context()
  .globals$ctx$source(file = system.file("assets/d3-format/d3-format.min.js", package = "d3.format"))
  .globals$ctx$source(file = system.file("assets/utils.js", package = "d3.format"))
}

################################################################################

.onLoad <- function(libname, pkgname) {
  options(
    bigstatsr.ncores.max = parallel::detectCores(),
    bigstatsr.check.args = TRUE,
    bigstatsr.block.sizeGB = 1,
    bigstatsr.typecast.warning = TRUE
  )
}

################################################################################

.onUnload <- function(libpath) {
  options(
    bigstatsr.ncores.max = NULL,
    bigstatsr.check.args = NULL,
    bigstatsr.block.sizeGB = NULL,
    bigstatsr.typecast.warning = NULL
  )
}

################################################################################

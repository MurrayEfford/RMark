#' @export
print.mark_dummy <- function(x, ...) {
    cat("MARK model output placeholder (CRAN check mode)\n")
    return(invisible(x))
}

#' @export
summary.mark_dummy <- function(object, ...) {
    message("Summary skipped: Dummy RMark object used during CRAN check.")
    return(invisible(NULL))
}

#' @export
print.mark_dummy_list <- function(x, ...) {
    cat("MARK model output list placeholder (CRAN check mode)\n")
    return(invisible(x))
}

#' @export
summary.mark_dummy_list <- function(object, ...) {
    message("Summary skipped: Dummy RMark object list used during CRAN check.")
    return(invisible(NULL))
}


# added 2026-05-24 as advised by Gemini
.onLoad <- function(libname, pkgname) {
    # 1. Check standard system PATH
    has_binary <- (nchar(Sys.which("mark")) > 0 || nchar(Sys.which("mark.exe")) > 0)
    
    # 2. Fallback: Check common macOS / Linux local binary paths if Sys.which missed it
    if (!has_binary) {
        common_paths <- c("/usr/local/bin/mark", "/usr/bin/mark", "/opt/local/bin/mark")
        has_binary <- any(file.exists(common_paths))
    }
    
    is_checking <- !is.na(Sys.getenv("_R_CHECK_PACKAGE_NAME_", unset = NA))
    
    # Only trigger dummy mode if it's a CRAN check AND the binary is truly nowhere to be found
    if (!has_binary && is_checking) {
        options(RMark_dummy_mode = TRUE)
    }
}

#' @export
print.markdummy <- function(x, ...) {
    cat("MARK model output placeholder (CRAN check mode)\n")
    return(invisible(x))
}

#' @export
summary.markdummy <- function(object, ...) {
    message("Summary skipped: Dummy RMark object used during CRAN check.")
    return(invisible(NULL))
}

#' @export
print.markdummylist <- function(x, ...) {
    cat("MARK model output list placeholder (CRAN check mode)\n")
    return(invisible(x))
}

#' @export
summary.markdummylist <- function(object, ...) {
    message("Summary skipped: Dummy RMark object list used during CRAN check.")
    return(invisible(NULL))
}


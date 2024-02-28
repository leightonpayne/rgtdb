
#' Check GTDB releases
#' @export
check_release <- function() {
  httr::GET("https://data.gtdb.ecogenomic.org/releases/") %>%
    httr::content(as = "text") %>%
    rvest::read_html() %>%
    rvest::html_nodes("a") %>%
    rvest::html_attr("href") %>%
    stringr::str_extract("release[0-9]*") %>%
    stringr::str_subset("release[0-9]*") %>%
    cli::cli_bullets()
}

# function() {
#   cli::cli_text("Downloading metadata")
#   cli::cli_alert_success("Downloaded metadata")
#   cli::
# }

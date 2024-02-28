#' Separate the GTDB Taxonomy column into one column per rank
#' @param metadata GTDB metadata table.
#' @return A [tibble::tibble()].
#' @export
separate_gtdb_taxonomy <- function(metadata) {
  gtdb_taxonomy <- key <- value <- NULL
  a <- tidyr::separate_longer_delim(metadata, cols = gtdb_taxonomy, delim = ";")
  b <- tidyr::separate_wider_delim(a, cols = gtdb_taxonomy, delim = "__", names = c("key", "value"))
  c <- dplyr::mutate(b, key = paste0("gtdb_", key))
  d <- tidyr::pivot_wider(c, names_from = key, values_from = value)
  d
}

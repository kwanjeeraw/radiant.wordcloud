#' Launch Radiant in the default browser
#'
#' @details See \url{https://radiant-rstats.github.io/docs} for documentation and tutorials
#'
#' @export
radiant.wordcloud <- function() {
  if (!"package:radiant.wordcloud" %in% search())
    if (!require(radiant.multivariate.dev)) stop("Calling radiant.wordcloud start function but radiant.wordcloud is not installed.")
  runApp(system.file("app", package = "radiant.wordcloud"), launch.browser = TRUE)
}

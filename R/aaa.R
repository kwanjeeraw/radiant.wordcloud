# to avoid 'no visible binding for global variable' NOTE
globalVariables(c(".","y","nr_clus","nr_fact","height","bump","n","se","ci"))

#' radiant.wordcloud
#'
#' @name radiant.wordcloud
#' @docType package
#' @import radiant.data shiny ggplot2
#' @importFrom dplyr select select_ filter mutate funs group_by group_by_ summarise_each lag slice
#' @importFrom magrittr %>% %<>% %T>% set_colnames set_rownames
#' @importFrom gridExtra arrangeGrob
#' @importFrom scales percent
#' @importFrom import from
#' @importFrom grDevices rainbow
#' @importFrom graphics abline arrows par plot points text title
#' @importFrom methods is
#' @importFrom stats as.dendrogram as.dist cmdscale cor cov cutree dist factanal hclust kmeans lm na.omit qt sd
NULL

#' wordcloud
#' @details Rankings reflect the evaluation of 18 alternative carpet cleaners by one respondent. Description provided in attr(carpet,"description")
#' @docType data
#' @keywords datasets
#' @name wordcloud
#' @usage data(wordcloud)
#' @format A data frame with 18 rows and 5 variables
NULL

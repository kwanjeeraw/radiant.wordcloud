#'Compute wordCloud of the input entities
#'@param txtinput a character vector of entities e.g. c('pubchemId1', 'pubchemId2').
#'The value can be neo4j ids or grinn ids, see details and see \code{\link{convertId}} for how to convert ids.
#'For Mesh annotation, PubChem CIDs are required.
#'@param wordtable a string specifying a node type. It can be one of compound (default), protein, gene, pathway, rna, dna.
#'@return list of data frame of nodes, edges and wordcloud. The nodes data frame contains input attributes. The edges data frame contains annotation pairs.
#'The data frame of wordcloud contains the following components:
#'@author Kwanjeera W \email{kwanich@@ucdavis.edu}
#'@references http://www.sthda.com/english/wiki/text-mining-and-word-cloud-fundamentals-in-r-5-simple-steps-you-should-know
#'@seealso \pkg{\link{tm}}, \pkg{\link{wordcloud}}
#'@examples
#'#txtinput <- c(1110,10413,196,51,311,43,764,790) #compute wordCloud for given pubchem compounds
#'#result <- computeNodeWordCloud(txtinput=txtinput, nodetype="compound", annotation="mesh", internalid=FALSE)
#'#wordcloud::wordcloud(words = result$wordcloud$nodename, freq = result$wordcloud$freq, scale=c(2,.1),min.freq = 1,max.words=50, random.order=FALSE, rot.per=0.5, colors=RColorBrewer::brewer.pal(8, "Dark2"))
#'#barplot(result$wordcloud$freq[1:10], las = 2, names.arg = result$wordcloud$nodename[1:10], col ="lightblue", main ="Most frequent words", ylab = "Word frequencies")
#'@export
callWordCloud <- function(){
  cat("Computing wordCloud ...\n")
  #wordtable = data("wordcloud")
  data("wordcloud")
  #wordcloud::wordcloud(words = wordtable$nodename, freq = wordtable$freq, scale=c(2,.1),min.freq = 1,max.words=50, random.order=FALSE, rot.per=0.5, colors=RColorBrewer::brewer.pal(8, "Dark2"))
  wordcloud::wordcloud(words = wordcloud$nodename, freq = wordcloud$freq, scale=c(2,.1),min.freq = 1,max.words=50, random.order=FALSE, rot.per=0.5, colors=RColorBrewer::brewer.pal(8, "Dark2"))
}
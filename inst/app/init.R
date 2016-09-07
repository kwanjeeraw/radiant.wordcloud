## urls for menu
r_url_list <- getOption("radiant.url.list")
# r_url_list[["Linear regression (OLS)"]] <-
#   list("tabs_regress" = list("Summary" = "model/regress/",
#                              "Predict" = "model/regress/predict/",
#                              "Plot"    = "model/regress/plot/"))
# 
r_url_list[["Wordcloud"]] <-
  list("tabs_wordcloud" = list("Data" = "wordcloud/callWordCloud/",
                               "Plot" = "wordcloud/callWordCloud"))
options(radiant.url.list = r_url_list); rm(r_url_list)

## design menu
options(radiant.wordcloud_ui =
	tagList(
	  navbarMenu("Wordcloud",
	    "LABEL",
	    tabPanel("Wordcloud", uiOutput("wordcloud"))
    )
  )
)

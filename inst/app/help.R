help_wordcloud <- c("Wordcloud" = "mds.md")

output$help_wordcloud <- reactive(append_help("help_wordcloud", file.path(getOption("radiant.path.multivariate"),"app/tools/help/")))
observeEvent(input$help_wordcloud_all, {help_switch(input$help_wordcloud_all, "help_wordcloud")})
observeEvent(input$help_wordcloud_none, {help_switch(input$help_wordcloud_none, "help_wordcloud", help_on = FALSE)})

help_wordcloud_panel <- tagList(
  wellPanel(
    HTML("<label>Wordcloud menu: <i id='help_wordcloud_all' title='Check all' href='#' class='action-button glyphicon glyphicon-ok'></i>
    <i id='help_wordcloud_none' title='Uncheck all' href='#' class='action-button glyphicon glyphicon-remove'></i></label>"),
    checkboxGroupInput("help_wordcloud", NULL, help_wordcloud,
      selected = state_group("help_wordcloud"), inline = TRUE)
  )
)

## data ui and tabs
output$ui_wordcloud <- renderUI({
  req(input$dataset)
  tagList(
    wellPanel(
      actionButton("reg_run", "Estimate", width = "100%")
    ),
    conditionalPanel(condition = "input.tabs_regress == 'Predict'",
                     wellPanel(
                       selectInput("reg_predict", label = "Prediction input:", reg_predict,
                                   selected = state_single("reg_predict", reg_predict, "none")),
                       conditionalPanel("input.reg_predict == 'data' | input.reg_predict == 'datacmd'",
                                        selectizeInput(inputId = "reg_pred_data", label = "Predict for profiles:",
                                                       choices = c("None" = "",r_data$datasetlist),
                                                       selected = state_single("reg_pred_data", c("None" = "",r_data$datasetlist)), multiple = FALSE)
                       ),
                       conditionalPanel("input.reg_predict == 'cmd' | input.reg_predict == 'datacmd'",
                                        returnTextAreaInput("reg_pred_cmd", "Prediction command:",
                                                            value = state_init("reg_pred_cmd", ""))
                       ),
                       conditionalPanel(condition = "input.reg_predict != 'none'",
                                        checkboxInput("reg_pred_plot", "Plot predictions", state_init("reg_pred_plot", FALSE)),
                                        conditionalPanel("input.reg_pred_plot == true",
                                                         uiOutput("ui_reg_predict_plot")
                                        )
                       ),
                       ## only show if full data is used for prediction
                       conditionalPanel("input.reg_predict == 'data' | input.reg_predict == 'datacmd'",
                                        tags$table(
                                          tags$td(textInput("reg_store_pred_name", "Store predictions:", state_init("reg_store_pred_name","predict_reg"))),
                                          tags$td(actionButton("reg_store_pred", "Store"), style="padding-top:30px;")
                                        )
                       )
                     )
    ),
    conditionalPanel(condition = "input.tabs_regress == 'Plot'",
                     wellPanel(
                       selectInput("reg_plots", "Regression plots:", choices = reg_plots,
                                   selected = state_single("reg_plots", reg_plots)),
                       conditionalPanel(condition = "input.reg_plots == 'coef'",
                                        checkboxInput("reg_intercept", "Include intercept", state_init("reg_intercept", FALSE))
                       ),
                       conditionalPanel(condition = "input.reg_plots == 'scatter' |
                                        input.reg_plots == 'dashboard' |
                                        input.reg_plots == 'resid_pred'",
                                        checkboxGroupInput("reg_lines", NULL, reg_lines,
                                                           selected = state_group("reg_lines"), inline = TRUE)
                       )
    )
    ),
    
    wellPanel(
      uiOutput("ui_reg_rvar"),
      uiOutput("ui_reg_evar"),
      
      conditionalPanel(condition = "input.reg_evar != null",
                       
                       uiOutput("ui_reg_show_interactions"),
                       conditionalPanel(condition = "input.reg_show_interactions != ''",
                                        uiOutput("ui_reg_int")
                       ),
                       conditionalPanel(condition = "input.tabs_regress == 'Summary'",
                                        uiOutput("ui_reg_test_var"),
                                        checkboxGroupInput("reg_check", NULL, reg_check,
                                                           selected = state_group("reg_check"), inline = TRUE),
                                        checkboxGroupInput("reg_sum_check", NULL, reg_sum_check,
                                                           selected = state_group("reg_sum_check"), inline = TRUE)
                       ),
                       conditionalPanel(condition = "input.reg_predict == 'cmd' |
                                        input.reg_predict == 'data' |
                                        (input.reg_sum_check && input.reg_sum_check.indexOf('confint') >= 0) |
                                        input.reg_plots == 'coef'",
                                        sliderInput("reg_conf_lev", "Confidence level:", min = 0.80,
                                                    max = 0.99, value = state_init("reg_conf_lev",.95),
                                                    step = 0.01)
                       ),
                       ## Only save residuals when filter is off
                       conditionalPanel(condition = "input.tabs_regress == 'Summary'",
                                        tags$table(
                                          tags$td(textInput("reg_store_res_name", "Store residuals:", state_init("reg_store_res_name","residuals_reg"))),
                                          tags$td(actionButton("reg_store_res", "Store"), style="padding-top:30px;")
                                        )
                       )
    )
                     ),
    help_and_report(modal_title = "Linear regression (OLS)", fun_name = "regress",
                    help_file = inclRmd(file.path(getOption("radiant.path.model"),"app/tools/help/regress.Rmd")))
                     )
})

# output is called from the main radiant ui.R
output$wordcloud <- renderUI({
  
  register_print_output("summary_regress", ".summary_regress")
  
  # two separate tabs
  reg_output_panels <- tabsetPanel(
    id = "tabs_wordcloud",
    tabPanel("Data",
             downloadLink("dl_reg_coef", "", class = "fa fa-download alignright"), br(),
             verbatimTextOutput("summary_regress")),
    tabPanel("Plot",
             plotOutput("plotwc", width = "100%", height = "600px"))
  )
  
  stat_tab_panel(menu = "Model > Estimate",
                 tool = "Linear regression (OLS)",
                 tool_ui = "ui_regress",
                 output_panels = reg_output_panels)
})

.summary_regress <- reactive({
  str(data(wordcloud))
})
output$plotwc <- renderPlot({
  callWordCloud()
})
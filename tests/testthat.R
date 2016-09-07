## use shift-cmd-t to run all tests
library(testthat)
test_check("radiant.wordcloud")
# if (interactive() && !exists("coverage_test")) devtools::run_examples()

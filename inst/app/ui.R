## ui for design menu in radiant
do.call(navbarPage,
  c("Radiant", getOption("radiant.nav_ui"), getOption("radiant.wordcloud_ui"),
    getOption("radiant.shared_ui"), help_menu("help_wordcloud_ui"))
)

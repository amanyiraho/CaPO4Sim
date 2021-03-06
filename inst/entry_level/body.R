# useful datas for videos
video_data <- data.frame(
  caption = c("Calcium", "Phosphate", "Parathyroid hormone"),
  src = c(
    "https://youtube.com/embed/9x2QFK6_IkQ",
    "https://youtube.com/embed/1eh5VF6poWo",
    "https://youtube.com/embed/5OEenuXMjyg"
  )
)

body <- dashboardBody(

  # load the css
  includeCSS(path = "www/css/case_studies_app.css"),

  # include scripts
  tags$head(includeScript(paste0(getwd(), "/www/js/rintrojs_count.js"))),
  includeScript(path = "www/js/find-navigator.js"),
  tags$head(includeScript(paste0(getwd(), "/www/js/hotjar.js"))),

  # Load other JS facilities
  useShinyjs(),
  introjsUI(),
  withMathJax(),
  use_bs_popover(),
  use_bs_tooltip(),

  extendShinyjs(script = "www/js/fullscreen.js"),

  # shinyEffects
  setShadow(id = "boxPlot"),
  setShadow(id = "boxNetwork"),
  setShadow(class = "dropdown-menu"),
  setShadow(id = "boxNetwork"),
  setShadow(id = "boxGlossary"),
  setZoom(id = "boxNetwork", scale = 1.01),
  setZoom(id = "boxPlot", scale = 1.01),
  setZoom(id = "boxGlossary", scale = 1.01),
  setShadow(class = "modal-content"),
  setZoom(class = "modal-content"),

  # shinyWidgets bonus
  chooseSliderSkin(skin = "Flat"),

  # Main application Panel
  tabItems(
    tabItem(
      tabName = "main",
      fluidRow(
        # load the CaPO4 network box module
        networkCaPO4Ui(id = "network"),
        # load the graph box module
        plotBoxUi(id = "graphs")
      )
    ),

    # Video panels
    tabItem(
      tabName = "video",
      # load video module
      videoUi(id = "CaPO4_movies", data = video_data)
    ),

    # About section Panel
    tabItem(
      tabName = "about",
      div(
        id = "about_us",
        HTML(
          paste("<img style=\"height: 100%; width: 100%; object-fit: contain\"
                border=\"0\" align=\"center\"  src=\"logos/about_us.jpg\"/> ")
        )
      )
    ),
    # Glossary Panel
    tabItem(
      tabName = "glossary",
      glossaryCaPO4Ui(id = "lexicus")
    )
  )
)

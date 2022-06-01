library(package = shiny)
library(package = shinydashboard)

dashboardPage(title = "Garantias",
  header = Cabecalho,
  sidebar = Barra_Lateral,
  dashboardBody(
    tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "style.css")),
    tabItems(
      TabsHome,
      TabsMonitoramento,
      TabsResumo,
      TabsApoio_Registro,
      TabsApoio_Fatores
    ),
  )
)


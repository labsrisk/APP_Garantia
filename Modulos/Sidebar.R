library(package = shiny)
library(package = shinydashboard)
library(package = glue)
library(package = shinydashboardPlus)

Caminho_Base <- "C:/Users/wesleysilva/Desktop/Projetos_Github/APP_Garantia"

Barra_Lateral <- dashboardSidebar(
  sidebarMenu(id = "Menu_Principal",
              menuItem(text = "Home", tabName = "Home", selected = TRUE),
              menuItem(text = "Resumo", tabName = "Resumo"),
              menuItem(text = "Monitoramento", tabName = "Monitoramento"),
              menuItem(text = "Apoio", 
                       menuSubItem(text = "Planilha Risco", tabName = "Material_Apoio_Registro"),
                       menuSubItem(text = "Planilha Fatores", tabName = "Material_Apoio_Fatores")),
              menuItem(text = "Documentos", tabName = "Documentos")
              )
)


saveRDS(object = Barra_Lateral, file = glue("{Caminho_Base}/Modulos/Sidebar.RDS"))
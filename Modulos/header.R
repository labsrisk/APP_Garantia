library(package = shiny)
library(package = shinydashboard)
library(package = glue)

Caminho_Base <- "C:/Users/wesleysilva/Desktop/Projetos_Github/APP_Garantia"

Cabecalho <- dashboardHeader(title = "")


saveRDS(object = Cabecalho, file = glue("{Caminho_Base}/Modulos/header.RDS"))

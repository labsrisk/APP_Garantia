library(package = shiny)
library(package = shinydashboard)
library(package = Cairo)
library(package = glue)
library(package = readxl)
library(package = tidyverse)
library(package = ggthemes)
library(package = gRain) #Criação Da Rede Bayesiana
library(package = RBGL)  #Criação Da Rede Bayesiana
library(package = bnlearn) #Criação Da Rede Bayesiana
library(package = MASS)
library(package = xlsx)
library(package = ggpubr)
library(package = scales)
library(package = shinydashboardPlus) #Icones De Redes Sociais...

#Aumentando a qualidade dos gráficos.
options(shiny.usecairo = TRUE)

Caminho_Base <- "C:/Users/wesleysilva/Desktop/Projetos_Github/APP_Garantia"

#Carregando Os Objetos De Estrutura Do APP.
Cabecalho <- readRDS(file = glue("{Caminho_Base}/Modulos/header.RDS"))
Barra_Lateral <- readRDS(file = glue("{Caminho_Base}/Modulos/Sidebar.RDS"))

#Carregando As UI´S De Cada Item Do Menu.
TabsMonitoramento <- readRDS(file = glue("{Caminho_Base}/Tabs/ui/Monitoramento.RDS"))
TabsResumo <- readRDS(file = glue("{Caminho_Base}/Tabs/ui/Resumo.RDS"))
TabsApoio_Registro <- readRDS(file = glue("{Caminho_Base}/Tabs/ui/Material_Apoio_Registro.RDS"))
TabsApoio_Fatores <- readRDS(file = glue("{Caminho_Base}/Tabs/ui/Material_Apoio_Fatores.RDS"))
TabsHome <- readRDS(file = glue("{Caminho_Base}/Tabs/ui/Home.RDS"))

#Carregando Arquivos
Planilha_Riscos <- read_xlsx(path = glue("{Caminho_Base}/Planilhas/Planilha_Riscos.xlsx"))
Planilha_Fatores <- read_xlsx(path = glue("{Caminho_Base}/Planilhas/Planilha_Riscos.xlsx"), sheet = 2)
Lista <- list("Riscos" = read_xlsx(path = glue("{Caminho_Base}/Planilhas/Template.xlsx")), 
              "Fatores" = read_xlsx(path = glue("{Caminho_Base}/Planilhas/Template.xlsx"), sheet = 2))

#Carregando Funções
Alocacao_Custo_Tempo <- readRDS(file = "C:/Users/wesleysilva/Desktop/Funções/Alocacao_Custo_Tempo.rds")
Alocacao_Prob_Tempo <- readRDS(file = "C:/Users/wesleysilva/Desktop/Funções/Alocacao_Prob_Tempo.rds")
Modelando_Rede_Bayesiana <- readRDS(file = "C:/Users/wesleysilva/Desktop/Funções/Modelando_Rede_Bayesiana.rds")
F_Motor_Quant_Riscos <- readRDS(file = "C:/Users/wesleysilva/Desktop/Funções/F_Motor_Quant_Riscos.rds")

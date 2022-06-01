library(package = shiny)
library(package = shinydashboard)
library(package = glue)

Caminho_Base <- "C:/Users/wesleysilva/Desktop/Projetos_Github/APP_Garantia"

TabsMonitoramento <- tabItem(tabName = "Monitoramento", 
                             plotOutput(outputId = "Grafico_Rede"),
                             h1("Situação Atualizada"),
                             sliderInput(inputId = "Grau_Confianca", label = "Grau De Confiança", min = 5, max = 100, value = 90, step = 5, post = "%"),
                             plotOutput(outputId = "Grafico_Conjunto"),
                             h1("Olhar Por Risco"),
                             selectInput(inputId = "Escolha_Riscos", label = "Escolha Risco De Interesse", choices = Planilha_Riscos$ID,
                                         selected = Planilha_Riscos$ID[1]),
                             plotOutput(outputId = "Grafico_Conjunto_Riscos"),
                             plotOutput(outputId = "Grafico_Esperado"),
                             tableOutput(outputId = "Tabela_Comp2"),
                             hr(),
                             
                             div(class = "footer",
                                 div(class = "img_footer",
                                     div(class = "logoContainerFooter",
                                         img(src = "img/Logo_Horiens.png"))
                                 )
                             )) 


saveRDS(object = TabsMonitoramento, file = glue("{Caminho_Base}/Tabs/ui/Monitoramento.RDS"))
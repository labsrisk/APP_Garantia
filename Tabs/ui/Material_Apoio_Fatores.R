library(package = shiny)
library(package = shinydashboard)
library(package = glue)

Caminho_Base <- "C:/Users/wesleysilva/Desktop/Projetos_Github/APP_Garantia"

TabsApoio_Fatores <- tabItem(tabName = "Material_Apoio_Fatores", 
                             
                             h1("1. PLANILHA DE FATORES"),
                             
                             p("A planilha de Fatores de Risco concilia as informações tanto do risco em si quanto dos fatores que podem contribuir para 
                               sua materialização de forma mais acentuada ou com uma probabilidade maior do que aquela estimada inicialmente. Pode-se 
                               observar que dado que essa planilha objetiva concatenar as informações do risco e dos fatores, algumas informações devem
                               ser exatamente iguais aquelas observadas na planilha Riscos."),
                             
                             h1("2. PREENCHENDO A PLANILHA DE FATORES"),
                             
                             p(""),
                             
                             tableOutput(outputId = "Planilha_Fatores"),
                             
                             div(class = "Caixa_Centralizada",
                             p(strong("ID:"), "É o identificador do risco, devendo ser exatamente igual ao da planilha de risco."),
                             
                             p(strong("Tempo_Info:"), "Tempo em semanas que aquela informação da planilha de fatores foi atualizada."),
                             
                             p(strong("End_Moni:"), "Atualização sobre o período final de exposição do risco, dado em semanas."),
                             
                             p(strong("Fator:"), "Fator De Risco associado ao evento em questão, deve ser necessariamente representado por letras."),
                             
                             p(strong("P_Fator_Verdadeiro:"), "Coluna binária onde 0 representa que o fator de risco não ocorreu e 1 representa a 
                               observação do fator de risco."),
                             
                             p(strong("P_Dado_Verdadeiro:"), "Probabilidade a ser considerada com base na informação da ocorrência do fator de risco,
                               portanto deve estar formatada como porcentagem."),
                             
                             p(strong("Alteracao_Premissa_P:"), "Caso necessário alterar a probabilidade inicial do risco em questão independentemente
                               da observação de algum fator de risco. Por exemplo, devido a um erro no processo de estimativa inicial."),
                             
                             p(strong("Alteracao_Premissa_C:"), "Caso necessário alterar a consequencia inicial do risco em questão independentemente
                               da observação de algum fator de risco. Por exemplo, devido a um erro no processo de estimativa inicial.")),
                             
                             hr(),
                             
                             div(class = "footer",
                                 div(class = "img_footer",
                                     div(class = "logoContainerFooter",
                                         img(src = "img/Logo_Horiens.png"))
                                 )
                             )) 


saveRDS(object = TabsApoio_Fatores, file = glue("{Caminho_Base}/Tabs/ui/Material_Apoio_Fatores.RDS"))
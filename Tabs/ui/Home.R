library(package = shiny)
library(package = shinydashboard)
library(package = glue)

Caminho_Base <- "C:/Users/wesleysilva/Desktop/Projetos_Github/APP_Garantia"

TabsHome <- tabItem(tabName = "Home",

                    h1("Bem Vindo ao Monitoramento Quant"),
                    
                    div(class = "P_Center",
                    p("Uma plataforma de monitoramento de riscos."),
                    
                    p("Veja o que você pode fazer:"),
                    ),
                    
                    h2("Resumo"),
                    column(width = 12, hr()),
                    
                    div(class = "P_Center",
                    column(width = 6, 
                           div(class = "Para_Mar",
                           p(" - Últimas Atualizações"),
                           p(" - Total De Riscos Monitorados"),
                           p(" - Enchendo Linguiça"),
                           p(" - Enchendo Linguiça"),
                           p(" - Enchendo Linguiça")
                    )
                    )
                    ),
                    column(width = 6, img(src = "img/Resumo.png")),
                    
                    column(width = 12, h2("Monitoramento")),
                    column(width = 12, hr()),
                    
                    div(class = "P_Center",
                    column(width = 6, 
                           div(class = "Para_Mar",
                           p(" - Atualização Dos Riscos"),
                           p(" - Expectativa De Sobrecusto"),
                           p(" - Expectativa De Atraso"),
                           p(" - Probabilidade e Consequências Dos Riscos"),
                           p(" - Relações De Influências"),
                           p(" - Curvas De Monitoramento")
                    )
                    )
                    ),
                    column(width = 6, img(src = "img/Resumo.png")),
                    
                    column(width = 12, h2("Apoio")),
                    column(width = 12, hr()),
                    
                    div(class = "P_Center",
                    column(width = 6, 
                           div(class = "Para_Mar",
                           p(" - Material De Apoio Do Registro De Risco"),
                           p(" - Material De Apoio Da Planilha De Fatores"),
                           p(" - Material De Apoio Para Utilização Da Ferramenta"),
                           p(" - Solução De Dúvidas")
                    )
                    )
                    ),
                    column(width = 6, img(src = "img/Resumo.png")),
                    
        
                    column(width = 12, h2("Documentos")),
                    column(width = 12, hr()),
                    
                    div(class = "P_Center",
                    column(width = 6, 
                           div(class = "Para_Mar",
                           p(" - Histórico Documentos Enviados"),
                           p(" - Relatórios Mensais"),
                           p(" - Enchendo Linguiça"),
                           p(" - Enchendo Linguiça"),
                           p(" - Enchendo Linguiça")
                    )
                    )
                    ),
                    column(width = 6, img(src = "img/Resumo.png"))

                  )


saveRDS(object = TabsHome, file = glue("{Caminho_Base}/Tabs/ui/Home.RDS"))
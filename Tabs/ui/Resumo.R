library(package = shiny)
library(package = shinydashboard)
library(package = glue)

Caminho_Base <- "C:/Users/wesleysilva/Desktop/Projetos_Github/APP_Garantia"

TabsResumo <- tabItem(tabName = "Resumo",
                      column(width = 12,
                             h1("Bem Vindo! Essa é sua seção de resumo..."),
                             div(class = "Para_Maior",
                                 p("Em", strong("Últimas Atualizações"), "você recebe as informações mais importantes para o adequado andamento do Programa de Monitoramento de
                                   Riscos. Ademais, se precisar falar com o suporte para dirimir dúvidas sobre alguma atualização mande um e-mail para o endereço", 
                                   em(strong("wesleysilva@horiens.com")), "informando sua questão.")
                                 )
                             ),
                      column(width = 12,
                             div(class = "Box_Solid",
                                 div(class = "Box_Header",
                                     h1("Últimas Atualizações")
                                     ),
                                 div(class = "Box_Body", 
                                     div(class = "P_Center",
                                         p("- Seu relatório do mês de maio já está disponivel, acesse através do menu documentos."),
                                         p("- Existem inconsistências na sua planilha, por favor revise as informações."),
                                         p("- O prazo para atualização dos documentos acaba em uma semana, não se esqueça.")
                                         )
                                     )
                                 )
                             ),
                      column(width = 12,
                             div(class = "Para_Maior",
                                 p("Em", strong("Resumo Base De Riscos e Fatores"), "você será capaz de visualizar tanto a base inicial de informações quanto as últimas
                                 atualizações realizadas com base no fluxo de novas informações. Total De Riscos traz todos seus riscos identificados, Total de Fatores
                                 traz todas as ligações de influência identificadas, Fatores Observados traz apenas os fatores de riscos que se materializaram e Última 
                                 Atualização traz todas as novas informações veículadas na última alteração.")
                                 )
                            ),
                      column(width = 12, 
                             div(class = "Box_Solid",
                                 div(class = "Box_Header", 
                                     h1("Resumo Base De Riscos e Fatores")
                                     ),
                                 div(class = "Box_Body",
                                     box(textOutput(outputId = "Riscos"), title = actionButton(inputId = "Botao_1", label = "Total De Riscos"), width = 3),
                                     box(textOutput(outputId = "Fatores"), title = actionButton(inputId = "Botao_2", label = "Total De Fatores"), width = 3),
                                     box(textOutput(outputId = "Fatores_Trig"), title = actionButton(inputId = "Botao_3", label = "Fatores Observados"), width = 3),
                                     box(textOutput(outputId = "Ulti_Atuali"), title = actionButton(inputId = "Botao_4", label = "Última Atualização"), width = 3)
                                     )
                                 )
                             ),
                      column(width = 12,
                             div(class = "Para_Maior",
                                 p("Em", strong("Inconsistência Nos Dados"), "você será capaz de visualizar as linhas onde possivelmente ocorreu um erro de digitação
                                 na hora do preenchimento da planilha, sendo que você será informado através da guia de atualizações em casos de inconsistências. Ademais,
                                 se você estiver com dúvida na hora de solucionar a inconsistência mande um e-mail para", em(strong("wesleysilva@horiens.com")), "informando
                                 sua questão.")
                             )
                      ),
                      column(width = 12,
                             div(class = "Box_Solid",
                                 div(class = "Box_Header", 
                                     h1("Inconsistências Nos Dados")
                                 ),
                                 div(class = "Box_Body",
                                         column(width = 9, p("- ID's Duplicados")),
                                         column(width = 3, actionButton(inputId = "Botao_5", label = "Verificar")),
                                         column(width = 9, p("- Exposição Inicial e Final Dos Riscos (Planilha Riscos)")),
                                         column(width = 3, actionButton(inputId = "Botao_6", label = "Verificar")),
                                         column(width = 9, p("- Consequencias (Planilha Riscos)")),
                                         column(width = 3, actionButton(inputId = "Botao_7", label = "Verificar")),
                                         column(width = 9, p("- Probabilidades (Planilha Riscos)")),
                                         column(width = 3, actionButton(inputId = "Botao_8", label = "Verificar")),
                                         column(width = 9, p("- Tempo Da Informação (Planilha Fatores)")),
                                         column(width = 3, actionButton(inputId = "Botao_9", label = "Verificar")),
                                         column(width = 9, p("- Exposição Inicial e Final Dos Riscos (Planilha Fatores)")),
                                         column(width = 3, actionButton(inputId = "Botao_10", label = "Verificar")),
                                         column(width = 9, p("- Consequencias (Planilha Fatores)")),
                                         column(width = 3, actionButton(inputId = "Botao_11", label = "Verificar")),
                                         column(width = 9, p("- Probabilidades (Planilha Fatores)")),
                                         column(width = 3, actionButton(inputId = "Botao_12", label = "Verificar")),
                                         column(width = 9, p("- Observação Dos Fatores (Planilha Fatores)")),
                                         column(width = 3, actionButton(inputId = "Botao_13", label = "Verificar")))
                                 )
                             ),
                      column(width = 12,
                             hr()
                             ),
                      column(width = 12,
                             div(class = "footer",
                                 div(class = "img_footer",
                                     div(class = "logoContainerFooter",
                                         img(src = "img/Logo_Horiens.png")
                                         )
                                     )
                                 )
                             )
                      ) 
                      
saveRDS(object = TabsResumo, file = glue("{Caminho_Base}/Tabs/ui/Resumo.RDS"))
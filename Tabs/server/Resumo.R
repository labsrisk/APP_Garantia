output$Riscos <- renderText(expr = {
  nrow(x = Planilha_Riscos)
}) 

output$Fatores <- renderText(expr = {
  length(x = unique(x = Planilha_Fatores$Fator))
}) 

output$Fatores_Trig <- renderText(expr = {
  length(x = unique(x = na.omit(object = Planilha_Fatores)$Fator)) 
}) 

output$Ulti_Atuali <- renderText(expr = {
  Textual <- ""
  if(nrow(x = na.omit(object = Planilha_Fatores)) < 1){
    Textual <- "Ainda não foi efetuada nenhuma atualização"
  }else{
    Textual <- glue("Semana {max(x = na.omit(object = Planilha_Fatores)$Tempo_Info)}")
  }
   Textual
}) 

output$Tabela <- renderTable(expr = {
  Planilha_Riscos[, c("ID", "Descricao")]
}, width = "100%", hover = TRUE, align = "c", na = "Valor_Ausente")

output$Tabela_Fatores <- renderTable(expr = {
  Planilha_Fatores[, c("ID", "Fator", "P_Fator_Verdadeiro")]
}, width = "100%", hover = TRUE, align = "c", na = "Valor_Ausente")

output$Tabela_Trig <- renderTable(expr = {
  Planilha <- na.omit(object = Planilha_Fatores)
  Planilha[, c(10, 11, 12)] <- Planilha[,c(9, 10, 11)]/1000
  Planilha
}, width = "100%", hover = TRUE, align = "c", na = "Valor_Ausente")

output$Tabela_Ultima <- renderTable(expr = {
  Planilha <- na.omit(object = Planilha_Fatores)
  Planilha[, c(10, 11, 12)] <- Planilha[,c(9, 10, 11)]/1000
  Planilha <- subset(x = Planilha, Planilha$Tempo_Info == max(... = Planilha$Tempo_Info))
  Planilha
}, width = "100%", hover = TRUE, align = "c", na = "Valor_Ausente")

output$Inco_1 <- renderTable(expr = {
  Planilha <- subset(x = Planilha_Riscos, duplicated(x = Planilha_Riscos) == TRUE)
  Planilha[, c(1:9)]
}, width = "100%", hover = TRUE, align = "c", na = "Valor_Ausente")

output$Inco_2 <- renderTable(expr = {
  Planilha <- subset(x = Planilha_Riscos, Inicio < 0 | Final < 0 | Inicio > Final)
  Planilha[, c(1:9)]
}, width = "100%", hover = TRUE, align = "c", na = "Valor_Ausente")

output$Inco_3 <- renderTable(expr = {
  Planilha <- subset(x = Planilha_Riscos, Conse_Min < 0 | Conse_Provavel < 0 | Conse_Max < 0 | Conse_Max < Conse_Min | Conse_Provavel < Conse_Min | Conse_Max < Conse_Provavel)
  Planilha[, c(1:9)]
}, width = "100%", hover = TRUE, align = "c", na = "Valor_Ausente")

output$Inco_4 <- renderTable(expr = {
  Planilha <- subset(x = Planilha_Riscos, Prob_Min < 0 |  Prob_Min > 1 | Prob_Max < 0 | Prob_Max > 1 | Prob_Max < Prob_Min)
  Planilha[, c(1:9)]
}, width = "100%", hover = TRUE, align = "c", na = "Valor_Ausente")

output$Inco_5 <- renderTable(expr = {
  Planilha <- subset(x = Planilha_Fatores, Tempo_Info < 0)
  Planilha
}, width = "100%", hover = TRUE, align = "c", na = "Valor_Ausente")

output$Inco_6 <- renderTable(expr = {
  Planilha <- subset(x = Planilha_Fatores, Inicio_Moni < 0 | Final_Moni < 0 | Inicio_Moni > Final_Moni)
}, width = "100%", hover = TRUE, align = "c", na = "Valor_Ausente")

output$Inco_7 <- renderTable(expr = {
  Planilha <- subset(x = Planilha_Fatores, Conse_Min < 0 | Conse_Med < 0 | Conse_Max < 0 | Conse_Max < Conse_Min | Conse_Med < Conse_Min | Conse_Max < Conse_Med)
}, width = "100%", hover = TRUE, align = "c", na = "Valor_Ausente")

output$Inco_8 <- renderTable(expr = {
  Planilha <- subset(x = Planilha_Fatores, P_Min < 0 |  P_Min > 1 | P_Max < 0 | P_Max > 1 | P_Max < P_Min)
}, width = "100%", hover = TRUE, align = "c", na = "Valor_Ausente")

output$Inco_9 <- renderTable(expr = {
  Planilha <- subset(x = Planilha_Fatores, P_Fator_Verdadeiro != 0 & P_Fator_Verdadeiro != 1)
}, width = "100%", hover = TRUE, align = "c", na = "Valor_Ausente")

observeEvent(input$Botao_1, {
  showModal(modalDialog(tableOutput(outputId = "Tabela"), size = "l", title = "Planilha De Risco", footer = modalButton(label = "Fechar Janela")))
})

observeEvent(input$Botao_2, {
  showModal(modalDialog(tableOutput(outputId = "Tabela_Fatores"), size = "l", title = "Planilha De Fatores", footer = modalButton(label = "Fechar Janela")))
})

observeEvent(input$Botao_3, {
  showModal(modalDialog(tableOutput(outputId = "Tabela_Trig"), size = "l", title = "Planilha De Fatores Observados", footer = modalButton(label = "Fechar Janela")))
})

observeEvent(input$Botao_4, {
  Vetor_Caractere <- "Dados Da Última Atualização"
  Encoding(x = Vetor_Caractere) <- "UTF-8"
  showModal(modalDialog(tableOutput(outputId = "Tabela_Ultima"), size = "l", title = Vetor_Caractere, footer = modalButton(label = "Fechar Janela")))
})

observeEvent(input$Botao_5, {
  showModal(modalDialog(tableOutput(outputId = "Inco_1"), size = "l", title = "Linhas Inconsistentes", footer = modalButton(label = "Fechar Janela")))
})

observeEvent(input$Botao_6, {
  showModal(modalDialog(tableOutput(outputId = "Inco_2"), size = "l", title = "Linhas Inconsistentes", footer = modalButton(label = "Fechar Janela")))
})

observeEvent(input$Botao_7, {
  showModal(modalDialog(tableOutput(outputId = "Inco_3"), size = "l", title = "Linhas Inconsistentes", footer = modalButton(label = "Fechar Janela")))
})

observeEvent(input$Botao_8, {
  showModal(modalDialog(tableOutput(outputId = "Inco_4"), size = "l", title = "Linhas Inconsistentes", footer = modalButton(label = "Fechar Janela")))
})

observeEvent(input$Botao_9, {
  showModal(modalDialog(tableOutput(outputId = "Inco_5"), size = "l", title = "Linhas Inconsistentes", footer = modalButton(label = "Fechar Janela")))
})

observeEvent(input$Botao_10, {
  showModal(modalDialog(tableOutput(outputId = "Inco_6"), size = "l", title = "Linhas Inconsistentes", footer = modalButton(label = "Fechar Janela")))
})

observeEvent(input$Botao_11, {
  showModal(modalDialog(tableOutput(outputId = "Inco_7"), size = "l", title = "Linhas Inconsistentes", footer = modalButton(label = "Fechar Janela")))
})

observeEvent(input$Botao_12, {
  showModal(modalDialog(tableOutput(outputId = "Inco_8"), size = "l", title = "Linhas Inconsistentes", footer = modalButton(label = "Fechar Janela")))
})

observeEvent(input$Botao_13, {
  showModal(modalDialog(tableOutput(outputId = "Inco_9"), size = "l", title = "Linhas Inconsistentes", footer = modalButton(label = "Fechar Janela")))
})



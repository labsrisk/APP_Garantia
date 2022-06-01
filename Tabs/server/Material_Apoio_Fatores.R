output$Planilha_Fatores <- renderTable(expr = {
  Temporario <- data.frame("ID" = c(1, 1, 2, 3),
                           "Tempo_Info" = c("", "", "",  40),
                           "End_Moni" = c(0, 0, 0, 50),
                           "Fator" = c("A", "B", "C", "D"),
                           "P_Fator_Verdadeiro" = c(0, 0, 0,  1),
                           "P_Dado_Verdadeiro" = c("35%", "40%", "60%", "75%"),
                           "Alteracao_Premissa_P" = c("0%", "0%", "0%", "0%"),
                           "Alteracao_Premissa_C" = c("0", "0", "0", "0")
                           )
}, width = "90%", align = "c", caption = "Tabela 1: Fatores De Risco Hipoteticamente Preenchido", 
caption.placement = getOption("xtable.caption.placement", "top"))

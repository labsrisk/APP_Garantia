output$Planilha_Registro <- renderTable(expr = {
  Temporario <- data.frame("ID" = seq(from = 1, to = 3, by = 1),
                           "Descricao" = c("Indice Nacional Da Construção Civil Superar 15%a.a.", 
                                           "Atraso na retomada do Backlog da engenharia.",
                                           "Dois dias sequencias de chuvas acima de 120mm"),
                           "Probabilidade" = c("20%", "40%", "60%"),
                           "Consequencia" = c(10000000, 50000000, 5000000),
                           "Start" = c(0, 0, 30),
                           "End" = c(60, 60, 45))
  
  Vetor_Caractere <- Temporario$Descricao
  Encoding(Vetor_Caractere) <- "UTF-8"  
  
  Temporario$Descricao <- Vetor_Caractere
  Temporario
}, width = "90%", align = "c", caption = "Tabela 1: Registro De Risco Hipoteticamente Preenchido", 
caption.placement = getOption("xtable.caption.placement", "top"))

output$Download1 <- downloadHandler(filename = function(){
  glue("Planilha.xlsx")
}, function(file = "Downloads"){
  content = write.xlsx(x = Lista, file = file)
}
)



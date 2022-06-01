Retorno_Rede <- Modelando_Rede_Bayesiana(Tabela_Teste = Planilha_Fatores, Indice_Fator = 5, Indice_Risco = 1)
Rede_Criada <- model2network(string = Retorno_Rede$String)

output$Grafico_Rede <- renderPlot(expr = {
  graphviz.plot(Rede_Criada, layout = "dot", shape = "rectangle", main = "REDE DE INFLUENCIA - RISCOS X FATORES DE RISCO")
})

#====================================================== Pré Processamento ==================================================================================
Planilha_Riscos$Distribuicao <- "Gamma"
Planilha_Fatores$Distribuicao <- "Gamma"

Planilha_Riscos$Tempo_Info <- Planilha_Riscos$Inicio_Moni <- Planilha_Riscos$Final_Moni <- Planilha_Riscos$Prob_Min_Moni <- Planilha_Riscos$Prob_Max_Moni <- Planilha_Riscos$Conse_Min_Moni <- Planilha_Riscos$Conse_Med_Moni <- Planilha_Riscos$Conse_Max_Moni <- Planilha_Riscos$Sobrecusto <- 0

#Utilizando a Planilha Auxiliar De Fatores Para Pegar As Informações Correntes Necessárias.
if(nrow(x = na.omit(object = Planilha_Fatores)) > 0){
  Temporario <- na.omit(object = Planilha_Fatores)
  Riscos_Atualizar <- unique(x = Temporario$ID)
  for(i in 1:length(x = Riscos_Atualizar)){
    Planilha_Riscos$Prob_Max_Moni[Riscos_Atualizar[i]] <- max(... = subset(x = Temporario, ID == Riscos_Atualizar[i])$P_Max)
    Planilha_Riscos$Prob_Min_Moni[Riscos_Atualizar[i]] <- min(... = subset(x = Temporario, ID == Riscos_Atualizar[i])$P_Min)
    Planilha_Riscos$Tempo_Info[Riscos_Atualizar[i]] <- min(... = subset(x = Temporario, ID == Riscos_Atualizar[i])$Tempo_Info)
    Planilha_Riscos$Final_Moni[Riscos_Atualizar[i]] <- max(... = subset(x = Temporario, ID == Riscos_Atualizar[i])$Final_Moni)
    Planilha_Riscos$Inicio_Moni[Riscos_Atualizar[i]] <- min(... = subset(x = Temporario, ID == Riscos_Atualizar[i])$Inicio_Moni)
    Planilha_Riscos$Conse_Min_Moni[Riscos_Atualizar[i]] <- max(... = subset(x = Temporario, ID == Riscos_Atualizar[i])$Conse_Min)
    Planilha_Riscos$Conse_Med_Moni[Riscos_Atualizar[i]] <- max(... = subset(x = Temporario, ID == Riscos_Atualizar[i])$Conse_Med)
    Planilha_Riscos$Conse_Max_Moni[Riscos_Atualizar[i]] <- max(... = subset(x = Temporario, ID == Riscos_Atualizar[i])$Conse_Max)
  }
}


#Se Houve Alteração, Atualizamos As Variáveis De Monitoramento
Planilha_Riscos$Conse_Min_Moni <- ifelse(test = Planilha_Riscos$Final_Moni == 0, 
                                         yes = Planilha_Riscos$Conse_Min,
                                         no = Planilha_Riscos$Conse_Min_Moni)

Planilha_Riscos$Conse_Med_Moni <- ifelse(test = Planilha_Riscos$Final_Moni == 0, 
                                         yes = Planilha_Riscos$Conse_Provavel,
                                         no = Planilha_Riscos$Conse_Med_Moni)

Planilha_Riscos$Conse_Max_Moni <- ifelse(test = Planilha_Riscos$Final_Moni == 0, 
                                         yes = Planilha_Riscos$Conse_Max,
                                         no = Planilha_Riscos$Conse_Max_Moni)

Planilha_Riscos$Final_Moni <- ifelse(test = Planilha_Riscos$Final_Moni == 0, 
                                     yes = Planilha_Riscos$Final,
                                     no = Planilha_Riscos$Final_Moni)

Planilha_Riscos$Inicio_Moni <- ifelse(test = Planilha_Riscos$Inicio_Moni == 0, 
                                      yes = Planilha_Riscos$Inicio,
                                      no = Planilha_Riscos$Inicio_Moni)

Planilha_Riscos$Prob_Min_Moni <- ifelse(test = Planilha_Riscos$Prob_Min_Moni == 0, 
                                        yes = Planilha_Riscos$Prob_Min,
                                        no = Planilha_Riscos$Prob_Min_Moni)

Planilha_Riscos$Prob_Max_Moni <- ifelse(test = Planilha_Riscos$Prob_Max_Moni == 0, 
                                        yes = Planilha_Riscos$Prob_Max,
                                        no = Planilha_Riscos$Prob_Max_Moni)

#"Proporcionando" a Probabilidade Para Que Ela Fique Dentro De Um Universo c(0,1).
#A condição é a probabilidade máxima ser maior que 1 tanto para a Prob_Min quanto para a Prob_Max, pois no caso de só proporcionar a probabilidade máxima 
#poderia ocorrer situações em que a probabilidade máxima seria menor do que a probabilidade mínima.
if(sum(... = Planilha_Riscos$Prob_Max) > 1 | sum(... = Planilha_Riscos$Prob_Max_Moni) > 1){
  Planilha_Riscos$Prob_Min_Prop <- Planilha_Riscos$Prob_Min/sum(... = Planilha_Riscos$Prob_Max)
  Planilha_Riscos$Prob_Max_Prop <- Planilha_Riscos$Prob_Max/sum(... = Planilha_Riscos$Prob_Max)
  Planilha_Riscos$Prob_Min_Moni_Prop <- Planilha_Riscos$Prob_Min_Moni/sum(... = Planilha_Riscos$Prob_Max_Moni)
  Planilha_Riscos$Prob_Max_Moni_Prop <- Planilha_Riscos$Prob_Max_Moni/sum(... = Planilha_Riscos$Prob_Max_Moni)
}else{
  Planilha_Riscos$Prob_Min_Prop <- Planilha_Riscos$Prob_Min
  Planilha_Riscos$Prob_Max_Prop <- Planilha_Riscos$Prob_Max
  Planilha_Riscos$Prob_Min_Moni_Prop <- Planilha_Riscos$Prob_Min_Moni
  Planilha_Riscos$Prob_Max_Moni_Prop <- Planilha_Riscos$Prob_Max_Moni
}

#Verificando o Incremento Na Probabilidade.
Planilha_Riscos$Prob_Exce <- ifelse(test = Planilha_Riscos$Final_Moni - Planilha_Riscos$Final != 0, 
                                    yes = Planilha_Riscos$Prob_Max_Moni_Prop - Planilha_Riscos$Prob_Max_Prop,
                                    no = 0)

#=============================================== Final Pré Processamento ====================================================================================

#Utilizando o Motor De Quantificação Para Simular Os Riscos Dada a Distribuição De Cada Um.
Retorno_Riscos <- 
  F_Motor_Quant_Riscos(x = Planilha_Riscos, Simu = 10000, Desvio = 4, Indice_ID = 1, Indice_Dist = 10, Indices_Prob =  c(8,9), Indices_Conse = c(5, 6, 7))

Retorno_Riscos_Monitoramento <- 
  F_Motor_Quant_Riscos(x = Planilha_Riscos, Simu = 10000, Desvio = 4, Indice_ID = 1, Indice_Dist = 10, Indices_Prob =  c(16,15), 
                       Indices_Conse = c(14, 13, 12))

Retorno_Custos <- reactive(x = {
  Quantil_Escolhido <- input$Grau_Confianca/100
  
  Planilha_Riscos <- Planilha_Riscos
  
  Planilha_Riscos$Conseq_Assu <- Planilha_Riscos$Conseq_Assu_Moni <- 0
  
  Planilha_Riscos$Sobrecusto <- Planilha_Riscos$Conseq_Assu_Moni - Planilha_Riscos$Conseq_Assu
  
  for(i in 1:nrow(x = Planilha_Riscos)){
    Planilha_Riscos$Conseq_Assu[i] <- quantile(x = Retorno_Riscos[[i]]$Conseq_Sim, Quantil_Escolhido)
    Planilha_Riscos$Conseq_Assu_Moni[i] <- quantile(x = Retorno_Riscos_Monitoramento[[i]]$Conseq_Sim, Quantil_Escolhido)
  }
  
  Retorno <- Alocacao_Custo_Tempo(Tabela = Planilha_Riscos, Indice_Custo = c(25, 26), Indice_ID = 1, Indice_Tempo = c(4, 17))
  Retorno
})

Retorno_Prob <- reactive(x = {
  Quantil_Escolhido <- input$Grau_Confianca/100
  
  Planilha_Riscos <- Planilha_Riscos
  
  Planilha_Riscos$Conseq_Assu <- Planilha_Riscos$Conseq_Assu_Moni <- 0
  
  Planilha_Riscos$Sobrecusto <- Planilha_Riscos$Conseq_Assu_Moni - Planilha_Riscos$Conseq_Assu
  
  for(i in 1:nrow(x = Planilha_Riscos)){
    Planilha_Riscos$Conseq_Assu[i] <- quantile(x = Retorno_Riscos[[i]]$Conseq_Sim, Quantil_Escolhido)
    Planilha_Riscos$Conseq_Assu_Moni[i] <- quantile(x = Retorno_Riscos_Monitoramento[[i]]$Conseq_Sim, Quantil_Escolhido)
  }
  
  Retorno <- Alocacao_Prob_Tempo(Tabela = Planilha_Riscos, Indice_Prob = c(21,24), Indice_ID = 1, Indice_Tempo_Fin = c(4, 17), 
                      Indice_Tempo_Ini = c(3,18))
  Retorno
})

output$Grafico_Conjunto <- renderPlot(expr = {
  Vetor_Caractere <- c("Gráfico 1: Exposição")
  Encoding(Vetor_Caractere) <- "UTF-8"
  
  A <- ggplot() + geom_line(data = as.data.frame(x = Retorno_Custos()$Tabela_Garantia_Moni), 
                            aes(x = as.numeric(x = row.names(x = as.data.frame(x = Retorno_Custos()$Tabela_Garantia_Moni))), 
                                y = Curva_Final, colour = "Monitoramento"), size = 1.2) + 
    geom_line(data = as.data.frame(x = Retorno_Custos()$Tabela_Garantia), 
              aes(x = as.numeric(x = row.names(x = as.data.frame(x = Retorno_Custos()$Tabela_Garantia))), 
                  y = Curva_Final, colour = "Premissa Inicial"), size = 1.2) +
    scale_x_continuous(expand = c(0,0)) +  scale_y_continuous(labels = comma, expand = c(0,0)) +
    theme_clean(base_size = 16) + labs(y = "Exposicao", x = "", colour = "", title = Vetor_Caractere) + 
    theme(plot.title = element_text(hjust = 0.5))
  
  Vetor_Caractere <- c("Gráfico 2: Probabilidade De Default")
  Encoding(Vetor_Caractere) <- "UTF-8"
  
  B <- ggplot() + geom_line(data = as.data.frame(x = Retorno_Prob()$Tabela_Consolidada_Moni), 
                       aes(x = as.numeric(x = row.names(x = as.data.frame(x = Retorno_Prob()$Tabela_Consolidada_Moni))), 
                           y = Probabilidade_Atual, colour = "Monitoramento"), size = 1.2) + 
    geom_line(data = as.data.frame(x = Retorno_Prob()$Tabela_Consolidada), 
              aes(x = as.numeric(x = row.names(x = as.data.frame(x = Retorno_Prob()$Tabela_Consolidada))), 
                  y = Prob_Consolidada, colour = "Premissa Inicial"), size = 1.2) +
    scale_x_continuous(expand = c(0,0)) +  scale_y_continuous(expand = c(0,0)) +
    theme_clean(base_size = 16) + labs(y = "Probabilidade", x = "", colour = "", title = Vetor_Caractere) + 
    theme(plot.title = element_text(hjust = 0.5))
  
  
  
  ggarrange(A, B, ncol = 2)
})

output$Grafico_Conjunto_Riscos <- renderPlot(expr = {
  Escolhido <- as.numeric(x = input$Escolha_Riscos) 
  
  Vetor_Caractere <- c("Gráfico 3: Histograma Das Consequências")
  Encoding(Vetor_Caractere) <- "UTF-8"
  
  A <- ggplot() + geom_histogram(data = Retorno_Riscos[[Escolhido]], aes(x = Conseq_Sim, fill = "Inicial"), bins = 100, colour = "white") + 
    geom_histogram(data = Retorno_Riscos_Monitoramento[[Escolhido]], aes(x = Conseq_Sim, fill = "Atualizado"), bins = 100, colour = "white", alpha = 0.5) +
    scale_x_continuous(labels = comma, expand = c(0,0)) + scale_y_continuous(expand = c(0,0)) + theme_clean(base_size = 14) +
    labs(fill = "", title = Vetor_Caractere, x = "Consequencia Simulada", y = "") + theme(plot.title = element_text(hjust = 0.5), 
                                                                                          axis.text.y = element_blank(),
                                                                                          axis.ticks.y = element_blank())
  
  Vetor_Caractere <- c("Gráfico 4: Histograma Das Probabilidades")
  Encoding(Vetor_Caractere) <- "UTF-8"
  
  B <- ggplot() + geom_histogram(data = Retorno_Riscos[[Escolhido]], aes(x = Prob_Sim, fill = "Inicial"), bins = 100, colour = "white") + 
    geom_histogram(data = Retorno_Riscos_Monitoramento[[Escolhido]], aes(x = Prob_Sim, fill = "Atualizado"), bins = 100, colour = "white", alpha = 0.5) +
    scale_x_continuous(labels = comma, expand = c(0,0)) + scale_y_continuous(expand = c(0,0)) + theme_clean(base_size = 14) +
    labs(fill = "", title = Vetor_Caractere, x = "Probabilidades Simulada", y = "") + theme(plot.title = element_text(hjust = 0.5),
                                                                                            axis.text.y = element_blank(),
                                                                                            axis.ticks.y = element_blank())
  
  ggarrange(A, B, ncol = 2)
})

output$Grafico_Esperado <- renderPlot(expr = {
  Escolhido <- as.numeric(x = input$Escolha_Riscos) 
  
  Vetor_Caractere <- c("Gráfico 5: Histograma Do Valor Esperado")
  Encoding(Vetor_Caractere) <- "UTF-8"
  
  ggplot() + geom_histogram(data = Retorno_Riscos[[Escolhido]], aes(x = Conseq_Sim * Prob_Sim, fill = "Inicial"), bins = 100, colour = "white") + 
    geom_histogram(data = Retorno_Riscos_Monitoramento[[Escolhido]], aes(x = Conseq_Sim * Prob_Sim, fill = "Atualizado"), bins = 100, colour = "white", 
                   alpha = 0.5) +
    scale_x_continuous(labels = comma, expand = c(0,0)) + scale_y_continuous(expand = c(0,0)) + theme_clean(base_size = 14) +
    labs(fill = "", title = Vetor_Caractere, x = "Valor Esperado", y = "") + theme(plot.title = element_text(hjust = 0.5), 
                                                                                          axis.text.y = element_blank(),
                                                                                          axis.ticks.y = element_blank())
})

output$Tabela_Comp2 <- renderTable(expr = {
  Escolhido <- as.numeric(x = input$Escolha_Riscos) 
  
  Inicial <- Retorno_Riscos[[Escolhido]]$Conseq_Sim * Retorno_Riscos[[Escolhido]]$Prob_Sim
  Atualizado <- Retorno_Riscos_Monitoramento[[Escolhido]]$Conseq_Sim * Retorno_Riscos_Monitoramento[[Escolhido]]$Prob_Sim
  
  Tabela <- data.frame("Inicial" = rep(x = 0, times = 3),
                       "Monitoramento" = rep(x = 0, times = 3),
                       "Delta_Percentual" = rep(x = 0, times = 3))
  
  Tabela$Inicial[1] <- round(x = mean(x = Inicial), digits = 2)
  Tabela$Monitoramento[1] <- round(x = mean(x = Atualizado), digits = 2)
  
  Tabela$Inicial[2] <- round(x = as.numeric(x = quantile(x = Inicial, 0.9)), digits = 2)
  Tabela$Monitoramento[2] <- round(x = as.numeric(x = quantile(x = Atualizado, 0.9)), digits = 2)
  
  Tabela$Inicial[3] <- round(x = as.numeric(x = quantile(x = Inicial, 0.95)), digits = 2)
  Tabela$Monitoramento[3] <- round(x = as.numeric(x = quantile(x = Atualizado, 0.95)), digits = 2)
  
  Tabela$Delta_Percentual <- round(x = (Tabela$Monitoramento/Tabela$Inicial - 1) * 100, digits = 2)
  
  row.names(x = Tabela) <- c("Media", "P_90", "P_95")
  Tabela
}, rownames = TRUE)

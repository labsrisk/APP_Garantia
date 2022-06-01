server <- shinyServer(function(input, output, session){
  source(file = "tabs/server/Monitoramento.R", local = TRUE)
  source(file = "tabs/server/Resumo.R", local = TRUE)
  source(file = "tabs/server/Material_Apoio_Registro.R", local = TRUE)
  source(file = "tabs/server/Material_Apoio_Fatores.R", local = TRUE)
})
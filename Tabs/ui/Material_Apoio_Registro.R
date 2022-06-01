library(package = shiny)
library(package = shinydashboard)
library(package = glue)

Caminho_Base <- "C:/Users/wesleysilva/Desktop/Projetos_Github/APP_Garantia"

TabsApoio_Registro <- tabItem(tabName = "Material_Apoio_Registro", 
                             
                            h1("1. REGISTRO DE RISCO"),
                            
                            p("O Registro de Risco é uma planilha modelo contendo as informações relevantes e necessárias sobre os riscos identificados, 
                            possibilitando a avaliação e monitoramento dos mesmos. Nessa seção você encontrará informações que servirão de guia para dúvidas 
                            comuns no processo de preenchimento dessa planilha, mas se sua dúvida persistir mande um e-mail para o endereço", 
                            em(strong("wesleysilva@horiens.com")), "informando sua questão."),
                            
                            p("O documento de conta com duas planilhas, onde a planilha denominada Riscos está relacionada exclusivamente com as 
                            informações dos eventos em si, enquanto a planilha denominada Fatores relaciona os eventos e seus respectivos 'influenciadores'.
                            Nessa seção abordamos as informações que devem ser preenchidas na planilha Riscos e as dúvidas mais comuns nesse processo, se
                            você estiver com dúvida sobre as informações e o correto preenchimento da planilha fatores poderá encontrar respostas acessando
                            a próxima seção. Ademais, caso não possua a planilha em questão você deve fazer o download através do botão abaixo."),
                            
                            downloadButton(outputId = "Download1", label = "Baixar Planilha"),
                             
                            h1("2. PREENCHENDO O REGISTRO DE RISCOS"),
                            
                             p("Uma informação essencial para avaliação e monitoramento dos riscos é a probabilidade de ocorrência, mas há alguns pontos que
                             devem ser observados para garantir uma informação de qualidade. A probabilidade pode ser, preferencialmente, estimada  mediante 
                             dados estatísticos. No entanto, dado a dinâmica de diversos riscos onde os dados não são suficientes e/ou a ausência de dados 
                             coletados sobre os eventos, pode-se utilizar o bom senso e a experiência para estimar a probabilidade do evento - metodologia 
                             conhecida na literatura como opinião do especialista."),
                               
                             p("Ademais, a probabilidade deve ser estimada tendo em mente o tempo de exposição durante todo o período do projeto e não 
                             indefinidamente no tempo. Por exemplo, observando a Tabela 1 e o evento descrito como Dois dias sequenciais de chuvas acima de 
                             120mm, a probabilidade de se observar o evento durante 1 século deve ser necessariamente maior do que observar
                             o mesmo evento em um intervalo de 6 meses."),
                            
                            p("Assim como a probabilidade, a consequência de um evento pode ser estimada tanto mediante dados, e.g. percentual de um 
                              contrato, quanto em sua ausência mediante a opinião do especialista. Contudo, quanto maior for a dependência da opinião do 
                              especialista para a estimação desses valores maior deve ser o cuidado de produzir uma estimação de qualidade."),
                            
                            p("Por fim, as colunas da Tabela 1 denominadas Start e End consolidam as informações sobre a exposição ao risco durante a
                            passagem do tempo. Como o objetivo principal da ferramenta é o monitoramento dos riscos, torna-se necessário que se tenha 
                            informação sobre o início e o final do período de exposição. Por exemplo, observando o evento hipotético 3 presente na Tabela 1 
                            temos que a exposição ao risco em questão se inicia na 30º semana e se encerra na 45° semana. Desse modo, a Tabela 1 está 
                            preenchida com riscos hipotéticos para que possa ficar claro o resultado final, após o processo de consolidação das 
                            informações. "),
                            
                            tableOutput(outputId = "Planilha_Registro"),
                            
                            div(class = "Caixa_Centralizada",
                               p(strong("ID:"), "Identificador do evento, de modo que cada risco deve ter um ID único."),
                             
                               p(strong("Descricao:"), "Breve resumo que sintetiza o evento identificado."),
                             
                               p(strong("Probabilidade:"), "Probabilidade associada ao evento, assim como na tabela apresentada deve estar formatada como 
                               percentual."),
                             
                               p(strong("Consequencia:"), "Consequência monetaria estimada em decorrência da observação da materialização do evento."),
                             
                               p(strong("Start:"), "A partir de qual período de tempo (t) do projeto espera-se estar exposto a determinado risco. Ademais,
                               a unidade de medida do dado está dada em semanas."),
                             
                               p(strong("End:"), "A partir de qual período de tempo (t) do projeto espera-se não estar mais exposto a determinado risco.
                               Ademais, a unidade de medida do dado está dada em semanas.")
                             ),
                            
                            hr(),
                            
                            div(class = "footer",
                                div(class = "img_footer",
                                    div(class = "logoContainerFooter",
                                        img(src = "img/Logo_Horiens.png"))
                                )
                            ) 
)


saveRDS(object = TabsApoio_Registro, file = glue("{Caminho_Base}/Tabs/ui/Material_Apoio_Registro.RDS"))
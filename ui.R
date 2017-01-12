library(shiny)

shinyUI(fluidPage(
     
     titlePanel("Define production lines and assign products using time required by operators"),
     sidebarLayout(
          sidebarPanel(
               h5("The file must have a format like the image above, first column product name or sku
                  next undefined columns each type of operation, data can be time, persons or any
                  unit you use to define the amount of work needed to build a product"),
               img(src= "http://www.magro.com.mx/images/formato.PNG", align = "left",
                   width = 200),
               fileInput("browse", "Select a CSV file",
                         accept = c(
                              "text/csv",
                              "text/comma-separated-values,text/plain",
                              ".csv")
               ),
               checkboxInput("header", "Data has header", TRUE),
               downloadButton("download","Download final lines and products")
               ),
          mainPanel(
               h5("This projec is working for real in my site, at", 
                  a("www.magro.com.mx", href="http://www.magro.com.mx") , "(sorry, site is
                    not yet in english) it made to help shoe factories to define how many production lines should be created and to 
                  define which sku to produce in each one.  You can find a csv with real data
                  in the ", a("github repository", href="https://github.com/espinosabouvy/DataProd-Coursera"),
                  " of the assignment called times.csv"),
               tabsetPanel(
                    tabPanel("Data readed",DT::dataTableOutput("tabla_completa")),
                    tabPanel("Statistics", 
                             tableOutput("tablainicial"),
                             plotOutput("boxplotini"),
                             plotOutput("graficoinicial")),
                    tabPanel("Production lines", 
                             column(6, 
                                    sliderInput("altura_cluster", "Deviation index",
                                                min=2, max= 3000,
                                                step = 50, value = 500)),
                             column(6,
                                    p("Number of production lines to create: "),
                                    verbatimTextOutput("lineas")),
                             plotOutput("dendograma")),
                    tabPanel("Asigned products", DT::dataTableOutput("tabla_asignacion",
                                                                      width = 400)),
                    tabPanel("Final analisis and improvement measurement", 
                             tableOutput("mejora"),
                             tableOutput("total.fam"),
                             plotOutput("grafico.final"),
                             tableOutput("desviaciones"))
               )
               )
)
))


################################################################################
### <November 10 2020> Zhilin Jin                                            ###
### ---------------------------------------------------------------          ###
### Shiny web application for the Shoulder Pain data analysis.You            ###
### can run the application by clicking the 'Run App' button above.          ###
### ---------------------------------------------------------------          ###
###  Written by:                                                             ###
###                                                                          ###
###  Zhilin Jin                     zxj143@miami.edu                         ###
###  Division of Biostatistics                                               ###
###  Clinical Research Building                                              ###
###  1120 NW 14th Street                                                     ###
###  University of Miami, Miami FL 33136                                     ###
################################################################################

library(shiny)
#library(DataExplorer)
library(tidyverse)

dat <- read.csv("http://courses.washington.edu/b517/Datasets/shoulder.csv")
type.plot <- c("Bar chart for age group", "Number of observations in treatment/age group",
            "Visualise with the fill aesthetic")

ui <- fluidPage(

    titlePanel("Shoulder Pain Data Analysis"),
    h4("Zhilin Jin (zxj143@miami.edu)"),

    sidebarLayout(
    sidebarPanel(
        p("Please select type of plot"
        ), 
        
        selectInput("plottypes", NULL, 
                    choices = c(type.plot)
        )
        
    ),

        mainPanel(
           plotOutput("distPlot")
        )),
    
    tabsetPanel(

        tabPanel("Scatterplot", icon = icon("fas fa-external-link-square-alt"),
                 br(),
                 br(),
                 h4("Scatterplot of treatment group versus average pain."),
                 br(),
                 plotOutput("scatterplot", width = "90%", height = "800px")
        ),
        
        tabPanel("Linear Regression", icon = icon("fas fa-users"),
                 
                 br(),
                 h3(strong("Linear regression on average pain score.")),
                 h5("Dataset on a trial for a treatment to reduce referred pain."),

                 br(),
                 h3(strong("Results:")),
                 verbatimTextOutput("lreg")
                 
        ) 
        
    ) 
    
    )


server <- function(input, output) {
    
    dat <- reshape(dat, v.names = "pain", idvar = "id",
                   timevar = "time", direction = "wide")
    
    dat$age_grp <- cut(dat$age, breaks = c(0,(2.4:7.4)*10, range(dat$age)[2]),
                       labels = c("24-", "25-34", "35-44", "45-54", "55-64","65-74","75+"),
                       ordered_result = TRUE)
    
    dat$ct_grp <- factor(dat$trt, levels = 1:2, labels = c("control", "treatment"), ordered = TRUE)
    
    table(dat$age_grp,dat$ct_grp)
    
    dat$Avg_Pain <- rowMeans(dat[,paste("pain.", 1:6, sep = "")], na.rm = TRUE)
    
    output$distPlot <- renderPlot({
        if(input$plottypes == "Bar chart for age group"){
            ggplot(data = dat) +
                geom_bar(mapping = aes(x = age_grp)) +
                labs(x = "Age Group", y = "Count Number")
        }else if(input$plottypes == "Number of observations in treatment/age group"){
            ggplot(data = dat) +
                geom_count(mapping = aes(x = age_grp, y = ct_grp)) +
                labs(x = "Age Group", y = "Control/Treatment")
        }else if(input$plottypes == "Visualise with the fill aesthetic"){
            dat %>% 
                count(age_grp, ct_grp) %>%  
                ggplot(mapping = aes(x = age_grp, y = ct_grp)) +
                geom_tile(mapping = aes(fill = n)) +
                labs(x = "Age Group", y = "Control/Treatment")
        }
    })

    output$scatterplot <- renderPlot({
            ggplot(data = dat, aes(age, Avg_Pain)) + 
            geom_point() +
            geom_smooth(method = "lm", colour = "red") +
                labs(x = "Age", y = "Average Pain Score") +
                theme(axis.title.x = element_text(size = 18),
                  axis.title.y = element_text(size = 18),
                  axis.text.x = element_text(size = 14),
                  axis.text.y = element_text(size = 14))
    })
    
    linear.regression <- reactive({
        da <- read.csv("http://courses.washington.edu/b517/Datasets/shoulder.csv")
        da <- reshape(da, v.names = "pain", idvar = "id", timevar = "time", direction = "wide")
        da$avg_pain <- rowMeans(da[, paste("pain", 1:6, sep = ".")])
        head(da)
        plot(da$age,da$avg_pain)
        obj <- lm(avg_pain ~ age + sex, data = da)
        summary(obj)
    }) 
    
    output$lreg <- renderPrint({
        linear.regression()
    })
}

### Run the application 
shinyApp(ui = ui, server = server)





library(shiny)
library("zoo")
library("reshape2")
library("ggplot2")
library("plyr")
library("gridExtra")
load("~/Documents/shiny.RData")

# We tweak the "am" field to have nicer factor labels. Since this doesn't
# rely on any user inputs we can do this once at startup and then use the
# value throughout the lifetime of the application


# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {


  # Generate a plot of the requested variable against mpg and only 
  # include outliers if requested
  output$plot <- reactivePlot(function() {
    
        
        average<-data.frame(period, sold=sold[[input$zip]], listing=listing[[input$zip]])
        dfm <- melt(average, id = "period", measure = c("sold","listing"))
        c=qplot(period, value, data=dfm, geom="smooth", colour = variable,xlim = as.Date(c("2010-02-01","2012-01-01")),xlab="Date",ylab="Average Price")+
            scale_colour_manual(values=c("#0000CC","#000000"))
        print(c)
  })
})
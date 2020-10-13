```r
library("plotly")
# Libraries
library(ggplot2)
library(dplyr)
library(plotly)
library(viridis)
library(hrbrthemes)

#setwd("~/your/path")
data <- read.table("bubble_athaliana.csv", header=T, sep="\t")
data <-as.data.frame(data)

bubble_classic <- ggplot(data) + 
      geom_point(aes(x=Upstream_regions, y=Modules, size = N.cor,colour = Significance, 
                 text = paste("Significance: ", Significance, "\n", "N.cor ", N.cor, "\n", sep = ""))) +
      scale_size(range = c(8, 19)) + 
      scale_color_viridis(option = "D", direction = -1, begin = 0, end=1)+
      theme(legend.position = "right") +
      theme_bw(base_size = 14, base_line_size = 1)+ scale_x_discrete(position = "top") +  
      theme(axis.text.x=element_text(color="black", size = , face = "bold", angle = 360, hjust = 0.5))+
      theme(axis.text.y=element_text(color="black", size = 11,face = "bold", angle = 360))+
      ggtitle("Validation in A.thaliana")+
bubble_classic
  
# turn ggplot interactive with plotly
bubble_interactive <- ggplotly(bubble_classic, tooltip="text")
bubble_interactive
# save the widget
library(htmlwidgets)
saveWidget(bubble_interactive, "Plotly_bubble_chart.html")


```

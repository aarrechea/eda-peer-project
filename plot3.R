setwd("/home/adrian/Dropbox/R/course-data-science-specialization/course-04-exploratory-data-analysis/week-04")


#--------------------------------------------------------------------------------------------------
#                                         Libraries
#--------------------------------------------------------------------------------------------------
library(tidyverse)



#--------------------------------------------------------------------------------------------------
#                                      Reading the data
#--------------------------------------------------------------------------------------------------
summaryCode <- readRDS("summarySCC_PM25.rds")
sourceCode <- readRDS("Source_Classification_Code.rds")

head(summaryCode)
head(sourceCode)

str(summaryCode)
str(sourceCode)     



#--------------------------------------------------------------------------------------------------
#  3 - Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
#  which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
#  Which have seen increases in emissions from 1999–2008? 
#  Use the ggplot2 plotting system to make a plot answer this question.      
#--------------------------------------------------------------------------------------------------
baltimore_type <- summaryCode %>%
      group_by(year, type) %>%
      summarise(emissions = sum(Emissions) / 1000)

ggplot(baltimore_type, aes(x = year, y = emissions, col = type)) +
      geom_line()


dev.copy(png,'plot3.png') # copying the plot to a png archive
dev.off() # close the device

# All the types of sources have decreased their total emissions point to point. But, some of them,
#  like in the case of "point" and "non-road", had an increment in the middles years of study.















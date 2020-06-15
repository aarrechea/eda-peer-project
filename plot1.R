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
# 1 - Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#     Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
#     for each of the years 1999, 2002, 2005, and 2008.
#--------------------------------------------------------------------------------------------------      
totalEmissions <- summaryCode %>%
      group_by(year) %>%
      summarise(emissions = sum(Emissions) / 1000)

plot(totalEmissions$year, totalEmissions$emissions, pch = 16, xlab = "Year", ylab = "Emissions (thousands)")
lines(totalEmissions$year, totalEmissions$emissions, col = "blue", lwd = 3)
title(main = "Total emissions")

dev.copy(png,'plot1.png') # copying the plot to a png archive
dev.off() # close the device
















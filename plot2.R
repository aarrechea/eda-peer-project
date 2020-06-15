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
# 2 - Have total emissions from PM2.5 decreased in the Baltimore City, 
#     Maryland fips == "24510") from 1999 to 2008? 
#     Use the base plotting system to make a plot answering this question.
#--------------------------------------------------------------------------------------------------
baltimore <- summaryCode %>%
      filter(fips == "24510") %>%
      group_by(year) %>%
      summarise(emissions = sum(Emissions) / 1000)

plot(baltimore$year, baltimore$emissions, pch = 16, xlab = "Year", ylab = "Emissions (thousands)")
lines(baltimore$year, baltimore$emissions, col = "blue", lwd = 3)
title(main = "Baltimore emissions")


dev.copy(png,'plot2.png') # copying the plot to a png archive
dev.off() # close the device

# Total emissions have decreased in Baltimore since 1999, but we can observe an increased in
# in 2005. But in 2008 Baltimore registered the lowest measurement of total emissions of the serie.


















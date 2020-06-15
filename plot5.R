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
# 5 - How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
#--------------------------------------------------------------------------------------------------
# Filter only motor-vehicles sources from Baltimore
motor_vehicles <- sourceCode %>%
      select(SCC, EI.Sector) %>%
      filter(grepl("[Vv]ehicle", EI.Sector))      

# Merge motor vehicles form SCC source with SCC classification      
motor_vehicles <- merge(summaryCode, motor_vehicles, by.x = "SCC", by.y = "SCC")      

# Filter Baltimore data, group by year and summarize
motor_vehicles_balt <- motor_vehicles %>%
      filter(fips == "24510") %>%
      group_by(year) %>%
      summarise(Emissions = sum(Emissions))


plot(motor_vehicles_balt$year, motor_vehicles_balt$Emissions, pch = 16, ylab = "", xlab = "")
lines(motor_vehicles_balt$year, motor_vehicles_balt$Emissions, col = "blue", lwd = 3)
title(ylab = "Emissions", xlab = "Year", main = "Vehicle emissions")

dev.copy(png,'plot5.png') # copying the plot to a png archive
dev.off() # close the device





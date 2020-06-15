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
# 4 - Across the United States, how have emissions from coal combustion-related sources 
#     changed from 1999–2008?      
#--------------------------------------------------------------------------------------------------
# Filter only the sources that contain coal emitters
coal_emissions <- sourceCode %>%
      select(SCC, EI.Sector) %>%
      filter(grepl("Coal", EI.Sector))

# Inner join of only coal sources and main data frame   
coal_emissions <- merge(summaryCode, coal_emissions)

# Grouped by over the variable "year" and sum the variable emissions   
coal_emissions_grouped <- coal_emissions %>%
      select(year, Emissions) %>%
      group_by(year) %>%
      summarise(emissions = sum(Emissions) / 1000)

# Plot the result
ggplot(coal_emissions_grouped, aes(x = year, y = emissions)) +
      labs(y = "Emissions (thousands)", x = "Year") +
      geom_line(col = "blue", lwd = 1) +
      geom_point()


dev.copy(png,'plot4.png') # copying the plot to a png archive
dev.off() # close the device

# The tendency is descendant, even though in 2005 the emissions increased related the previous
#  measurement in 2002. It can be observed a significant decrease in 2008 of the emissions of coal
#  sources












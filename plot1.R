###################################################################################

#
# Outputs: plot1.png
#
# 
###################################################################################
# Read in Data
dirIn <- ".//exdata_data_NEI_data//"
fNEI <- paste(dirIn, "summarySCC_PM25.rds", sep="")
fSCC <- paste(dirIn, "Source_Classification_Code.rds",sep="")
NEI <- readRDS(fNEI)
SCC <- readRDS(fSCC)
# Research Question
# 1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
# Using the base plotting system, make a plot showing the total PM2.5 emission from
# all sources for each of the years 1999, 2002, 2005, and 2008.
#
#
library(sqldf)
png(file = "plot1.png")
totalEmission <- sqldf("select sum(Emissions) as PM25_Emission_sum, year from NEI group by year")
with(totalEmission, plot(PM25_Emission_sum~year, ylab = "Total Emissions from PM2.5 (tons)"))
title(main="Total Emissions from PM2.5 \nDecreased in the United States from 1999 to 2008")
par (cex=.8)
reg1 <- with(totalEmission, lm(PM25_Emission_sum~year))
abline(reg1)
dev.off()

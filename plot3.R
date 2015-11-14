##Course Exploratory Data Analysis 
## Week 2 Project 2 Plotts System
## Author: Enrique Ponte

# Clean up workspace
rm(list=ls())

##set my working directory
setwd("C:/Users/admin/Desktop/Coursera")

##Download the file manually
#fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata_data_NEI_data.zip"
#download.file(fileUrl,destfile="exdata_data_NEI_data.zip")

##Unzip the file
unzip(zipfile="exdata_data_NEI_data.zip")
datfile1="summarySCC_PM25.rds"
datfile2="Source_Classification_Code.rds"

##Read data from the rds file and create a final dataset Baltimore Emision-Year-Type
NEI <- readRDS(datfile1)
SCC <- readRDS(datfile2)
Baltimore <- subset(NEI, NEI$fips==24510)
FNEI<- aggregate(Emissions ~ year+type,Baltimore,sum)
library(ggplot2)

# creating Plot3
png("plot3.png", width=480, height= 480)
qplot(year, Emissions, data = FNEI, col = type, geom = c("point", "line"))+ ggtitle("Total PM2.5 Emissions in Baltimore County by Source Type") + xlab("Year") + ylab("PM2.5 Emissions (tons)")
dev.off()


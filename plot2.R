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

##Read data from the rds file and create a final dataset Baltimore Emision-Year
NEI <- readRDS(datfile1)
SCC <- readRDS(datfile2)
Baltimore <- subset(NEI, NEI$fips==24510)
FNEI<- aggregate(Emissions ~ year,Baltimore,sum)


# creating Plot2
png("plot2.png", width=480, height= 480)
barplot(FNEI$Emissions,names.arg=FNEI$year, ylab="Emission" ,xlab="Years", main="Total PM2.5 Emissions Baltimore, MD", col = blues9)
dev.off()




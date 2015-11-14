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

##Read data from the rds file and create a final dataset
NEI <- readRDS(datfile1)
SCC <- readRDS(datfile2)

FNEI<- aggregate(Emissions ~ year,NEI,sum)


# creating Plot1
png("plot1.png", width=480, height= 480)
barplot(FNEI$Emissions/1000000,names.arg=FNEI$year, ylab=expression('Total PM'[2.5]*' Emission (ton)'),xlab="Years", main="Total PM2.5 Emissions USA", col = blues9)
dev.off()





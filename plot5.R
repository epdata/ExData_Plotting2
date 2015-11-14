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
carval<- unique(grep("Vehicles", SCC$EI.Sector, ignore.case = TRUE, value = TRUE))  
FSCC<-subset(SCC, EI.Sector %in% carval)  #Subset SCC by carval
Baltimore<-subset(NEI, SCC %in% FSCC$SCC & NEI$fips==24510) #Subset NEI by FSCC overlap and Flip code Baltimore
FNEI<- aggregate(Emissions ~ year,Baltimore,sum)
library(ggplot2)

# creating Plot5
png("plot5.png", width=480, height= 480)
g <- ggplot(FNEI,aes(factor(year),Emissions)) +
     geom_bar(stat="identity",fill="black",width=0.50) +
     labs(x="year", y=expression("Total PM"[2.5]*" Emission ")) +
     labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions Baltimore from 1999-2008"))
print(g)
dev.off()

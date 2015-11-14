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

#Instances of "coal" in SCC column Short.Name
coalval<-grep("coal", SCC$Short.Name, ignore.case=TRUE, value=TRUE)  
FSCC<-subset(SCC, Short.Name %in% coalval)  #Subset SCC by coalval labels
FNEI<-subset(NEI, SCC %in% FSCC$SCC)        #Subset NEI by FSCC overlap
library(ggplot2)

# creating Plot4
png("plot4.png", width=480, height= 480)
p <- ggplot(data=FNEI, aes(x=factor(year), y=Emissions/1000000))+ geom_bar(stat="identity", width = 0.4)+ 
    ggtitle("U.S Coal Total Emissions from 1999 - 2008") + xlab("Year") + ylab("PM2.5 Emissions (tons)")
print(p)
dev.off()







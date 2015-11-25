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
Baltimore<-subset(NEI, SCC %in% FSCC$SCC & NEI$fips=="24510") #Subset NEI by FSCC overlap and fips Baltimore
Baltimore$city <- "Baltimore City"
FBalt<- aggregate(Emissions ~ year+city,Baltimore,sum)
California<-subset(NEI, SCC %in% FSCC$SCC & NEI$fips=="06037") #Subset NEI by FSCC overlap and fips California
California$city <- "Los Angeles California"
FCal<- aggregate(Emissions ~ year+city,California,sum)
FNEI<- rbind(FBalt,FCal)
library(ggplot2)

# creating Plot6
png("plot6.png", width=480, height= 480)
g <-ggplot(data=FNEI, aes(x=factor(year), y=Emissions)) + facet_grid(scales="free", space="free",.~city) +
    geom_bar(aes(fill=year),stat="identity") +
    guides(fill=FALSE) + theme_bw() +
    labs(x="Year")+ ylab("PM2.5 Emissions")+ggtitle(expression(atop("Motor-Vehicle Emission Comparison",atop(bold("Baltimore and Los Angeles, CA: 1999-2008")))))
print(g)
dev.off()

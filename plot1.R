
##install.packages(lubridate)
setwd("C:/Program_R")
library(datasets)
library(lubridate)

##read as characters - not factors
options( StringsAsFactors=F ) 
f1<-read.table("household_power_consumption.txt",sep=";",head=TRUE, as.is=T )

##subset f1
f2<-f1[with(f1,dmy(Date)>=dmy("01/02/2007") & dmy(Date)<= dmy("02/02/2007")),]

## prepare y variable
f3<-as.numeric(f2$Global_active_power)

##draw  a histogram
hist(f3, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power", yaxt="n")
axis(side=2, at=seq(0,1200, 200), labels=seq(0,1200,200))

plot1=dev.cur()
dev.copy(png, file = "plot1.png",width = 480, height = 480)
dev.off()
cat("\014")                 # clean screen
rm(list=ls())               # clean  environment
data=read.table("household_power_consumption.txt",sep=";")   # read data
names(data)=as.character(unlist(data[1,]))                   # change the names of columns
data=subset(data, Date=="1/2/2007" | Date=="2/2/2007")      # extract specified dates
png(filename = "plot1.png",width = 480, height = 480)       # open png device
par(mfrow=c(1,1))     # set the number of rows and columns in graphic device
# make the graph
hist(as.numeric(as.character(data$Global_active_power)),col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()  # turn off the graphic device

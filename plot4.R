cat("\014")                 # clean screen
rm(list=ls())               # clean  environment
data=read.table("household_power_consumption.txt",sep=";")     # read data
names(data)=as.character(unlist(data[1,]))                     # change the names of columns
data=subset(data, Date=="1/2/2007" | Date=="2/2/2007")         # extract specified dates
t=strptime(paste(data[,1],data[,2]),format="%d/%m/%Y %H:%M:%S")   # convert date and time to standard type in variable t
png(filename = "plot4.png",width = 480, height = 480)          # open png device
par(mfrow=c(2,2))     # set the number of rows and columns in graphic device
# make graph 1
plot(t, as.numeric(as.character(data$Global_active_power)),"l",xlab="",ylab="Global Active Power")
# make graph 2
plot(t, as.numeric(as.character(data$Voltage)),"l",xlab="datetime",ylab="Voltage")
# make graph 3
plot(t, as.numeric(as.character(data$Sub_metering_1)),"l",xlab="",ylab="Energy sub metering")
lines(t,as.numeric(as.character(data$Sub_metering_2)),col="red")
lines(t,as.numeric(as.character(data$Sub_metering_3)),col="blue")
# legend
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1 , col=c('black', 'red', 'blue'),pt.cex=1,bty='n')
# make graph 4
plot(t, as.numeric(as.character(data$Global_reactive_power)),"l",xlab="datetime",ylab="Global_reactive_power")
dev.off()    # turn off the graphic device
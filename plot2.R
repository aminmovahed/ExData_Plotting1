cat("\014")                 # clean screen
rm(list=ls())               # clean  environment
data=read.table("household_power_consumption.txt",sep=";")    # read data
names(data)=as.character(unlist(data[1,]))                     # change the names of columns
data=subset(data, Date=="1/2/2007" | Date=="2/2/2007")        # extract specified dates
t=strptime(paste(data[,1],data[,2]),format="%d/%m/%Y %H:%M:%S")   # convert date and time to standard type in variable t
png(filename = "plot2.png",width = 480, height = 480)         # open png device
par(mfrow=c(1,1))    # set the number of rows and columns in graphic device
# make the graph
plot(t, as.numeric(as.character(data$Global_active_power)),"l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()   # turn off the graphic device
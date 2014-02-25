
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("consumption.zip")){
    download.file(fileUrl, destfile = "./consumption.zip")
    dateDownloaded <- date()}
unzip(zipfile = "consumption.zip")
consumption <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, sep =";", col.names = colnames(read.table("household_power_consumption.txt", nrow = 1, header = TRUE, sep = ";")))
datetime <- paste(consumption$Date, consumption$Time)
library(lubridate)
Sys.setlocale("LC_ALL","English")
datetime <- dmy_hms(datetime)
consumption <- cbind(datetime, consumption)
#par(mar=rep(2,4)) #this is to avoid a plot.new() error related to the margins
par(mfrow = c(2,2))
with(consumption, {
    plot.new()
    par(mfg=c(1,1))
    plot(datetime, Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
    par(mfg=c(1,2))
    plot(datetime, Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
    par(mfg=c(2,1))
    plot(datetime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black")
    lines(datetime, Sub_metering_2, col = "red")
    lines(datetime, Sub_metering_3, col = "blue")
    legend("topright", bty= "n", lty=1, lwd=.5, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), cex=0.7, y.intersp = 0.25, x.intersp = 0.25, yjust = .9, xjust = .9, seg.len = 0.5)
    par(mfg=c(2,2))
    plot(datetime, Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
})

dev.copy(png, file = "plot4.png")
dev.off()
file.remove("household_power_consumption.txt") 
#reset the previous setting
par(mfrow = c(1,1)) 
par(mar=c(5.1, 4.1, 4.1, 2.1))
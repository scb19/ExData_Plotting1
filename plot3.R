
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

with(consumption, {
        plot(datetime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black")
        lines(datetime, Sub_metering_2, col = "red")
        lines(datetime, Sub_metering_3, col = "blue")
legend("topright", lty=1, lwd=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), cex=0.75, y.intersp = 0.5, x.intersp = 0.5, yjust = 1, xjust = 1, seg.len = 1)
})
dev.copy(png, file = "plot3.png")
dev.off()
file.remove("household_power_consumption.txt") 
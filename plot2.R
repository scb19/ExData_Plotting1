
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
plot(consumption$datetime, consumption$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png")
dev.off()
file.remove("household_power_consumption.txt") 
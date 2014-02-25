
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("consumption.zip")){
download.file(fileUrl, destfile = "./consumption.zip")
dateDownloaded <- date()}
unzip(zipfile = "consumption.zip")
consumption <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, sep =";", col.names = colnames(read.table("household_power_consumption.txt", nrow = 1, header = TRUE, sep = ";")))

hist(consumption$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()
file.remove("household_power_consumption.txt") 
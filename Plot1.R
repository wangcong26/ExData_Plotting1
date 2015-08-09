##read data file
rawdata <- "household_power_consumption.txt"
## save it to a var
powerplot <- read.table(rawdata, header=T, sep=";")
## grab date and subset date var
powerplot$Date <- as.Date(powerplot$Date, format="%d/%m/%Y")
plot <- powerplot[(powerplot$Date>="2007-02-01") & (powerplot$Date<="2007-02-02"),]
plot$Global_active_power <- as.numeric(as.character(plot$Global_active_power))
plot$Global_reactive_power <- as.numeric(as.character(plot$Global_reactive_power))
plot$Voltage <- as.numeric(as.character(plot$Voltage))
plot <- transform(plot, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
plot$Sub_metering_1 <- as.numeric(as.character(plot$Sub_metering_1))
plot$Sub_metering_2 <- as.numeric(as.character(plot$Sub_metering_2))
plot$Sub_metering_3 <- as.numeric(as.character(plot$Sub_metering_3))

plot1 <- function() {
  hist(plot$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
  dev.copy(png, file="plot1.png", width=480, height=480)
  dev.off()
  cat("Plot1.png has been saved in", getwd())
}
plot1()
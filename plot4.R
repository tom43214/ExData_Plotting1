plot4 <- function() {
      
      ##Read in data file assuming it is in the current directory
      classes <- c("character", "character", rep("numeric", 7))
      dat <- read.table("household_power_consumption.txt", sep = ";",
                        header=TRUE, na.strings = "?", colClasses = classes)
      
      dat <- subset(dat, Date == "1/2/2007" | Date == "2/2/2007")
      
      dat <- within(dat, datetime <- strptime(paste(Date, Time), 
                                              "%d/%m/%Y %H:%M:%S"))
      
      
      ##Open PNG file device for saving plot
      png(filename = "plot4.png", width = 480, height = 480)
      
      ##Set up plots in 2 by 2 rows with 15 point font for to match plot sizes
      par(mfrow = c(2, 2), ps = 11)
      
      ##Set up plot 1
      with(dat, plot(datetime, Global_active_power, type = "l",
                     xlab = NA, ylab = "Global Active Power"))
      
      ##Set up plot 2
      with(dat, plot(datetime, Voltage, type = "l"))
      
      ##Set up plot 3
      with(dat, plot(datetime, Sub_metering_1, type = "l",
                     xlab = NA, ylab = "Energy sub metering"))
      with(dat, points(datetime, Sub_metering_2, type = "l", col = "red"))
      with(dat, points(datetime, Sub_metering_3, type = "l", col = "blue"))
      legend("topright", col = c("black", "red", "blue"), lty = 1, bty = "n",
             legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
             y.intersp = 1)
      
      ##Set up plot 4
      with(dat, plot(datetime, Global_reactive_power, type = "l"))    
      
      #Close file device
      dev.off()
}
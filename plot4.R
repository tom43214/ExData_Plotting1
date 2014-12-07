plot4 <- function() {
      
      ##Set classes for columns of data frame to read in
      classes <- c("character", "character", rep("numeric", 7))
      
      ##Read in data file
      ##Data is assumed to be in working directory
      dat <- read.table("household_power_consumption.txt", sep = ";",
                        header=TRUE, na.strings = "?", colClasses = classes)
      
      ##Subset data file for dates requested in assignment
      dat <- subset(dat, Date == "1/2/2007" | Date == "2/2/2007")
      
      ##Add column to data frame combining date and time in POSIXlt format
      dat <- within(dat, datetime <- strptime(paste(Date, Time), 
                                              "%d/%m/%Y %H:%M:%S"))
      
      
      ##Open PNG file device with appropriate arguments for saving plot
      png(filename = "plot4.png", width = 480, height = 480,
          bg = "transparent", type = "cairo")
      
      ##Set up plots in 2 by 2 rows with 11 point font to match plot sizes
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
             legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
      
      ##Set up plot 4
      with(dat, plot(datetime, Global_reactive_power, type = "l"))    
      
      #Close file device
      dev.off()
}
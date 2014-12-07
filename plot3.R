plot3 <- function() {

      ##Read in data file assuming it is in the current directory
      classes <- c("character", "character", rep("numeric", 7))
      dat <- read.table("household_power_consumption.txt", sep = ";",
                        header=TRUE, na.strings = "?", colClasses = classes)
      
      dat <- subset(dat, Date == "1/2/2007" | Date == "2/2/2007")
      
      dat <- within(dat, datetime <- strptime(paste(Date, Time), 
                                              "%d/%m/%Y %H:%M:%S"))
      
      ##Open PNG file device for saving plot
      png(filename = "plot3.png", width = 480, height = 480)
      
      ##Set up plot with Sub_metering_1 data
      with(dat, plot(datetime, Sub_metering_1, type = "l",
           xlab = NA, ylab = "Energy sub metering"))
      
      ##Add Sub_metering_2 data
      with(dat, points(datetime, Sub_metering_2, type = "l", col = "red"))
      
      ##Add Sub_metering_3 data
      with(dat, points(datetime, Sub_metering_3, type = "l", col = "blue"))
      
      ##Add legend
      legend("topright", col = c("black", "red", "blue"), lty = 1, 
             legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
      
      #Close file device
      dev.off()
}
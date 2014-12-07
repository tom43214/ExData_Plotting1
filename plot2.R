plot2 <- function() {
      
      ##Read in data file assuming it is in the current directory
      classes <- c("character", "character", rep("numeric", 7))
      dat <- read.table("household_power_consumption.txt", sep = ";",
                        header=TRUE, na.strings = "?", colClasses = classes)
      
      dat <- subset(dat, Date == "1/2/2007" | Date == "2/2/2007")
      
      dat <- within(dat, datetime <- strptime(paste(Date, Time), 
                                     "%d/%m/%Y %H:%M:%S"))
      
      ##Open PNG file device for saving plot
      png(filename = "plot2.png", width = 480, height = 480)
      
      ##Set up plot
      with(dat, plot(datetime, Global_active_power, type = "l",
           xlab = NA, ylab = "Global Active Power (kilowatts)"))
      
      #Close file device
      dev.off()
      
}
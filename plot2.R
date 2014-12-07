plot2 <- function() {
      
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
      ##to match example images and assignment requirements
      ##(transparent background, 480x480, etc.)
      png(filename = "plot2.png", width = 480, height = 480,
          bg = "transparent", type = "cairo")
      
      ##Set up plot
      with(dat, plot(datetime, Global_active_power, type = "l",
           xlab = NA, ylab = "Global Active Power (kilowatts)"))
      
      #Close file device
      dev.off()
      
}
plot1 <- function() {

      ##Set classes for columns of data frame to read in
      classes <- c("character", "character", rep("numeric", 7))
      
      ##Read in data file
      ##Data is assumed to be in working directory
      dat <- read.table("household_power_consumption.txt", sep = ";",
                        header=TRUE, na.strings = "?", colClasses = classes)
      
      ##Subset data file for dates requested in assignment
      dat <- subset(dat, Date == "1/2/2007" | Date == "2/2/2007")
            
      ##Open PNG file device with appropriate arguments for saving plot
      png(filename = "plot1.png", width = 480, height = 480,
          bg = "transparent", type = "cairo")
      
      ##Set up histogram
      hist(dat$Global_active_power, col = "red", main = "Global Active Power", 
           xlab = "Global Active Power (kilowatts)")
      
      #Close file device
      dev.off()
      
}
plot1 <- function() {

      ##Read in data file assuming it is in the current directory
      classes <- c("character", "character", rep("numeric", 7))
      dat <- read.table("household_power_consumption.txt", sep = ";",
                        header=TRUE, na.strings = "?", colClasses = classes)
      
      dat <- subset(dat, Date == "1/2/2007" | Date == "2/2/2007")
      
      ##Open PNG file device for saving plot
      png(filename = "plot1.png", width = 480, height = 480)
      
      ##Set up histogram
      hist(dat$Global_active_power, col = "red", main = "Global Active Power", 
           xlab = "Global Active Power (kilowatts)")
      
      #Close file device
      dev.off()
      
}
# Making multiple plots of the data and presenting them in a determined order.
#
# First we'll source the script that retrieves and packages the data, PowerData.R

source("PowerData.R")

MultipleOrderedPlots <- function(){
  
  
  PowerData <- PowerData()
  
  ## Setting the background and creating the plot order framework with mfrow()
  
  par(bg="white", mfrow=c(2,2))
  
  ## Creating multiple plots. The code sequence positions the plots 
  ## from the top left corner of the framework to the bottom right corner.
  
  ## Top left:
  
  plot(PowerData$DateTime, PowerData$Global_active_power, xlab="", type="l", ylab="Global Active Power (kilowatts)")
  
  ## Top right:
  
  plot(PowerData$DateTime, PowerData$Voltage, type="l", ylab="Voltage", xlab="datetime")
  
  ## Bottom left:
  
  plot(PowerData$DateTime, PowerData$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  lines(PowerData$DateTime, PowerData$Sub_metering_2, col="red")
  lines(PowerData$DateTime, PowerData$Sub_metering_3, col="blue")
  legend("topright", col = c("black", "red", "blue"), legend = c("Sub_Metering_1", "Sub_Metering_2","Sub_metering_3"), lty=c(1,1,1),pt.cex=1,cex=0.7)
  
  ## Bottom right:
  
  plot(PowerData$DateTime, PowerData$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
  
  ## Copying the plot to a .png file
  
  dev.copy(png, file="plot4.png", width = 480, height = 480)
  
  ## Closing connection to the device:
  
  dev.off()
}
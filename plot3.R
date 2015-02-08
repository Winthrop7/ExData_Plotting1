# Making the color coded sub metering plots with a legend.
#
# First we'll source the script that retrieves and packages the data, PackedData.R
source("PowerData.R")

LinesAndLegend <- function(){
  
  ## Now we'll make the third plot using the plot function: plot() multiple times
  ## explointing the "Artist's Pallette" metaphor of the Base System.
  ## This will involve setting margins with par(), drawing the first metering plot and then
  ## adding lines for the second and third metering plots.
  ## Each line color coded.
  
  PowerData <- PowerData()
  
  ## Setting the margins and background:
  
  par(mar= c(4, 4, 2, 1), bg="white")
  
  ## Drawing the first metering line:
  
  plot(PowerData$DateTime, PowerData$Sub_metering_1, xlab="", type="l", ylab="Energy sub metering")
  
  ## Now adding the additional lines:
  
  lines(PowerData$DateTime, PowerData$Sub_metering_2, col="red")
  lines(PowerData$DateTime, PowerData$Sub_metering_3, col="blue")
  
  ## Now creating the legend and matching the line colors:
  
  legend("topright", col = c("black", "red", "blue"), legend = c("Sub_Metering_1", "Sub_Metering_2","Sub_metering_3"), lty=c(1,1,1))
  
  ## Copying the plot to a .png file
  dev.copy(png, file="plot3.png", width = 480, height = 480)
  
  ## Closing connection to the device:
  
  dev.off()
}
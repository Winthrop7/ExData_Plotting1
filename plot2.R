# Making the line plot
#
# First we'll source the script that retrieves and packages the data, PowerData.R
source("PowerData.R")

LinePlot <- function(){
  
  ## Now we'll make the second plot using the plot function: plot()
  ## This will involve setting margins with par(), drawing the plot and then
  ## Copying  the plot from the screen device using dev.copy()
  
  PowerData <- PowerData()
  
  ## Setting the margins and background:
  
  par(mar= c(4, 4, 2, 1), bg="white")
  
  ##  Drawing the line plot:
  
  plot(PowerData$DateTime, PowerData$Global_active_power, xlab="", type="l", ylab="Global Active Power (kilowatts)")
  
  
  ## Copying the plot to a .png file:
  dev.copy(png, file="plot2.png", width = 480, height = 480)
  
  ## Close connection to the device:
  
  dev.off()
}
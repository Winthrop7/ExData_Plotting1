##

## Plotting the Histogram:
##
## First we'll source the script that retrieves and packages the data, PackedData.R

source("PackedData.R")


HistogramPlot <- function() {
  
    
    ## Now we'll make the first plot using the histogram function: hist()
    ## This will involve setting margins with par(), drawing the plot and then
    ## Copying  the plot from the screen device using dev.copy()
  
    PowerData <- PowerData()
    
    ## Setting the margins:
    
    par(mar= c(4,4,2,1), bg= "white")
    
    ## Drawing the histogrom
    
    hist(PowerData$Global_active_power, col= "red", xlab="Global Active Power (kilowats)", main="Global Active Power")
    
    ## Copying the plot to a .png file
    
    dev.copy(png, file= "plot1.png", width= 480, height= 480, units= "px", bg= "white")
    
    ## Close connection to the device:
    
    dev.off()
    
    
    
  }
  
  
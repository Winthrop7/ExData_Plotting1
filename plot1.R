##
## Getting and cleaning the data:
## To ready the data for its use in the four required plots, we must retrieve 
## the zip file from the designated web location, unzip the file, and pack
## the data in a data frame that can be manipulated by the plotting scripts.
##
## Plotting the Histogram:
##
HistogramPlot <- function() {
  
  # Assign the designated url to DataUrl
  
  DataUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  
  # Retrieve the file.
  
  download.file(DataUrl,destfile= "household_power_consumption.zip", method= "curl")
  
  # Close connections:
  
  closeAllConnections()
  
  # Unzip the file and assign it to a data frame.
  
  PowerData <- read.table(unz("household_power_consumption.zip",filename= "household_power_consumption.txt"),
                          sep= ";", header= T, na.strings= "?", stringsAsFactors= F)
  
  # Use strptime to prepare the time information in the file and add it to PowerData
  
  PowerData$DateAndTime <- strptime(paste(PowerData$Date, PowerData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
  
  # Extract the data from the relevant time interval, the first and second days of February 2007
  # into the data frame we will use to make the plots, PackedData
  
  PackedData <- subset(PowerData, Date == "1/2/2007"| Date == "2/2/2007")
  PackedData
  
  

## Now we'll make the first plot using the histogram function: hist()
## This will involve setting margins with par(), drawing the plot and then
## Copying  the plot from the screen device using dev.copy()

## Setting the margins:

par(mar= c(4,4,2,1), bg= "white")

## Drawing the histogrom

hist(PackedData$Global_active_power, col= "red", xlab="Global Active Power (kilowats)", main="Global Active Power")

## Copying the plot to a .png file

dev.copy(png, file= "plot1.png", width= 480, height= 480, units= "px", bg= "white")

## Close connection to the device:

dev.off

}

## Getting and cleaning the data:
## To ready the data for its use in the four required plots, we must retrieve 
## the zip file from the designated web location, unzip the file, and pack
## the data in a data frame that can be manipulated by the plotting scripts.

PowerData <- function(){
  
  # Assign the designated url to DataUrl
  DataUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  
  # Retrieve the file.
  download.file(DataUrl, destfile = "household_power_consumption.zip", method = "curl")
  
  # Close connections:
  closeAllConnections()
  
  # Unzip the file and assign it to a data frame.      
  PowerData <- read.table(unz("household_power_consumption.zip", filename="household_power_consumption.txt"), 
                   sep = ";", header = T, na.strings = "?", stringsAsFactors=F)
  
  # Use strptime to prepare the time information in the file and add it to PowerData
  
  
  PowerData$DateTime <- strptime(paste(PowerData$Date, PowerData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  
  # Subset dataframe which ONLY has Feb 1 and Feb 2 data
  PowerData <- subset(PowerData, Date == "1/2/2007" | Date == "2/2/2007")
  
  # Return subset dataframe
  PowerData
}

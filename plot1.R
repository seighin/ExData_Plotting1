plot1 <- function() {
    ## Read in raw data from text file
    raw <- read.table("household_power_consumption.txt", header=TRUE, 
                      sep=";", na.string = "?")
    
    # Convert separate date and time columns to single datetime vector
    dt <- strptime(paste(raw[,1], raw[,2]), "%d/%m/%Y %H:%M:%S")
    
    # Create logical vector of dates we are interested in
    sub <- dt >= strptime("2007-02-01","%Y-%m-%d") & dt < strptime("2007-02-03","%Y-%m-%d")
    
    # Create subset of data
    sub_raw <- raw[sub,]
    sub_dt <- dt[sub]
    
    # Create plot
    png(file="plot1.png")
    hist(sub_raw$Global_active_power, col="red" , main="Global Active Power", 
         xlab="Global Active Power (kilowatts)")
    dev.off()
}
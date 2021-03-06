require(data.table)

## Data PreProcessing

if(!file.exists("EPC.zip")){
        file.url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        
        download.file(file.url, "EPC.zip")
}

if(!file.exists("EPC"))
        unzip("EPC.zip", exdir = "EPC")

data.hpc <- fread("./EPC/household_power_consumption.txt", skip="1/2/2007", nrow=2880, na.strings=c("NA", "?"), header=FALSE)

setnames(data.hpc, tolower(names(read.table('./EPC/household_power_consumption.txt', header=TRUE,sep=";",nrows=1))))

## Plotting Code

###Plot 1

# The default height and width in the png function is 480 by 480 pixels
# The example files in the course github repo also have transparent backgrounds

png("plot1.png", bg = "transparent")        
hist(data.hpc$global_active_power, col="red",main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
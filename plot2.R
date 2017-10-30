# set working directory
setwd("E:/Data_magic_pro/Assignment/R_assignments/3 exploratoryData_7aug/work/week1")

# Read input file
file <- "household_power_consumption.txt"
fileData <- read.delim(file,
                       sep = ";",
                       stringsAsFactors = F,
                       dec = ".")

reqdFileData <- fileData[fileData$Date %in% c("1/2/2007","2/2/2007"),]

gapNum <- as.numeric(reqdFileData$Global_active_power)

gapTime <- strptime(paste(reqdFileData$Date, reqdFileData$Time),"%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480)
plot(gapTime, gapNum, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

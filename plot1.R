# set working directory
setwd("E:/Data_magic_pro/Assignment/R_assignments/3 exploratoryData_7aug/work/week1")

# Read input file
file <- "household_power_consumption.txt"
fileData <- read.delim(file,
                 sep = ";",
                 stringsAsFactors = F,
                 dec = ".")

reqdFileData <- fileData[fileData$Date %in% c("1/2/2007","2/2/2007"),]

gapn <- as.numeric(reqdFileData$Global_active_power)

png(filename = "plot1.png", width = 480, height = 480)
hist(gapn,
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()

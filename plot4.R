
# set working directory
setwd("E:/Data_magic_pro/Assignment/R_assignments/3 exploratoryData_7aug/work/week1")

# Read input file
file <- "household_power_consumption.txt"
fileData <- read.delim(file,
                       sep = ";",
                       stringsAsFactors = F,
                       dec = ".")

reqdFileData <- fileData[fileData$Date %in% c("1/2/2007","2/2/2007"),]
str(reqdFileData)

gapNum <- as.numeric(reqdFileData$Global_active_power)

voltNum <- as.numeric(reqdFileData$Voltage)

grpNum <- as.numeric(reqdFileData$Global_reactive_power)

sm1Num <- as.numeric(reqdFileData$Sub_metering_1)
sm2Num <- as.numeric(reqdFileData$Sub_metering_2)
sm3Num <- as.numeric(reqdFileData$Sub_metering_3)

gapTime <- strptime(paste(reqdFileData$Date, reqdFileData$Time),"%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

#--1
plot(gapTime, gapNum, type = "l", xlab = "", ylab = "Global Active Power")

#--2
plot(gapTime, voltNum, type = "l", xlab = "datetime", ylab = "Voltage")

#--3
plot(gapTime, sm1Num, type = "l",col="black", xlab = "", ylab = "Energy Sub Metering")
lines(gapTime, sm2Num, type = "l",col="red")
lines(gapTime, sm3Num, type = "l",col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#--4
plot(gapTime, grpNum, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()

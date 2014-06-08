setwd("./Exploratory Data Analysis Project 1")
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = "character")
power2 <- power[power$Date == "1/2/2007"|power$Date == "2/2/2007",]
power2 <- cbind(as.POSIXct( strptime(paste(power2$Date, power2$Time), "%d/%m/%Y %H:%M:%S")),power2)
colnames(power2)[1]<-"datetime"

for (i in 4:10) {
  power2[,i]<- as.numeric(power2[,i])
}

png("plot1.png")
hist(power2[,4], xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
dev.off()
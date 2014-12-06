library(data.table)
dt = fread("/home/andrea/data/power.txt", header=TRUE, sep=";")
dt = dt[c(Date=="1/2/2007",Date=="2/2/2007"),]
library(ggplot2)
hist(as.numeric(dt$Global_active_power), main="Global active power", xlab="Global active power (kilowatts)", ylab="Frequency", col="red", breaks=12) 
dev.copy(png, file = "/home/andrea/temp/plot1.png")
dev.off()


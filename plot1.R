plot1 <- function(){
  dat <- read.table("household_power_consumption.txt",sep=";",skip=66637,nrows=2880,na.strings = "?")
  temp <- read.table("household_power_consumption.txt",sep=";",nrows=1)
  temp <- as.matrix(temp)
  colnames(dat) <- temp[1,]
  par(bg="transparent")
  hist(dat[,3],col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
  dev.copy(device = png,filename="plot1.png",width=480,height=480)
  dev.off()
}
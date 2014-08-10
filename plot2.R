plot2 <- function(){
  dat <- read.table("household_power_consumption.txt",sep=";",skip=66637,nrows=2880,na.strings = "?")
  temp <- read.table("household_power_consumption.txt",sep=";",nrows=1)
  temp <- as.matrix(temp)
  colnames(dat) <- temp[1,]
  
  Sys.setlocale("LC_TIME", "English")
  dat$Date <- strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S")
  par(bg="transparent")
  plot(dat[,1],dat[,3],type="l",xlab="",ylab="Global Active Power (kilowatts)")
  dev.copy(device = png,filename="plot2.png",width=480,height=480)
  dev.off()
}
plot4 <- function(){
  dat <- read.table("household_power_consumption.txt",sep=";",skip=66637,nrows=2880,na.strings = "?")
  temp <- read.table("household_power_consumption.txt",sep=";",nrows=1)
  temp <- as.matrix(temp)
  colnames(dat) <- temp[1,]

  Sys.setlocale("LC_TIME", "English")
  dat$Date <- strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S")
  png(filename="plot4.png",width=480,height=480)
  par(mfrow=c(2,2),bg="transparent")
  plot(dat[,1],dat[,3],type="l",xlab="",ylab="Global Active Power")
  plot(dat[,1],dat[,5],type="l",xlab="datetime",ylab="Voltage")
  plot(dat[,1],dat[,7],type="n",xlab="",ylab="Energy Sub Metering")
  lines(dat[,1],dat[,7],col="black",type="l")
  lines(dat[,1],dat[,8],col="red",type="l")
  lines(dat[,1],dat[,9],col="blue",type="l")
  legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),box.lty=0)
  plot(dat[,1],dat[,4],type="l",xlab="datetime",ylab="Global_reactive_power")
  #dev.copy(device = png,filename="plot4.png",width=480,height=480)
  dev.off()
}
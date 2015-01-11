
##Read and clean data
etable<-read.table("household_power_consumption.txt",header = TRUE,sep = ";")
etable<-cbind(etable,DT=paste(etable$Date,etable$Time));##Merge Date and Time
etable$DT<-strptime(etable$DT,"%d/%m/%Y %H:%M:%S"); ## change to date format
etable2<-etable[(etable$Date=="1/2/2007"|etable$Date=="2/2/2007"),] 
etable2$Global_active_power<-as.numeric(etable2$Global_active_power)

##Plot3
par(mfrow=c(1,1))
plot(etable2$DT,etable2$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(etable2$DT,etable2$Sub_metering_2,col="red")
lines(etable2$DT,etable2$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=1)
dev.copy(png,file="plot3.png")
dev.off()

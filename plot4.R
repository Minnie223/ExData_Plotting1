
##Read and clean data
etable<-read.table("household_power_consumption.txt",header = TRUE,sep = ";")
etable<-cbind(etable,DT=paste(etable$Date,etable$Time));##Merge Date and Time
etable$DT<-strptime(etable$DT,"%d/%m/%Y %H:%M:%S"); ## change to date format
etable2<-etable[(etable$Date=="1/2/2007"|etable$Date=="2/2/2007"),] 
etable2$Global_active_power<-as.numeric(etable2$Global_active_power)

##Plot4
par(mfrow=c(2,2))
with(etable2,{plot(DT,Global_active_power,type="l",xlab="",ylab="Global Active Power")
              plot(DT,Voltage,type="l",xlab="datetime",ylab="Voltage")
              plot(DT,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
              lines(DT,Sub_metering_2,col="red")
              lines(DT,Sub_metering_3,col="blue")
              legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.5,box.lty=0)
              plot(DT,Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
})
dev.copy(png,file="plot4.png")
dev.off()

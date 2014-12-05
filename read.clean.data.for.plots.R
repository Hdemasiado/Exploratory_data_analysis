# we need to see if the file with tidy data already exists; if it does not exists, then me need to create it
if (!file.exists('selected.household.power.consumption.txt')) {  
    file.url<-'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
    download.file(file.url,destfile='household_power_consumption.zip')
    unzip('household_power_consumption.zip',overwrite=TRUE) #unzip on the same folder where we already are working
    
    # read the raw table and limit to 2 days
    variables<-c(rep('character',2),rep('numeric',7))
    all.household.power.consumption<-read.table('household_power_consumption.txt',header=TRUE,sep=';',na.strings='?',colClasses=variables)
    selected.household.power.consumption<-all.household.power.consumption[all.household.power.consumption$Date=='1/2/2007' | all.household.power.consumption$Date=='2/2/2007',]
    
    # convert date and time and assign column names
    columns<-c('Date','Time','GlobalActivePower','GlobalReactivePower','Voltage','GlobalIntensity',
               'SubMetering1','SubMetering2','SubMetering3')
    colnames(selected.household.power.consumption)<-columns
    selected.household.power.consumption$DateTime<-dmy(selected.household.power.consumption$Date)+hms(selected.household.power.consumption$Time)
    selected.household.power.consumption<-selected.household.power.consumption[,c(10,3:9)]
    
    # write back the data set once is clean in the directory
    write.table(selected.household.power.consumption,file='selected.household.power.consumption.txt',sep='|',row.names=FALSE)
} else {
    selected.household.power.consumption<-read.table('selected.household.power.consumption.txt',header=TRUE,sep='|')
    selected.household.power.consumption$DateTime<-as.POSIXlt(selected.household.power.consumption$DateTime)
}

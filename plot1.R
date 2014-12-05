# create -if it does not exist- the plots folder
if (!file.exists('plots')) {
    dir.create('plots')
}

# via script "read.clean.data.for.plots.R", get-clean-select data
source('read.clean.data.for.plots.R')

# open device
png(filename='plots/plot1.png',width=480,height=480,units='px')

# plot data
hist(selected.household.power.consumption$GlobalActivePower,main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red')

# Turn off device
x<-dev.off()
# create -if it does not exist- the plots folder
if (!file.exists('plots')) {
    dir.create('plots')
}

# via script "read.clean.data.for.plots.R", get-clean-select data
source('read.clean.data.for.plots.R')

# open device
png(filename='plots/plot2.png',width=480,height=480,units='px')

# plot data
plot(selected.household.power.consumption$DateTime,selected.household.power.consumption$GlobalActivePower,ylab='Global Active Power (kilowatts)', xlab='', type='l')

# close device
x<-dev.off()
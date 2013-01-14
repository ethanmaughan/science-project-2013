inca150w <- read.csv(file="/tmp/science-project-2013/data/inca-150w.txt", head=FALSE, sep=",")
colnames(inca150w)[1] <- "temp"
colnames(inca150w)[2] <- "time"

inca75w <- read.csv(file="/tmp/science-project-2013/data/inca-75w.txt", head=FALSE, sep=",")
colnames(inca75w)[1] <- "temp"
colnames(inca75w)[2] <- "time"

inca60w <- read.csv(file="/tmp/science-project-2013/data/inca-60w.txt", head=FALSE, sep=",")
colnames(inca60w)[1] <- "temp"
colnames(inca60w)[2] <- "time"

inca40w <- read.csv(file="/tmp/science-project-2013/data/inca-40w.txt", head=FALSE, sep=",")
colnames(inca40w)[1] <- "temp"
colnames(inca40w)[2] <- "time"

flor13w <- read.csv(file="/tmp/science-project-2013/data/flor-13w.txt", head=FALSE, sep=",")
colnames(flor13w)[1] <- "temp"
colnames(flor13w)[2] <- "time"

led4w <- read.csv(file="/tmp/science-project-2013/data/led-4w.txt", head=FALSE, sep=",")
colnames(led4w)[1] <- "temp"
colnames(led4w)[2] <- "time"

pdf('/tmp/science-project-2013/graphs/incandescent-graphs.pdf')
layout(matrix(c(1,2,3,4),2,2,byrow=TRUE))
plot(inca40w, type="l", main="Incandescent (40w)", xlab="Temperature (F)", ylab="Seconds")
plot(inca60w, type="l", main="Incandescent (60w)", xlab="Temperature (F)", ylab="Seconds")
plot(inca75w, type="l", main="Incandescent (75w)", xlab="Temperature (F)", ylab="Seconds")
plot(inca150w, type="l", main="Incandescent (150w)", xlab="Temperature (F)", ylab="Seconds")
dev.off()

pdf('/tmp/science-project-2013/graphs/other-graphs.pdf')
layout(matrix(c(1,2),1,2,byrow=TRUE))
plot(led4w, type="l", main="LED (4w)", xlab="Temperature (F)", ylab="Seconds")
plot(flor13w, type="l", main="Florescent (13w)", xlab="Temperature (F)", ylab="Seconds")
dev.off()

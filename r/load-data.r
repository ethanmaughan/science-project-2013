
# run with these commands
#  setwd('/tmp/science-project-2013/data')
#  getwd
#  source("../r/load-data.r", echo=TRUE)

# line width for graphing
lwd <- 5

clean <- function(data) {
	colnames(data)[1] <- "temp"
	colnames(data)[2] <- "time"
	tempNormalized <- data$temp - min(data$temp)
	lastTemp <- tail(tempNormalized, 1)
	tempNormalized <- append(tempNormalized, rep(lastTemp, (4000 - NROW(tempNormalized))))	
	df <- data.frame(rep(1:4000), tempNormalized)
	colnames(df)[1] <- "time"
	colnames(df)[2] <- "temp"
	return(df)
}

ylim <- 180

# INCANDESCENT
inca40w <- clean(read.csv(file="/tmp/science-project-2013/data/inca-40w.txt", head=FALSE, sep=","))
pdf('/tmp/science-project-2013/graphs/inca40w-graph.pdf')
plot(inca40w, type="l", main="Incandescent (40w)", lwd=lwd, col="dark green", ylim=c(0,ylim), ylab="Temperature Change (F)", xlab="Seconds")
dev.off()

inca60w <- clean(read.csv(file="/tmp/science-project-2013/data/inca-60w.txt", head=FALSE, sep=","))
pdf('/tmp/science-project-2013/graphs/inca60w-graph.pdf')
plot(inca60w, type="l", main="Incandescent (60w)", lwd=lwd, col="dark orange", ylim=c(0,ylim), ylab="Temperature Change (F)", xlab="Seconds")
dev.off()

inca75w <- clean(read.csv(file="/tmp/science-project-2013/data/inca-75w.txt", head=FALSE, sep=","))
pdf('/tmp/science-project-2013/graphs/inca75w-graph.pdf')
plot(inca75w, type="l", main="Incandescent (75w)", lwd=lwd, col="dark blue", ylim=c(0,ylim), ylab="Temperature Change (F)", xlab="Seconds")
dev.off()

inca150w <- clean(read.csv(file="/tmp/science-project-2013/data/inca-150w.txt", head=FALSE, sep=","))
pdf('/tmp/science-project-2013/graphs/inca150w-graph.pdf')
plot(inca150w, type="l", main="Incandescent (150w)", lwd=lwd, col="dark red", ylim=c(0,ylim), ylab="Temperature Change (F)", xlab="Seconds")
dev.off()

colors <- c('dark green', 'dark orange', 'dark blue', 'dark red')

#inca <- data.frame(inca40w$temp, inca60w$temp, inca75w$temp, inca150w$temp);
#colnames(inca)[1] <- "a"
#colnames(inca)[2] <- "b"
#colnames(inca)[3] <- "c"
#colnames(inca)[4] <- "d"
#pdf('/tmp/science-project-2013/graphs/inca-graph.pdf')
#plot(inca$a, type='n')
#lines(inca$b, inca$c, inca$d)
#dev.off()


# build the combined graphs
pdf('/tmp/science-project-2013/graphs/incandescent-graphs.pdf')
layout(matrix(c(1:4),2,2,byrow=TRUE))
plot(inca40w, type="l", main="Incandescent (40w)", lwd=lwd, col="dark green", ylim=c(0,ylim), ylab="Temperature Change (F)", xlab="Seconds")
plot(inca60w, type="l", main="Incandescent (60w)", lwd=lwd, col="dark orange", ylim=c(0,ylim), ylab="Temperature Change (F)", xlab="Seconds")
plot(inca75w, type="l", main="Incandescent (75w)", lwd=lwd, col="dark blue", ylim=c(0,ylim), ylab="Temperature Change (F)", xlab="Seconds")
plot(inca150w, type="l", main="Incandescent (150w)", lwd=lwd, col="dark red", ylim=c(0,ylim), ylab="Temperature Change (F)", xlab="Seconds")
dev.off()


# FLUORESCENT -------------------------------------------------
ylim = 50

flor13w <- clean(read.csv(file="/tmp/science-project-2013/data/flor-13w.txt", head=FALSE, sep=","))
pdf('/tmp/science-project-2013/graphs/flor13w-graph.pdf')
plot(flor13w, type="l", main="Fluorescent (13w)", col="dark red", lwd=lwd, ylim=c(0,ylim), ylab="Temperature Change (F)", xlab="Seconds")
dev.off()

flor26w <- clean(read.csv(file="/tmp/science-project-2013/data/flor-26w.txt", head=FALSE, sep=","))
pdf('/tmp/science-project-2013/graphs/flor26w-graph.pdf')
plot(flor26w, type="l", main="Fluorescent (26w)", col="dark blue", lwd=lwd, ylim=c(0,ylim), ylab="Temperature Change (F)", xlab="Seconds")
dev.off()

# combined graphs
pdf('/tmp/science-project-2013/graphs/fluorescent-graphs.pdf')
layout(matrix(c(1,2),1,2,byrow=TRUE))
plot(flor13w, type="l", main="Fluorescent (13w)", col="dark blue", lwd=lwd, ylim=c(0,ylim), ylab="Temperature Change (F)", xlab="Seconds")
plot(flor26w, type="l", main="Fluorescent (26w)", col="dark red", lwd=lwd, ylim=c(0,ylim), ylab="Temperature Change (F)", xlab="Seconds")
dev.off()


# LED -------------------------------------------------
ylim = 20

led4w <- clean(read.csv(file="/tmp/science-project-2013/data/led-4w.txt", head=FALSE, sep=","))
pdf('/tmp/science-project-2013/graphs/led4w-graph.pdf')
plot(led4w, type="l", main="LED (4w)", col="dark red", lwd=lwd, ylim=c(0,ylim), ylab="Temperature Change (F)", xlab="Seconds")
dev.off()

led9w <- clean(read.csv(file="/tmp/science-project-2013/data/led-9-5w.txt", head=FALSE, sep=","))
pdf('/tmp/science-project-2013/graphs/led9-5w-graph.pdf')
plot(led9w, type="l", main="LED (9.5w)", col="dark green", lwd=lwd, ylim=c(0,ylim), ylab="Temperature Change (F)", xlab="Seconds")
dev.off()

led17w <- clean(read.csv(file="/tmp/science-project-2013/data/led-17w.txt", head=FALSE, sep=","))
pdf('/tmp/science-project-2013/graphs/led17w-graph.pdf')
plot(led17w, type="l", main="LED (17w)", col="dark blue", lwd=lwd, ylim=c(0,ylim), ylab="Temperature Change (F)", xlab="Seconds")
dev.off()

# combined graphs
pdf('/tmp/science-project-2013/graphs/led-graphs.pdf')
layout(matrix(c(1:3),1,3,byrow=TRUE))
plot(led4w, type="l", main="LED (4w)", col="dark blue", lwd=lwd, ylim=c(0,ylim), ylab="Temperature Change (F)", xlab="Seconds")
plot(led9w, type="l", main="LED (9.5w)", col="dark red", lwd=lwd, ylim=c(0,ylim), ylab="Temperature Change (F)", xlab="Seconds")
plot(led17w, type="l", main="LED (17w)", col="dark red", lwd=lwd, ylim=c(0,ylim), ylab="Temperature Change (F)", xlab="Seconds")
dev.off()

library("ggplot2")

tries <- c(rep("1-1st", 2), rep("1-2nd", 2), rep("1-3rd", 2), rep("1-4th", 2), rep("1-5th", 2), rep("1-6th", 2), rep("1-7th", 2), rep("1-8th", 2), rep("1-9th", 2))
times <- rep(c("build", "execution"), 9)
value_all <- read.csv("b1_e1.csv", header=F)	
value <- value_all[1]
data <- data.frame(tries, times, value)

ggplot(data, aes(fill=times, y=V1, x=tries)) + geom_bar(position="stack", stat="identity")
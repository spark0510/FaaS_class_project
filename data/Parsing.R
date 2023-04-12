library("ggplot2")
library("viridis")
library("hrbrthemes")

tries <- c(rep("1st", 2), rep("2nd", 2), rep("3rd", 2), rep("4th", 2), rep("5th", 2), rep("6th", 2), rep("7th", 2), rep("8th", 2), rep("9th", 2))
times <- rep(c("startup", "execution"), 9)
value <- read.csv("az_e1.csv", header=F)	

data <- data.frame(tries, times, value)

ggplot(data, aes(fill=condition, y=value, x=tries)) + geom_bar(poistion="fill", stat="identity") + scale_fill_viridis(discrete = T) + ggtitle("bench 1") + theme_ipsum() + xlab(""
library("ggplot2")

tries <- c(rep("1-1st", 2), rep("1-2nd", 2), rep("1-3rd", 2))
times <- rep(c("2_startup latency", "1_execution"), 3)
value_all <- read.csv("b3_e1.csv", header=F)	
value <- value_all[1]
data3_1 <- data.frame(tries, times, value)

ggplot(data3_1, aes(fill=times, y=V1, x=tries)) + geom_bar(position="stack", stat="identity")
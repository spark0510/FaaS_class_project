library("ggplot2")

tries <- c(rep("2-1st", 2), rep("2-2nd", 2), rep("2-3rd", 2), rep("2-4th", 2), rep("2-5th", 2), rep("2-6th", 2), rep("2-7th", 2), rep("2-8th", 2), rep("2-9th", 2))
times <- rep(c("2_startup latency", "1_execution"), 9)
value_all <- read.csv("b3_e2.csv", header=F)	
value <- value_all[1]
data3_2 <- data.frame(tries, times, value)

ggplot(data3_2, aes(fill=times, y=V1, x=tries)) + geom_bar(position="stack", stat="identity")
library("ggplot2")

tries <- c(rep("2-1st", 4), rep("2-2nd", 4), rep("2-3rd", 4), rep("2-4th", 4), rep("2-5th", 4), rep("2-6th", 4), rep("2-7th", 4), rep("2-8th", 4), rep("2-9th", 4))
times <- rep(c("4_build", "3_CMD", "2_startup", "1_execution"), 9)
value_all <- read.csv("b2_e3.csv", header=F)	
value <- value_all[1]
data2_3 <- data.frame(tries, times, value)

ggplot(data2_3, aes(fill=times, y=V1, x=tries)) + geom_bar(position="stack", stat="identity")
#!/usr/local/bin/Rscript

a_start_time<-Sys.time()
start_time <- format(a_start_time, "%Y-%m-%d %H:%M:%OS6")

install.packages("rjson")
install.packages("jsonlite")
install.packages("aws.s3")
install.packages("RCurl")
install.packages("dplyr")
install.packages("httr")


a <- system("dd if=/dev/zero of=/tmp/test1.img bs=1 count=500 oflag=dsync", intern=TRUE)

a_end_time<-Sys.time()
end_time <- format(a_end_time, "%Y-%m-%d %H:%M:%OS6")
cat('{\"time\":\"',end_time,start_time,'\"}')

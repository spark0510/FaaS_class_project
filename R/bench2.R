#!/usr/local/bin/Rscript

start_time<-system("date +%s.%N", intern = TRUE)

a <- system("dd if=/dev/zero of=testfile bs=1M count=1024", intern=TRUE)

end_time <-system("date +%s.%N", intern = TRUE)


cat('{\"time\":\"',start_time,end_time,'\"}')

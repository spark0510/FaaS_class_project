#!/usr/local/bin/Rscript

start_time <- system("date +'%s.%N'", intern = TRUE)

install.packages("jsonlite", dependencies=TRUE, repos="http://cran.rstudio.com/")
install.packages("aws.s3", dependencies=TRUE, repos="http://cran.rstudio.com/")
install.packages("tidyr", dependencies=TRUE, repos="http://cran.rstudio.com/")
install.packages("RCurl", dependencies=TRUE, repos="http://cran.rstudio.com/")
install.packages("httr", dependencies=TRUE, repos="http://cran.rstudio.com/")
install.packages("dplyr", dependencies=TRUE, repos="http://cran.rstudio.com/")

a <- system("dd if=/dev/zero of=testfile bs=1M count=1024", intern=TRUE)

end_time <- system("date +'%s.%N'", intern = TRUE)

cat('{\"time\":\"',start_time,end_time,'\"}')

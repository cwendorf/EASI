# Estimation Approach to Statistical Inference
## Pipes Repeated Measures Data Application

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

Outcome1 <- round(rnorm(50,mean=7,sd=2),0)
Outcome2 <- round(rnorm(50,mean=11,sd=4),0)
Outcome3 <- round(rnorm(50,mean=12,sd=4),0)
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3)

### Using the Native and Dot Pipes

(RepeatedData) |> estimateMeans()
(RepeatedData) |> estimateMeans(conf.level=.99)

(RepeatedData) %.>% estimateMeans(.)
(RepeatedData) %.>% {c(estimateMeans(.),testMeans(.))}
(RepeatedData) %.>% {c(estimateMeans(.,conf.level=.99),testMeans(.,mu=5))}

### Using Through Pipes

(RepeatedData) %.>>% estimateMeans(.) %.>>% testMeans(.)
(RepeatedData) %.>>% estimateMeans(.,conf.level=.99) %.>>% testMeans(.,mu=5)

(RepeatedData) %.>>% describeMeans(.) %.>% estimateMeans(.)
(RepeatedData) %.>>% describeMeans(.) |> estimateMeans()

# Estimation Approach to Statistical Inference
## Pipes One Way Data Application

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

Factor <- c(rep(1,50),rep(2,50),rep(3,50))
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Level1","Level2","Level3"))
Level1 <- round(rnorm(50,mean=7,sd=2),0)
Level2 <- round(rnorm(50,mean=11,sd=4),0)
Level3 <- round(rnorm(50,mean=12,sd=4),0)
Outcome <- c(Level1,Level2,Level3)

### Using the Native and Dot Pipes

(Outcome~Factor) |> estimateMeans()
(Outcome~Factor) |> estimateMeans(conf.level=.99)

(Outcome~Factor) %.>% estimateMeans(.)
(Outcome~Factor) %.>% c(estimateMeans(.),testMeans(.))
(Outcome~Factor) %.>% c(estimateMeans(.,conf.level=.99),testMeans(.,mu=5))

### Using Passthrough Pipes

(Outcome~Factor) %p>% estimateMeans(.) %p>% testMeans(.)
(Outcome~Factor) %p>% estimateMeans(.,conf.level=.99) %p>% testMeans(.,mu=5)

(Outcome~Factor) %p>% describeMeans(.) %.>% estimateMeans(.)
(Outcome~Factor) %p>% describeMeans(.) |> estimateMeans()

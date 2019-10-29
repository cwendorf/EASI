# EASI: Estimation Approach to Statistical Inference
## Relational Intervals for Single-Factor Between Subjects Design
## From Wendorf, C. A. (2012). Drawing inferences from multiple intervals in the single-factor design: Derivations, clarifications, extensions, and representations. Methodology, 8(4), 125-133.

### Source the EASI Functions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/omnibusExtension.R")
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/relationalExtension.R")

### Enter Data (from Wendorf, 2012)

Factor <- c(rep(1,10),rep(2,10),rep(3,10),rep(4,10),rep(5,10))
Outcome <- c(61,64,72,64,64,70,73,65,65,72,69,74,79,69,64,64,69,69,74,79,70,75,80,80,70,65,70,75,70,70,70,80,85,75,70,65,75,75,85,80,65,55,70,65,65,70,70,60,65,70)
Factor <- factor(Factor,levels=c(1,2,3,4,5),labels=c("L1","L2","L3","L4","L5"))
WendorfData <- data.frame(Factor,Outcome)
WendorfData

### Relational Intervals

estimateRelational(Outcome~Factor)

plotMeans(Outcome~Factor) # RelationalOneWay-Figure1.jpeg
addRelational(Outcome~Factor) # RelationalOneWay-Figure2.jpeg
addData(Outcome~Factor) # RelationalOneWay-Figure3.jpeg

plotRelational(Outcome~Factor) # RelationalOneWay-Figure4.jpeg
plotRelational(Outcome~Factor,conf.level=.99,mu=70) # RelationalOneWay-Figure5.jpeg
addData(Outcome~Factor,method="stack",col="black") # RelationalOneWay-Figure6.jpeg

# Estimation Approach to Statistical Inference
## Relational Intervals - OneWay (Between-Subjects) Example with Wendorf Summary Statistics

### Source the EASI Functions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-Functions.R")
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-Omnibus-Extension.R")
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-Relational-Extension.R")

### Enter Summary Statistics

L1 <- c(N=10,M=67.000,SD=4.295)
L2 <- c(N=10,M=71.000,SD=5.375)
L3 <- c(N=10,M=72.500,SD=4.859)
L4 <- c(N=10,M=76.000,SD=6.583)
L5 <- c(N=10,M=65.500,SD=4.972)
WendorfSummary <- rbind(L1,L2,L3,L4,L5)
class(WendorfSummary) <- "bss"
WendorfSummary

### Relational Intervals

estimateRelational(WendorfSummary)

plotMeans(WendorfSummary) # RelationalOneWay-Figure1.jpeg
addRelational(WendorfSummary) # RelationalOneWay-Figure2.jpeg

plotRelational(WendorfSummary) # RelationalOneWay-Figure4.jpeg
plotRelational(WendorfSummary,conf.level=.99,mu=70) # RelationalOneWay-Figure5.jpeg

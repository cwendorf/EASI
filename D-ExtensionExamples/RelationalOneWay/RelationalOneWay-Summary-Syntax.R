# EASI: Estimation Approach to Statistical Inference
## Relational Intervals for Single-Factor Between Subjects Design
## From Wendorf, C. A. (2012). Drawing inferences from multiple intervals in the single-factor design: Derivations, clarifications, extensions, and representations. Methodology, 8(4), 125-133.

### Source the EASI Functions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/omnibusExtension.R")
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/relationalExtension.R")

### Enter Summary Statistics (from Wendorf, 2012)

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

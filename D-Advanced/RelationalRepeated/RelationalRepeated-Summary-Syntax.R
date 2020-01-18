# Estimation Approach to Statistical Inference
## Relational Intervals - Repeated (Within-Subjects) Example with Wendorf Summary Statistics
## From Wendorf, C. A. (2012). Drawing inferences from multiple intervals in the single-factor design: Derivations, clarifications, extensions, and representations. Methodology, 8(4), 125-133.

### Source the EASI Functions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-Functions.R")
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-Omnibus-Extension.R")
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-Relational-Extension.R")

### Enter Summary Statistics (adapted from Wendorf, 2012)

L1 <- c(N=10,M=67.000,SD=4.295)
L2 <- c(N=10,M=71.000,SD=5.375)
L3 <- c(N=10,M=72.500,SD=4.859)
L4 <- c(N=10,M=76.000,SD=6.583)
L5 <- c(N=10,M=65.500,SD=4.972)
WendorfSummary <- rbind(L1,L2,L3,L4,L5)
class(WendorfSummary) <- "wss"
WendorfSummary

WendorfCorr <- declareCorrMatrix("L1","L2","L3","L4","L5")
WendorfCorr["L1",] <- c(1.000,0.362,-0.106,0.216,0.702)
WendorfCorr["L2",] <- c(0.362,1.000,0.425,0.879,0.062)
WendorfCorr["L3",] <- c(-0.106,0.425,1.000,0.521,-0.287)
WendorfCorr["L4",] <- c(0.216,0.879,0.521,1.000,-0.102)
WendorfCorr["L5",] <- c(0.702,0.062,-0.287,-0.102,1.000)
WendorfCorr

### Relational Intervals

estimateRelational(WendorfSummary,WendorfCorr)

plotMeans(WendorfSummary) # RelationalRepeated-Figure1.jpeg
addRelational(WendorfSummary,WendorfCorr)# RelationalRepeated-Figure2.jpeg

plotRelational(WendorfSummary,WendorfCorr) # RelationalRepeated-Figure4.jpeg
plotRelational(WendorfSummary,WendorfCorr,conf.level=.99,mu=70) # RelationalRepeated-Figure5.jpeg

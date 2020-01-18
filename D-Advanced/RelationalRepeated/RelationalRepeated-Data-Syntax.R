# Estimation Approach to Statistical Inference
## Relational Intervals - Repeated (Within-Subjects) Example with Wendorf Data
## From Wendorf, C. A. (2012). Drawing inferences from multiple intervals in the single-factor design: Derivations, clarifications, extensions, and representations. Methodology, 8(4), 125-133.

### Source the EASI Functions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/omnibusExtension.R")
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/relationalExtension.R")

### Enter Data (adapted from Wendorf, 2012)

L1 <- c(61,64,72,64,64,70,73,65,65,72)
L2 <- c(69,74,79,69,64,64,69,69,74,79)
L3 <- c(70,75,80,80,70,65,70,75,70,70)
L4 <- c(70,80,85,75,70,65,75,75,85,80)
L5 <- c(65,55,70,65,65,70,70,60,65,70)
WendorfData <- data.frame(L1,L2,L3,L4,L5)
WendorfData

### Relational Intervals

estimateRelational(L1,L2,L3,L4,L5)

plotMeans(L1,L2,L3,L4,L5) # RelationalRepeated-Figure1.jpeg
addRelational(L1,L2,L3,L4,L5) # RelationalRepeated-Figure2.jpeg
addData(L1,L2,L3,L4,L5) # RelationalRepeated-Figure3.jpeg

plotRelational(L1,L2,L3,L4,L5) # RelationalRepeated-Figure4.jpeg
plotRelational(L1,L2,L3,L4,L5,conf.level=.99,mu=70) # RelationalRepeated-Figure5.jpeg
addData(L1,L2,L3,L4,L5,method="stack",col="black") # RelationalRepeated-Figure6.jpeg

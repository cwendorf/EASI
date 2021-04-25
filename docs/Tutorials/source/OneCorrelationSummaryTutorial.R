# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/sourceEASI.R")

## One Correlation Tutorial with Summary Statistics

### Data Management

Outcome1 <- c(N=4,M=2.000,SD=2.449)
Outcome2 <- c(N=4,M=6.000,SD=2.449)
PairedSummary <- rbind(Outcome1,Outcome2)
class(PairedSummary) <- "wss"

PairedCorr <- declareCorrelations("Outcome1","Outcome2")
PairedCorr["Outcome1","Outcome2"] <- .500
 
### Analyses of a Correlation

#### Confidence Interval

estimateCorrelations(PairedSummary,PairedCorr)
plotCorrelations(PairedSummary,PairedCorr)

estimateCorrelations(PairedSummary,PairedCorr,conf.level=.99)
plotCorrelations(PairedSummary,PairedCorr,conf.level=.99,mu=0,rope=c(-.2,.2))

#### Significance Test

testCorrelations(PairedSummary,PairedCorr)

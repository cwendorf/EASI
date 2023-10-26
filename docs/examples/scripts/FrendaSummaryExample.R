# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

## Frenda Summary Statistics Example

### Data Management

EveningSleep <- c(N=26,M=1.50,SD=1.38)
EveningNosleep <- c(N=26,M=1.14,SD=0.96)
MorningSleep <- c(N=25,M=1.38,SD=1.50)
MorningNosleep <- c(N=26,M=2.22,SD=1.68)
FrendaSummary <- rbind(EveningSleep,EveningNosleep,MorningSleep,MorningNosleep)
class(FrendaSummary) <- "bss"

### Analyses of the Different Groups

estimateMeans(FrendaSummary)
plotMeans(FrendaSummary,ylab="False Memory",ylim=c(0,4),values=FALSE)

### Analyses of the Marginal Means

Evening <- c(.5,.5,0,0)
estimateMeanContrast(FrendaSummary,contrast=Evening)
Morning <- c(0,0,.5,.5)
estimateMeanContrast(FrendaSummary,contrast=Morning)

Sleep <- c(.5,0,.5,0)
estimateMeanContrast(FrendaSummary,contrast=Sleep)
Nosleep <- c(0,.5,0,.5)
estimateMeanContrast(FrendaSummary,contrast=Nosleep)

### Analyses of Main Effects

#### Analyses of the Factor A Main Effect

mainFactorA <- c(-.5,-.5,.5,.5)
estimateMeanSubsets(FrendaSummary,contrast=mainFactorA)
plotMeanSubsets(FrendaSummary,contrast=mainFactorA,labels=c("Evening","Morning"),main="Factor A Main Effect",ylab="False Memory",ylim=c(0,4),values=FALSE)
estimateStandardizedMeanContrast(FrendaSummary,contrast=mainFactorA)

#### Analyses of the Factor B Main Effect

mainFactorB <- c(-.5,.5,-.5,.5)
estimateMeanSubsets(FrendaSummary,contrast=mainFactorB)
plotMeanSubsets(FrendaSummary,contrast=mainFactorB,labels=c("Sleep","NoSleep"),main="Factor B Main Effect",ylab="False Memory",ylim=c(0,4),values=FALSE)
estimateStandardizedMeanContrast(FrendaSummary,contrast=mainFactorB)

### Analyses of the Interaction

Interaction <- c(1,-1,-1,1)
estimateMeanContrast(FrendaSummary,contrast=Interaction)

#### Analyses of the Factor B at A1 Simple Effect

simpleBatA1 <- c(-1,1,0,0)
estimateMeanSubsets(FrendaSummary,contrast=simpleBatA1)
plotMeanSubsets(FrendaSummary,contrast=simpleBatA1,labels=c("Sleep","NoSleep"),main="Simple Effect of B at A1",ylab="False Memory",ylim=c(0,4),values=FALSE)
estimateStandardizedMeanContrast(FrendaSummary,contrast=simpleBatA1)

#### Analyses of the Factor B at A2 Simple Effect

simpleBatA2 <- c(0,0,-1,1)
estimateMeanSubsets(FrendaSummary,contrast=simpleBatA2)
plotMeanSubsets(FrendaSummary,contrast=simpleBatA2,labels=c("Sleep","NoSleep"),main="Simple Effect of B at A2",ylab="False Memory",ylim=c(0,4),values=FALSE)
estimateStandardizedMeanContrast(FrendaSummary,contrast=simpleBatA2)

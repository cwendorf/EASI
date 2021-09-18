# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

## Factorial Between-Subjects Example with Frenda Summary Statistics

### Data Management

EveningSleep <- c(N=26,M=1.50,SD=1.38)
EveningNosleep <- c(N=26,M=1.14,SD=0.96)
MorningSleep <- c(N=25,M=1.38,SD=1.50)
MorningNosleep <- c(N=26,M=2.22,SD=1.68)
FrendaSummary <- rbind(EveningSleep,EveningNosleep,MorningSleep,MorningNosleep)
class(FrendaSummary) <- "bss"

### Analyses of the Different Groups

estimateMeans(FrendaSummary)
plotMeans(FrendaSummary,ylab="False Memory")

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

#### Analyses of the Factor A (Evening vs Morning) Main Effect

mainFactorA <- c(-.5,-.5,.5,.5)
plotMeanSubsets(FrendaSummary,contrast=mainFactorA,labels=c("Evening","Morning"),main="Factor A Main Effect",ylab="False Memory")
testMeanContrast(FrendaSummary,contrast=mainFactorA)
estimateStandardizedMeanContrast(FrendaSummary,contrast=mainFactorA)

#### Analyses of the Factor B (Sleep vs NoSleep) Main Effect

mainFactorB <- c(-.5,.5,-.5,.5)
plotMeanSubsets(FrendaSummary,contrast=mainFactorB,labels=c("Sleep","NoSleep"),main="Factor B Main Effect",ylab="False Memory")
testMeanContrast(FrendaSummary,contrast=mainFactorB)
estimateStandardizedMeanContrast(FrendaSummary,contrast=mainFactorB)

### Analyses of the Interaction

Interaction <- c(1,-1,-1,1)
estimateMeanContrast(FrendaSummary,contrast=Interaction)
testMeanContrast(FrendaSummary,contrast=Interaction)

#### Analyses of the Factor B (Sleep vs NoSleep) at A1 (Evening) Simple Effect

simpleBatA1 <- c(-1,1,0,0)
plotMeanSubsets(FrendaSummary,contrast=simpleBatA1,labels=c("Sleep","NoSleep"),main="Simple Effect of B at A1",ylab="False Memory")
testMeanContrast(FrendaSummary,contrast=simpleBatA1)
estimateStandardizedMeanContrast(FrendaSummary,contrast=simpleBatA1)

#### Analyses of the Factor B (Sleep vs NoSleep) at A2 (Morning) Simple Effect

simpleBatA2 <- c(0,0,-1,1)
plotMeanSubsets(FrendaSummary,contrast=simpleBatA2,labels=c("Sleep","NoSleep"),main="Simple Effect of B at A2",ylab="False Memory")
testMeanContrast(FrendaSummary,contrast=simpleBatA2)
estimateStandardizedMeanContrast(FrendaSummary,contrast=simpleBatA2)

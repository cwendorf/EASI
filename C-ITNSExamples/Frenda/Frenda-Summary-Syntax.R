# Estimation Approach to Statistical Inference (EASI)
## Between-Subjects Factorial Example with Frenda Summary Statistics

### Source the EASI Functions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")

### Enter Summary Statistics

EveningSleep <- c(N=26,M=1.50,SD=1.38)
EveningNosleep <- c(N=26,M=1.14,SD=0.96)
MorningSleep <- c(N=25,M=1.38,SD=1.50)
MorningNosleep <- c(N=26,M=2.22,SD=1.68)
FrendaSummary <- rbind(EveningSleep,EveningNosleep,MorningSleep,MorningNosleep)
class(FrendaSummary) <- "bss"
FrendaSummary

### Analyses of the Different Groups

estimateMeans(FrendaSummary)
plotMeans(FrendaSummary) # Frenda-Figure1.jpeg

### Analyses of the Marginal Means

Evening <- c(.5,.5,0,0)
estimateContrast(FrendaSummary,contrast=Evening)
Morning <- c(0,0,.5,.5)
estimateContrast(FrendaSummary,contrast=Morning)
Sleep <- c(.5,0,.5,0)
estimateContrast(FrendaSummary,contrast=Sleep)
Nosleep <- c(0,.5,0,.5)
estimateContrast(FrendaSummary,contrast=Nosleep)

### Analyses of the Factor A (Evening vs Morning) Main Effect

mainFactorA <- c(-.5,-.5,.5,.5)
estimateContrast(FrendaSummary,contrast=mainFactorA)
plotContrast(FrendaSummary,contrast=mainFactorA,labels=c("Evening","Morning")) # Frenda-Figure2.jpeg
testContrast(FrendaSummary,contrast=mainFactorA)
standardizeContrast(FrendaSummary,contrast=mainFactorA)

### Analyses of the Factor B (Sleep vs NoSleep) Main Effect

mainFactorB <- c(-.5,.5,-.5,.5)
estimateContrast(FrendaSummary,contrast=mainFactorB)
plotContrast(FrendaSummary,contrast=mainFactorB,labels=c("Sleep","NoSleep")) # Frenda-Figure3.jpeg
testContrast(FrendaSummary,contrast=mainFactorB)
standardizeContrast(FrendaSummary,contrast=mainFactorB)

### Analyses of the Interaction

Interaction <- c(1,-1,-1,1)
estimateContrast(FrendaSummary,contrast=Interaction)
testContrast(FrendaSummary,contrast=Interaction)
standardizeContrast(FrendaSummary,contrast=Interaction)

### Analyses of the Factor A at Sleep Simple Effect

simpleAatSleep <- c(-1,1,0,0)
estimateContrast(FrendaSummary,contrast=simpleAatSleep)
plotContrast(FrendaSummary,contrast=simpleAatSleep,labels=c("Evening","Morning")) # Frenda-Figure4.jpeg
testContrast(FrendaSummary,contrast=simpleAatSleep)
standardizeContrast(FrendaSummary,contrast=simpleAatSleep)

### Analyses of the Factor A at Nosleep Simple Effect

simpleAatNosleep <- c(0,0,-1,1)
estimateContrast(FrendaSummary,contrast=simpleAatNosleep)
plotContrast(FrendaSummary,contrast=simpleAatNosleep,labels=c("Evening","Morning")) # Frenda-Figure5.jpeg
testContrast(FrendaSummary,contrast=simpleAatNosleep)
standardizeContrast(FrendaSummary,contrast=simpleAatNosleep)

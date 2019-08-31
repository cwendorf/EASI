# Estimation Approach to Statistical Inference (EASI)
## Between-Subjects Factorial Example with Frenda Summary Statistics

### Source the EASI Functions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")

### Enter Summary Statistics

A1B1 <- c(N=26,M=1.50,SD=1.38)
A2B1 <- c(N=25,M=1.38,SD=1.50)
A1B2 <- c(N=26,M=1.14,SD=0.96)
A2B2 <- c(N=26,M=2.22,SD=1.68)
FrendaSummary <- rbind(A1B1,A2B1,A1B2,A2B2)
class(FrendaSummary) <- "bss"
FrendaSummary

### Analyses of the Different Groups

estimateMeans(FrendaSummary)
plotMeans(FrendaSummary)

### Analyses of the Marginal Means

Evening <- c(.5,0,.5,0)
estimateContrast(FrendaSummary,contrast=Evening)
Morning <- c(0,.5,0,.5)
estimateContrast(FrendaSummary,contrast=Morning)
Sleep <- c(.5,.5,0,0)
estimateContrast(FrendaSummary,contrast=Sleep)
Nosleep <- c(0,0,.5,.5)
estimateContrast(FrendaSummary,contrast=Nosleep)

### Analyses of the Factor A (Evening vs Morning) Main Effect

mainFactorA <- c(.5,-.5,.5,-.5)
estimateContrast(FrendaSummary,contrast=mainFactorA)
plotContrast(FrendaSummary,contrast=mainFactorA)
testContrast(FrendaSummary,contrast=mainFactorA)
standardizeContrast(FrendaSummary,contrast=mainFactorA)

### Analyses of the Factor B (Sleep vs NoSleep) Main Effect

mainFactorB <- c(-.5,-.5,.5,.5)
estimateContrast(FrendaSummary,contrast=mainFactorB)
plotContrast(FrendaSummary,contrast=mainFactorB)
testContrast(FrendaSummary,contrast=mainFactorB)
standardizeContrast(FrendaSummary,contrast=mainFactorB)

### Analyses of the Factor A x B Interaction

Interaction <- c(.5,-.5,-.5,.5)
estimateContrast(FrendaSummary,contrast=Interaction)
plotContrast(FrendaSummary,contrast=Interaction)
testContrast(FrendaSummary,contrast=Interaction)
standardizeContrast(FrendaSummary,contrast=Interaction)

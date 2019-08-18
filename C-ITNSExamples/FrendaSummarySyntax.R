# Estimation Approach to Statistical Inference (EASI)
## Between-Subjects Factorial Example with Frenda Summary Statistics

### Source the EASI Functions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL_EASI_FUNCTIONS.R")

### Enter Summary Statistics

A1B1 <- c(N=26,M=1.50,SD=1.38)
A2B1 <- c(N=25,M=1.38,SD=1.50)
A1B2 <- c(N=26,M=1.14,SD=0.96)
A2B2 <- c(N=26,M=2.22,SD=1.68)
sumstats <- rbind(A1B1,A2B1,A1B2,A2B2)
class(sumstats) <- "bss"
sumstats

### Analyses of the Different Groups

estimateMeans(sumstats)
plotMeans(sumstats)

### Analyses of the Marginal Means

Evening <- c(.5,0,.5,0)
estimateContrast(sumstats,contrast=Evening)
Morning <- c(0,.5,0,.5)
estimateContrast(sumstats,contrast=Morning)
Sleep <- c(.5,.5,0,0)
estimateContrast(sumstats,contrast=Sleep)
Nosleep <- c(0,0,.5,.5)
estimateContrast(sumstats,contrast=Nosleep)

### Analyses of the Factor A (Evening vs Morning) Main Effect

mainFactorA <- c(.5,-.5,.5,-.5)
estimateContrast(sumstats,contrast=mainFactorA)
testContrast(sumstats,contrast=mainFactorA)
plotContrast(sumstats,contrast=mainFactorA)

### Analyses of the Factor B (Sleep vs NoSleep) Main Effect

mainFactorB <- c(-.5,-.5,.5,.5)
estimateContrast(sumstats,contrast=mainFactorB)
testContrast(sumstats,contrast=mainFactorB)
plotContrast(sumstats,contrast=mainFactorB)

### Analyses of the Factor A x B Interaction

Interaction <- c(.5,-.5,-.5,.5)
estimateContrast(sumstats,contrast=Interaction)
testContrast(sumstats,contrast=Interaction)
plotContrast(sumstats,contrast=Interaction)

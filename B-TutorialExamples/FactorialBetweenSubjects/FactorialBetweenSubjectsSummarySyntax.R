# Estimation Approach to Statistical Inference (EASI)
## Factorial Between-Subjects Example with Summary Statistics

### Source the EASI Functions

source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")

### Enter Summary Statistics

A1B1 <- c(N=4,M=2.000,SD=2.449)
A2B1 <- c(N=4,M=6.000,SD=2.449)
A1B2 <- c(N=4,M=7.000,SD=2.449)
A2B2 <- c(N=4,M=5.000,SD=2.449)
FactorialSummary <- rbind(A1B1,A2B1,A1B2,A2B2)
class(FactorialSummary) <- "bss"
FactorialSummary

### Analyses of the Different Groups

estimateMeans(FactorialSummary)
plotMeans(FactorialSummary)

### Analyses of the Marginal Means

A1 <- c(.5,0,.5,0)
estimateContrast(FactorialSummary,contrast=A1)
A2 <- c(0,.5,0,.5)
estimateContrast(FactorialSummary,contrast=A2)
B1 <- c(.5,.5,0,0)
estimateContrast(FactorialSummary,contrast=B1)
B2 <- c(0,0,.5,.5)
estimateContrast(FactorialSummary,contrast=B2)

### Analyses of the Factor A Main Effect

mainFactorA <- c(.5,-.5,.5,-.5)
estimateContrast(FactorialSummary,contrast=mainFactorA)
plotContrast(FactorialSummary,contrast=mainFactorA)
testContrast(FactorialSummary,contrast=mainFactorA)
standardizeContrast(FactorialSummary,contrast=mainFactorA)

### Analyses of the Factor B Main Effect

mainFactorB <- c(-.5,-.5,.5,.5)
estimateContrast(FactorialSummary,contrast=mainFactorB)
plotContrast(FactorialSummary,contrast=mainFactorB)
testContrast(FactorialSummary,contrast=mainFactorB)
standardizeContrast(FactorialSummary,contrast=mainFactorB)

### Analyses of the Factor A x B Interaction

Interaction <- c(.5,-.5,-.5,.5)
estimateContrast(FactorialSummary,contrast=Interaction)
plotContrast(FactorialSummary,contrast=Interaction)
testContrast(FactorialSummary,contrast=Interaction)
standardizeContrast(FactorialSummary,contrast=Interaction)

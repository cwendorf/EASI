# Estimation Approach to Statistical Inference
## Between-Subjects Factorial Example with Frenda Summary Statistics

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
plotMeans(FrendaSummary,ylab="False Memory")

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
plotContrast(FrendaSummary,contrast=mainFactorA,labels=c("Evening","Morning"),ylab="False Memory")
testContrast(FrendaSummary,contrast=mainFactorA)
standardizeContrast(FrendaSummary,contrast=mainFactorA)

### Analyses of the Factor B (Sleep vs NoSleep) Main Effect

mainFactorB <- c(-.5,.5,-.5,.5)
estimateContrast(FrendaSummary,contrast=mainFactorB)
plotContrast(FrendaSummary,contrast=mainFactorB,labels=c("Sleep","NoSleep"),ylab="False Memory")
testContrast(FrendaSummary,contrast=mainFactorB)
standardizeContrast(FrendaSummary,contrast=mainFactorB)

### Analyses of the Interaction

Interaction <- c(1,-1,-1,1)
estimateContrast(FrendaSummary,contrast=Interaction)
testContrast(FrendaSummary,contrast=Interaction)

### Analyses of the Factor B (Sleep vs NoSleep) at A1 (Evening) Simple Effect

simpleBatEvening <- c(-1,1,0,0)
estimateContrast(FrendaSummary,contrast=simpleBatEvening)
plotContrast(FrendaSummary,contrast=simpleBatEvening,labels=c("Sleep","NoSleep"),ylab="False Memory")
testContrast(FrendaSummary,contrast=simpleBatEvening)
standardizeContrast(FrendaSummary,contrast=simpleBatEvening)

### Analyses of the Factor B (Sleep vs NoSleep) at A2 (Morning)  Simple Effect

simpleBatMorning <- c(0,0,-1,1)
estimateContrast(FrendaSummary,contrast=simpleBatMorning)
plotContrast(FrendaSummary,contrast=simpleBatMorning,labels=c("Sleep","NoSleep"),ylab="False Memory")
testContrast(FrendaSummary,contrast=simpleBatMorning)
standardizeContrast(FrendaSummary,contrast=simpleBatMorning)

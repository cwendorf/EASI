# Estimation Approach to Statistical Inference
## Relational Intervals - OneWay (Between-Subjects) Tutorial with Summary Statistics

### Enter Summary Statistics

Level1 <- c(N=4,M=2.000,SD=2.449)
Level2 <- c(N=4,M=6.000,SD=2.449)
Level3 <- c(N=4,M=7.000,SD=2.449)
OneWaySummary <- rbind(Level1,Level2,Level3)
class(OneWaySummary) <- "bss"
OneWaySummary

### Relational Intervals

estimateRelational(OneWaySummary)

plotMeans(OneWaySummary)
addRelational(OneWaySummary)

plotRelational(OneWaySummary)
plotRelational(OneWaySummary,conf.level=.99,mu=70)

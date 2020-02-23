# Estimation Approach to Statistical Inference
## Pairwise Comparisons - OneWay (Between-Subjects) Tutorial with Data

### Enter Data

Factor <- c(rep(1,4),rep(2,4),rep(3,4))
Outcome <- c(0,0,3,5,4,7,4,9,9,6,4,9)
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Level1","Level2","Level3"))

OneWayData <- data.frame(Factor,Outcome)
OneWayData

### Analyses of Pairwise Comparisons

#### Confidence Intervals for the Pairwise Comparisons

estimatePairwise(Outcome~Factor)
estimatePairwise(Outcome~Factor,conf.level=.99)

#### Plots of the Confidence Intervals for the Pairwise Comparisons

plotPairwise(Outcome~Factor)
plotPairwise(Outcome~Factor,mu=-2,conf.level=.99,rope=c(-4,0))

#### Significance Tests of the Pairwise Comparisons

testPairwise(Outcome~Factor)
testPairwise(Outcome~Factor,mu=-2)

#### Effect Sizes for the Pairwise Comparisons

standardizePairwise(Outcome~Factor)
standardizePairwise(Outcome~Factor,conf.level=.99)

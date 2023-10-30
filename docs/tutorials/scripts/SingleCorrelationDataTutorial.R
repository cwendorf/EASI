# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

## Single Correlation Data Tutorial

### Data Management

#### Data Entry

Outcome1 <- c(0, 0, 3, 5)
Outcome2 <- c(4, 7, 4, 9)
PairedData <- data.frame(Outcome1, Outcome2)

#### Plot of the Data

plotScatter(PairedData)
plotScatter(PairedData, ellipse = TRUE)
plotScatter(PairedData, ellipse = TRUE, conf.level = .99)

#### Descriptive Statistics

describeMeans(PairedData)
describeCorrelations(PairedData)

### Analyses of a Correlation

#### Confidence Interval

estimateCorrelations(PairedData)
plotCorrelations(PairedData)

estimateCorrelations(PairedData, conf.level = .99)
plotCorrelations(PairedData, conf.level = .99, line = 0, rope = c(-.2, .2))

#### Significance Test

testCorrelations(PairedData)

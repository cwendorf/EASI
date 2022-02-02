# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

## BodyWell Regression Data Example

### Data Management

#### Data Entry

BodySatisfaction <- c(4,2.4,3,3,3.1,2.4,2.9,3.1,3,3.3,2,3.1,2.4,3.1,3.3,3.4,3.3,3.6,2.7,3.3,3.6,2.3,3.7,4,2.7,3.1,3.3,3.4,4.4,3.3,3.3,4,4.1,3.3,3.6,3.9,4,5,3,3,3.3,3.9,3.9,4.7,5,2.6,2.9,3.4,3.4,3.9,4.3,2.6,3.1,3.4,3.7,4,4.1,4,5,4,2.4,3.7,3,3.6,2.9,2.7,3.3,4.3,3.1,4.3,4.4,4,3.3,3.7,2.9,3.4,3.6,4.7,4.1,3,4.1,3.7,4.1,4,3.1,3.7,3.3,4.4,4.3,4,4,4,3.4,4.9,3.7,3.3,3.9,4.6,4,3.9,4.7,4.3,4.4,4.4,4.6,4.3)
Wellbeing <- c(1,2.4,2.3,2.4,2.8,3.2,3.4,3.4,3.6,3.6,3.8,3.8,4,4,4.2,4.2,4.4,4.4,4.6,4.6,4.6,4.8,4.8,4.8,5,5,5,5,5,5.2,5.3,5.2,5.2,5.6,5.6,5.6,5.6,5.6,5.8,5.7,5.8,5.8,5.9,5.8,5.8,6,6,6,6.1,6,6,6.2,6.2,6.2,6.4,6.4,6.4,6.6,7,2.8,3,3.2,3.2,3.4,3.4,3.8,4.2,4.4,4.4,4.6,4.6,4.6,4.8,4.8,4.8,5,5,5.2,5.2,5.4,5.6,5.6,5.5,5.6,5.6,5.7,5.6,5.6,5.6,5.8,5.8,6,6,6,6,6,6,6,6.1,6.2,6.2,6.2,6.2,6.4,6.6,7)
BodyWellOneData <- data.frame(BodySatisfaction,Wellbeing)

#### Descriptive Statistics

describeMeans(BodyWellOneData)
describeCorrelations(BodyWellOneData)

### Analyses of the Regression Line

plotRegression(BodyWellOneData,interval="none",xlim=c(1,5),points=TRUE)

estimateRegressionCoefficients(BodyWellOneData)
plotRegressionCoefficients(BodyWellOneData)

### Analyses of Regression Values

estimateRegression(BodyWellOneData,value=2)
plotRegression(BodyWellOneData,interval="both",value=2,xlim=c(1,5))

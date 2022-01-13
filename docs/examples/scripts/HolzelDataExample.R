# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

## Holzel Data Example

### Data Management

Group <- c("Control","Control","Control","Control","Control","Control","Control","Control","Control","Control","Control","Control","Control","Control","Control","Control","Control","Meditation","Meditation","Meditation","Meditation","Meditation","Meditation","Meditation","Meditation","Meditation","Meditation","Meditation","Meditation","Meditation","Meditation","Meditation","Meditation")
Pretest <- c(48.261,42.745,46.222,46.889,43.752,36.928,52.026,39.739,45.503,45.386,44.745,31.725,40.562,39.216,46.771,48.314,46.065,43.072,41.922,48.366,49.725,40.013,39.673,38.405,52.51,41.281,42.157,41.281,57.843,41.935,45.281,29.673,46.144)
Posttest <- c(50.026,41.137,45.542,48.261,45.242,33.621,53.634,40.275,43.595,46.235,45.621,32.092,40.588,39.987,47.19,47.137,46.654,42.549,41.974,49.882,50.967,41.059,41.569,40.418,54.078,43.046,43.333,41.333,58,42.471,45.83,31.137,47.007)
HolzelData <- data.frame(Group,Pretest,Posttest)

HolzelSubsetControl <- subset(HolzelData,Group=="Control")
HolzelSubsetMeditation <- subset(HolzelData,Group=="Meditation")

### Analyses of the Differences within Conditions

with(HolzelSubsetControl,plotMeanComparison(Pretest,Posttest,main="Pretest vs Posttest for the Control Group",ylab="Gray Matter"))
with(HolzelSubsetMeditation,plotMeanComparison(Pretest,Posttest,main="Pretest vs Posttest for the Meditation Group",ylab="Gray Matter"))

with(HolzelSubsetControl,estimateStandardizedMeanDifference(Pretest,Posttest))
with(HolzelSubsetMeditation,estimateStandardizedMeanDifference(Pretest,Posttest))

# ESTIMATION APPROACH TO STATISTICAL INFERENCE
## Relational Intervals Example with Repeated Measures Data
### Extension of Wendorf, C. A. (2012). Drawing inferences from multiple intervals in the single-factor design Derivations, clarifications, extensions, and representations. Methodology European Journal of Research Methods for the Behavioral and Social Sciences, 8, 125-133. https://doi.org10.10271614-2241a000045

### Source the EASI Package
#### Installable Package Available at https://github.com/cwendorf/EASI/

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")


### Data Management

Outcome1 <-c(61,64,72,64,64,70,73,65,65,72)
Outcome2 <- c(69,74,79,69,64,64,69,69,74,79)
Outcome3 <- c(70,75,80,80,70,65,70,75,70,70) 
Outcome4 <- c(70,80,85,75,70,65,75,75,85,80)
Outcome5 <- c(65,55,70,65,65,70,70,60,65,70)
RepeatedData <- data.frame(Outcome1,Outcome2,Outcome3,Outcome4,Outcome5)

### Conduct Analyses

#### Provide Descriptive Statistics and ANOVA Source Table
describeMeans(RepeatedData)
describeMeansOmnibus(RepeatedData)
testMeansOmnibus(RepeatedData)

#### Provide and Plot Estimates of the Arelational and Relational Intervals
estimateMeansRelational(RepeatedData)
plotMeansRelational(RepeatedData)

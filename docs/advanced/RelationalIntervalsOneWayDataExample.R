# ESTIMATION APPROACH TO STATISTICAL INFERENCE
## Relational Intervals Example with One Way Data
### Code for Wendorf, C. A. (2012). Drawing inferences from multiple intervals in the single-factor design Derivations, clarifications, extensions, and representations. Methodology European Journal of Research Methods for the Behavioral and Social Sciences, 8, 125-133. https://doi.org10.10271614-2241a000045

### Source the EASI Package
#### Installable Package Available at https://github.com/cwendorf/EASI/

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")


### Data Management

Group <- c(rep(1,10),rep(2,10),rep(3,10),rep(4,10),rep(5,10))
Outcome <- c(61,64,72,64,64,70,73,65,65,72,69,74,79,69,64,64,69,69,74,79,70,75,80,80,70,65,70,75,70,70,70,80,85,75,70,65,75,75,85,80,65,55,70,65,65,70,70,60,65,70)
Group <- factor(Group,levels=c(1,2,3,4,5),labels=c("Group1","Group2","Group3","Group4","Group5"))

### Conduct Analyses

#### Provide Descriptive Statistics and ANOVA Source Table
describeMeans(Outcome~Group)
describeMeansOmnibus(Outcome~Group)
testMeansOmnibus(Outcome~Group)

#### Provide and Plot Estimates of the Arelational and Relational Intervals
estimateMeansRelational(Outcome~Group)
plotMeansRelational(Outcome~Group)

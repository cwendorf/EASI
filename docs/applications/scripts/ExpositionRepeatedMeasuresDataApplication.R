# Estimation Approach to Statistical Inference
## Exposition Repeated Measures Data Applications

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/EASI/main/source-EASI.R")

### Data Management

RepeatedData <- data.frame(Outcome1=round(rnorm(50,mean=7,sd=2),0),
                          Outcome2=round(rnorm(50,mean=11,sd=4),0),
                          Outcome3=round(rnorm(50,mean=12,sd=4),0))

### Using the Exposition Operator

with(RepeatedData,estimateMeans(RepeatedData))

RepeatedData %$>% cbind(Outcome1,Outcome2) |> estimateMeans()
RepeatedData %$>% cbind(Outcome1,Outcome2) |> plotMeans()

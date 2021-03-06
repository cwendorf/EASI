# Estimation Approach to Statistical Inference

source("http://raw.githubusercontent.com/cwendorf/EASI/main/sourceEASI.R")

## Independent Groups Example with PenLaptop Data

### PenLaptop1 Sample

Group <- c(rep(1,34),rep(2,31))
Transcription <- c(12.1,6.5,8.1,7.6,12.2,10.8,1,2.9,14.4,8.4,17.7,20.1,2.1,11.1,11.2,10.7,1.9,5.2,9.7,5.2,2.4,7.1,8.7,8,11.3,8.5,9.1,4.5,9.2,13.3,18.3,2.8,5.1,12.4,13.7,21.1,15.2,30.4,12.8,9.6,9.3,17.7,15.4,8.7,12.8,10.6,5.1,16.7,17.7,8.7,26.4,18,19,16.9,18.8,8.5,1.2,11.5,21.4,10.3,9,12.8,12,34.7,4.1)
Group <- factor(Group,levels=c(1,2),labels=c("Pen","Laptop"))

plotMeanComparison(Transcription~Group,main="Transcription as a Function of Note Taking",ylab="Transcription %")
estimateStandardizedMeanDifference(Transcription~Group)

### PenLaptop2 Sample

Group <- c(rep(1,48),rep(2,103))
Transcription <- c(8.99,1.35,8.22,4.31,6.59,16,5.85,6.64,5.54,4.02,3.73,3.81,13.33,5.31,18.03,5.44,7.06,15.38,4.55,12.5,1.33,4.21,6.63,5.56,2.67,5.29,18.18,10.48,4.04,2.94,2.84,3.55,6.25,10.23,1,8,4.69,5.17,5.63,10.12,13.21,8.38,3.82,3.7,7.83,3.66,9.06,5.16,24.82,11.76,12.72,14.19,10.86,20.09,7.66,15.72,15.96,11.27,12.5,5.92,8.71,9.31,20.89,15.49,17.68,12.21,8,13.43,19.63,18.08,8.16,10,16.05,5.19,10.14,2.37,9.64,20,14.45,12.41,3.57,4.78,17.83,7.97,13.18,13.64,10.19,15.89,6.6,7.81,10.9,21.63,6.36,16.96,8.4,7.75,8.79,9.77,10.22,8.28,21.43,6.25,10.61,3.41,15.29,10.28,18.9,17.69,9.28,27.03,7.69,8.29,15.85,22.54,10.77,0.56,9.82,14.2,11.11,16.14,4.41,5.97,18.42,16.9,7.14,16.85,1.92,9.57,23.69,22.64,9.92,8.98,11.23,9.17,14.29,12.95,13.74,9.66,11.43,11.35,6.25,9.45,13.39,4.07,11.4,11.51,12.88,5.64,7.78,26.77,12.69)
Group <- factor(Group,levels=c(1,2),labels=c("Pen","Laptop"))

plotMeanComparison(Transcription~Group,main="Transcription as a Function of Note Taking",ylab="Transcription %")
estimateStandardizedMeanDifference(Transcription~Group)

### PenLaptop3 Sample

Group <- c(rep(1,54),rep(2,55))
Transcription <- c(5.13,0.5,1.37,1.37,5.82,5.24,3.97,2.14,4,4.36,8.61,1.26,4.95,6.7,8.59,8.18,8.91,4.51,3.01,3.13,6.43,5.32,1.19,4.52,2.61,3.61,4.97,0.34,5.38,0,6.2,2.44,1.96,1.19,6.42,2.55,2.26,3.66,2.75,6.3,1.63,3.29,6.09,2.55,9.09,3.49,9.98,1.11,1.75,6.23,8.78,4.82,2.15,2.82,4.62,14.95,5.24,15.28,13.93,8.04,21.81,11.36,18.41,11.39,22.61,19.91,11.33,16.31,6.95,9.9,11.06,10.71,15.32,16.5,24.98,4.8,10.5,5.26,9.2,13.9,13.39,7.78,13.82,3.2,5.65,11.3,9.61,6.23,5.91,17.86,2.07,20.21,23.86,13.28,5.86,11.71,12.69,10.86,7.12,8.33,2.44,9.86,22.53,13.2,11.89,7.47,14.16,7.11,5.52)
Group <- factor(Group,levels=c(1,2),labels=c("Pen","Laptop"))

plotMeanComparison(Transcription~Group,main="Transcription as a Function of Note Taking",ylab="Transcription %")
estimateStandardizedMeanDifference(Transcription~Group)

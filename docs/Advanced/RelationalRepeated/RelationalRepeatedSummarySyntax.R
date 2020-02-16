# Estimation Approach to Statistical Inference
## Relational Intervals - Repeated (Within-Subjects) Example with Wendorf Summary Statistics

### Enter Summary Statistics

L1 <- c(N=10,M=67.000,SD=4.295)
L2 <- c(N=10,M=71.000,SD=5.375)
L3 <- c(N=10,M=72.500,SD=4.859)
L4 <- c(N=10,M=76.000,SD=6.583)
L5 <- c(N=10,M=65.500,SD=4.972)
RelationalRepeatedSummary <- rbind(L1,L2,L3,L4,L5)
class(RelationalRepeatedSummary) <- "wss"
RelationalRepeatedSummary

RelationalRepeatedCorr <- declareCorrMatrix("L1","L2","L3","L4","L5")
RelationalRepeatedCorr["L1",] <- c(1.000,0.362,-0.106,0.216,0.702)
RelationalRepeatedCorr["L2",] <- c(0.362,1.000,0.425,0.879,0.062)
RelationalRepeatedCorr["L3",] <- c(-0.106,0.425,1.000,0.521,-0.287)
RelationalRepeatedCorr["L4",] <- c(0.216,0.879,0.521,1.000,-0.102)
RelationalRepeatedCorr["L5",] <- c(0.702,0.062,-0.287,-0.102,1.000)
RelationalRepeatedCorr

### Relational Intervals

estimateRelational(RelationalRepeatedSummary,RelationalRepeatedCorr)

plotMeans(RelationalRepeatedSummary) # RelationalRepeated-Figure1.jpeg
addRelational(RelationalRepeatedSummary,RelationalRepeatedCorr)# RelationalRepeated-Figure2.jpeg

plotRelational(RelationalRepeatedSummary,RelationalRepeatedCorr) # RelationalRepeated-Figure4.jpeg
plotRelational(RelationalRepeatedSummary,RelationalRepeatedCorr,conf.level=.99,mu=70) # RelationalRepeated-Figure5.jpeg

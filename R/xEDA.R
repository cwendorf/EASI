# Estimation Approach to Statistical Inference
## Exploratory Data Analysis

### Plots

plotViolins <- function(...,main=NULL,col="black") {
  if(is.null(main)) main="Violin Plots"
  plotBoxes(...,values=FALSE,main=main,col=col)
  plotDensity(...,add=TRUE,offset=0,type="full",col=col)  
}

plotBeans <- function(...,main=NULL,col="black") {
  if(is.null(main)) main="Bean Plots"
  plotDensity(...,main=main,type="full",offset=0,col=col)
  plotData(...,add=TRUE,offset=0,pch=95,col=col)
}

plotRainclouds <- function(...,main=NULL,col="black") {
  if(is.null(main)) main="Raincloud Plots"
  plotBoxes(...,main=main,values=FALSE,col=col)
  plotDensity(...,add=TRUE,offset=.1,col=col)
  plotData(...,add=TRUE,method="jitter",offset=-.15,col=col)
}

plotCombination <- function(...,main=NULL,col="black") {
  if(is.null(main)) main="Combination Plots"
  plotBoxes(...,main=main,col=col)
  plotDensity(...,add=TRUE,offset=.1,col=col)
  plotData(...,add=TRUE,offset=.12,col=col)
}

# Estimation Approach to Statistical Inference
## Add to Plot Functions

### Functions to Add Elements to Plots

addData <- function(...) {
  plotData(...,add=TRUE)
}

addFrequencies <- function(...) {
  plotFrequencies(...,add=TRUE)
}

addBoxes <- function(...) {
  plotBoxes(...,add=TRUE)
}

addDensity <- function(...) {
  plotDensity(...,add=TRUE)
}

addMeans <- function(...) {
  plotMeans(...,add=TRUE)
}

addIntervals <- function(...) {
  plotIntervals(...,add=TRUE)
}

addDiamonds <- function(...) {
  plotDiamonds(...,add=TRUE)
}

addPlausible <- function(...) {
  plotPlausible(...,add=TRUE)
}

addScatter <- function(...) {
  plotScatter(...,add=TRUE)
}

addRegression <- function(...) {
  plotRegression(...,add=TRUE)
}

# Estimation Approach to Statistical Inference
## Exploratory Data Analysis

### Plots

plotViolins <- function(..., main = NULL, col = "black") {
  if (is.null(main)) main <- "Violin Plots"
  plotDensity(..., main = main, offset = 0, type = "full", col = col)
  plotBoxes(..., add = TRUE, values = FALSE, col = col)
}

plotBeans <- function(..., main = NULL, col = "black") {
  if (is.null(main)) main <- "Bean Plots"
  plotDensity(..., main = main, type = "full", offset = 0, col = col)
  plotData(..., add = TRUE, offset = 0, pch = 95, col = col, method = "overplot")
}

plotRainclouds <- function(..., main = NULL, col = "black") {
  if (is.null(main)) main <- "Raincloud Plots"
  plotDensity(..., main = main, offset = .1, col = col)
  plotBoxes(..., add = TRUE, values = FALSE, col = col)
  plotData(..., add = TRUE, method = "jitter", offset = -.15, col = col)
}

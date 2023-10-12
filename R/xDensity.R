# Estimation Approach to Statistical Inference
## Density Plots

### Density Plot

plotDensity <- function(x, ...)
  UseMethod("plotDensity")

plotDensity.default <- function(frame, type = "right", add = FALSE, main = NULL, ylab = "Outcome", xlab = "", ylim = NULL, offset = .1, scale = 1, col = "black", ...) {
  data <- data.frame(frame)
  if (ncol(data) == 1) {colnames(data) <- deparse(substitute(frame))}
  z <- apply(data, 2, density)
  if (!add) {
    if (is.null(main)) {main <- "Density Plots for the Variables"}
    a <- sapply(z, "[", "x")
    b <- lapply(a, function(x) c(min(x), max(x)))
    results <- data.frame(matrix(unlist(b),  nrow = length(b),  byrow = TRUE))
    rownames(results) <- names(z)
    results <- list(results)
    .plotMain(results, main = main, ylab = ylab, xlab = xlab, ylim = ylim)}
  invisible(mapply(.plotCurve, z, loc = 1:length(data), type = type, offset = offset, scale = scale, col = col))
  invisible(eval(frame))
}

plotDensity.formula <- function(formula, type = "right", add = FALSE, main = NULL, ylab = "Outcome", xlab = "", ylim = NULL, offset = .1, scale = 1, col = "black", ...) {
  data <- unstack(model.frame(formula))
  if (typeof(data) == "list") {z <- lapply(data, density)} else {z <- apply(data, 2, density)}
  if (!add) {
    if (is.null(main)) {main <- "Density Plots for the Groups"}
    a <- sapply(z, "[", "x")
    b <- lapply(a, function(x) c(min(x), max(x)))
    results <- data.frame(matrix(unlist(b),  nrow = length(b),  byrow = TRUE))
    rownames(results) <- names(z)
    results <- list(results)
    .plotMain(results, main = main, ylab = ylab, xlab = xlab, ylim = ylim)}
  invisible(mapply(.plotCurve, z, loc = 1:length(data), type = type, offset = offset, scale = scale, col = col))
  invisible(eval(formula))
}

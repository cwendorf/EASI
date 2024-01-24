
# Estimation Approach to Statistical Inference
## Density

### Plot

plot.curve <- function(dens, loc, type = NULL, offset = .1, scale = 1, col = "black") {
  y1 <- loc + (dens$y * scale) + offset
  y2 <- loc - (dens$y * scale) + offset
  if (type == "full") polygon(c(y1, rev(y2)), c(dens$x, rev(dens$x)), border = .colorTransparent(col, 50), col = .colorTransparent(col, 30))
  if (type == "right") polygon(c(y1, seq(from = loc + offset, to = loc + offset, length.out = length(y1))), c(dens$x, rev(dens$x)), border = .colorTransparent(col, 50), col = .colorTransparent(col, 30))
  if (type == "left") polygon(c(y2, seq(from = loc + offset, to = loc + offset, length.out = length(y2))), c(dens$x, rev(dens$x)), border = .colorTransparent(col, 50), col = .colorTransparent(col, 30))
}

plotDensity <- function(x, ...) {
  UseMethod("plotDensity")
}

plotDensity.data.frame <- function(frame, type = "right", add = FALSE, main = NULL, ylab = "Outcome", xlab = "", ylim = NULL, offset = .1, scale = 1, col = "black", ...) {
  data <- data.frame(frame)
  z <- apply(data, 2, density)
  if (!add) {
    if (is.null(main)) {
      main <- "Density Plots for the Variables"
    }
    a <- sapply(z, "[", "x")
    b <- lapply(a, function(x) c(min(x), max(x)))
    results <- data.frame(matrix(unlist(b), nrow = length(b), byrow = TRUE))
    rownames(results) <- names(z)
    plot.main(results, main = main, ylab = ylab, xlab = xlab, ylim = ylim)
  }
  if (length(col) > length(data)) {
    col <- col[1:length(data)]
  }
  invisible(mapply(plot.curve, z, loc = 1:length(data), type = type, offset = offset, scale = scale, col = col))
  invisible(eval(frame))
}

plotDensity.formula <- function(formula, type = "right", add = FALSE, main = NULL, ylab = "Outcome", xlab = "", ylim = NULL, offset = .1, scale = 1, col = "black", ...) {
  data <- unstack(data.frame(model.frame(formula)))
  if (typeof(data) == "list") {
    z <- lapply(data, density)
  } else {
    z <- apply(data, 2, density)
  }
  if (!add) {
    if (is.null(main)) {
      main <- "Density Plots for the Groups"
    }
    a <- sapply(z, "[", "x")
    b <- lapply(a, function(x) c(min(x), max(x)))
    results <- data.frame(matrix(unlist(b), nrow = length(b), byrow = TRUE))
    rownames(results) <- names(z)
    plot.main(results, main = main, ylab = ylab, xlab = xlab, ylim = ylim)
  }
  if (length(col) > length(data)) {
    col <- col[1:length(data)]
  }
  invisible(mapply(plot.curve, z, loc = 1:length(data), type = type, offset = offset, scale = scale, col = col))
  invisible(eval(formula))
}

addDensity <- function(...) {
  plotDensity(..., add = TRUE)
}

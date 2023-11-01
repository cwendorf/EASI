# Estimation Approach to Statistical Inference
## Standard Deviations

### Descriptives

.describeSummary <- function(x, ...) {
  UseMethod(".describeMeans")
}

describeSummary <- describeMeans

### Plots

.deviations <- function(results, main, ylab, xlab, ylim, values, digits, pos, pch, add, col, offset) {
  results <- .unformatFrame(results[[1]])
  coords <- cbind(results[, 2], results[, 2] - results[, 3], results[, 2] + results[, 3], 2, 2, 0)
  if (!add) {
    if (is.null(ylim)) {
      ylim <- range(pretty(c(floor(min(coords[, 1:3]) - .5), ceiling(max(coords[, 1:3]) + .5))))
    }
    plot(NULL, xaxs = "i", yaxs = "i", xaxt = "n", xlim = c(.4, nrow(results) + .6), ylim = ylim, xlab = xlab, cex.lab = 1.15, ylab = ylab, main = main, las = 1, bty = "l")
    axis(1, 1:nrow(results), row.names(results))
  }
  points(1:nrow(results) + offset, coords[, 1], pch = pch, cex = 1.5, col = col, lwd = 2, bg = .colorIntensity(col, .6))
  for (i in 1:nrow(results)) {
    if (results[i, 4] > 0) {
      coords[i, 4] <- 1
      coords[i, 6] <- (coords[i, 1] + coords[i, 3]) / 2
    } else if (results[i, 4] < 0) {
      coords[i, 5] <- 1
      coords[i, 6] <- (coords[i, 1] + coords[i, 2]) / 2
    } else if (results[i, 4] == 0) {
      coords[i, 6] <- (coords[i, 1] + coords[i, 3]) / 2
    }
  }
  if (length(col) > nrow(coords)) {
    col <- col[1:nrow(coords)]
  }
  arrows(1:nrow(coords) + offset, coords[, 1], 1:nrow(coords) + offset, coords[, 3], col = col, lty = coords[, 4], lwd = 2, length = .1, angle = 90)
  arrows(1:nrow(coords) + offset, coords[, 1], 1:nrow(coords) + offset, coords[, 2], col = col, lty = coords[, 5], lwd = 2, length = .1, angle = 90)
  if (values) {
    axis(1, 1:nrow(results) + offset, paste("N =", results[, 1]), line = 1, lty = 0)
    coords <- .formatFrame(coords, digits = digits)
    results <- .formatFrame(results, digits = digits)
    text(1:nrow(results) + offset, as.numeric(coords[, 1]), results[, 2], cex = .8, pos = pos, offset = .5, col = col)
    text(1:nrow(results) + offset, as.numeric(coords[, 6]), paste("(", results[, 3], ")", sep = ""), cex = .8, pos = pos, offset = .5, col = col)
  }
}

plotDeviations <- function(x, ...) {
  UseMethod("plotDeviations")
}

plotDeviations.bss <- plotDeviations.wss <- function(x, add = FALSE, main = NULL, ylab = "Outcome", xlab = "", ylim = NULL, offset = 0, col = "black", values = TRUE, digits = 3, pos = 2, pch = 16) {
  results <- describeMeans(x, main = main, digits = digits)
  if (is.null(main)) {
    main <- names(results)
  }
  results[[1]] <- cbind(.unformatFrame(results[[1]]), Skew = 0, Kurt = 0)
  results[[1]] <- .formatFrame(results[[1]], digits = digits)
  .deviations(results, main = main, ylab = ylab, xlab = xlab, ylim = ylim, values = values, digits = digits, pos = pos, pch = pch, add = add, col = col, offset = offset)
  invisible(eval(x))
}

plotDeviations.default <- function(frame, add = FALSE, main = NULL, ylab = "Outcome", xlab = "", ylim = NULL, offset = 0, col = "black", values = TRUE, digits = 3, pos = 2, pch = 16) {
  results <- describeMeans(frame, main = main, digits = digits)
  if (is.null(main)) {
    main <- names(results)
  }
  .deviations(results, main = main, ylab = ylab, xlab = xlab, ylim = ylim, values = values, digits = digits, pos = pos, pch = pch, add = add, col = col, offset = offset)
  invisible(eval(frame))
}

plotDeviations.formula <- function(formula, add = FALSE, main = NULL, ylab = "Outcome", xlab = "", ylim = NULL, offset = 0, col = "black", values = TRUE, digits = 3, pos = 2, pch = 16) {
  results <- describeMeans(formula, main = main, digits = digits)
  if (is.null(main)) {
    main <- names(results)
  }
  .deviations(results, main = main, ylab = ylab, xlab = xlab, ylim = ylim, values = values, digits = digits, pos = pos, pch = pch, add = add, col = col, offset = offset)
  invisible(eval(formula))
}

addDeviations <- function(...) {
  plotDeviations(..., add = TRUE)
}

plotSummary <- plotDeviations
addSummary <- addDeviations

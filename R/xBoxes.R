# Estimation Approach to Statistical Inference
## Boxes

### Describe

describeBoxes <- function(x, ...) {
  UseMethod("describeBoxes")
}

describeBoxes.data.frame <- function(frame, ...) {
  data <- data.frame(frame)
  results <- do.call(rbind, lapply(data, function(x) boxplot.stats(x)$stats))
  colnames(results) <- c("LW", "LH", "Mdn", "UH", "UW")
  class(results) <- "easi.frame"
  comment(results) <- "Boxes for the data"
  return(results)
}

describeBoxes.formula <- function(formula, ...) {
  results <- aggregate(formula, FUN = describeBoxes.data.frame)
  rn <- results[, 1]
  results <- results[[2]]
  rownames(results) <- rn
  colnames(results) <- c("LW", "LH", "Mdn", "UH", "UW")
  class(results) <- "easi.frame"
  comment(results) <- "Boxes for the Data"
  return(results)
}

describeBoxes.default <- function(variable, ...) {
  frame <- data.frame(variable)
  names(frame) <- deparse(substitute(variable))
  describeBoxes(frame, ...)
}

### Plot

plot.boxes <- function(results, main, ylab, xlab, ylim, values, digits, pos, connect, add, col, offset, scale, ...) {
  if (is.null(main)) main <- comment(results)
  results <- unclass(results)
  if (!add) {
    if (is.null(ylim)) {
      ylim <- range(pretty(c(floor(min(results) - .5), ceiling(max(results) + .5))))
    }
    plot(NULL, xaxs = "i", yaxs = "i", xaxt = "n", xlim = c(.4, nrow(results) + .6), ylim = ylim, xlab = xlab, cex.lab = 1.15, ylab = ylab, main = main, las = 1, bty = "l")
    axis(1, seq_len(nrow(results)), row.names(results))
  }
  width <- .03 * scale
  rect(seq_len(nrow(results)) + offset - width, results[, 2], seq_len(nrow(results)) + offset + width, results[, 4], border = col, lwd = 2, col = .colorTransparent(col, 30))
  arrows(seq_len(nrow(results)) + offset, results[, 1], seq_len(nrow(results)) + offset, results[, 2], length = 0, lwd = 2, col = col)
  arrows(seq_len(nrow(results)) + offset, results[, 4], seq_len(nrow(results)) + offset, results[, 5], length = 0, lwd = 2, col = col)
  arrows(seq_len(nrow(results)) + offset - width, results[, 3], seq_len(nrow(results)) + offset + width, results[, 3], length = 0, lwd = 3, col = col)
  arrows(seq_len(nrow(results)) + offset - width, results[, 1], seq_len(nrow(results)) + offset + width, results[, 1], length = 0, lwd = 2, col = col)
  arrows(seq_len(nrow(results)) + offset - width, results[, 5], seq_len(nrow(results)) + offset + width, results[, 5], length = 0, lwd = 2, col = col)
  if (connect) {
    if (nrow(results) > 1) {
      for (i in 1:(nrow(results) - 1)) arrows(i + offset, results[i, 3], i + 1 + offset, results[i + 1, 3], code = 3, length = 0, lty = 1, col = col)
    }
  }
  if (values) {
    results <- .formatFrame(results, digits = digits)
    tweak <- .8 + (scale - 1) / 4
    text(seq_len(nrow(results)) + offset, as.numeric(results[, 1]), results[, 1], cex = .8, pos = pos, offset = tweak, col = col)
    text(seq_len(nrow(results)) + offset, as.numeric(results[, 2]), results[, 2], cex = .8, pos = pos, offset = tweak, col = col)
    text(seq_len(nrow(results)) + offset, as.numeric(results[, 3]), results[, 3], cex = .8, pos = pos, offset = tweak, font = 2, col = col)
    text(seq_len(nrow(results)) + offset, as.numeric(results[, 4]), results[, 4], cex = .8, pos = pos, offset = tweak, col = col)
    text(seq_len(nrow(results)) + offset, as.numeric(results[, 5]), results[, 5], cex = .8, pos = pos, offset = tweak, col = col)
  }
}

plotBoxes <- function(x, ...) {
  UseMethod("plotBoxes")
}

plotBoxes.data.frame <- function(frame, add = FALSE, main = NULL, ylab = "Outcome", xlab = "", ylim = NULL, offset = 0, scale = 1, col = "black", values = TRUE, digits = 3, pos = 2) {
  results <- describeBoxes(frame, main = main, digits = digits)
  plot.boxes(results, main = main, ylab = ylab, xlab = xlab, ylim = ylim, values = values, digits = digits, pos = pos, connect = FALSE, add = add, col = col, offset = offset, scale = scale)
  invisible(eval(frame))
}

plotBoxes.formula <- function(formula, add = FALSE, main = NULL, ylab = "Outcome", xlab = "", ylim = NULL, offset = 0, scale = 1, col = "black", values = TRUE, digits = 3, pos = 2) {
  results <- describeBoxes(formula, main = main, digits = digits)
  plot.boxes(results, main = main, ylab = ylab, xlab = xlab, ylim = ylim, values = values, digits = digits, pos = pos, connect = FALSE, add = add, col = col, offset = offset, scale = scale)
  invisible(eval(formula))
}

plotBoxes.default <- function(variable, ...) {
  frame <- data.frame(variable)
  names(frame) <- deparse(substitute(variable))
  plotBoxes(frame, ...)
}

addBoxes <- function(...) {
  plotBoxes(..., add = TRUE)
}

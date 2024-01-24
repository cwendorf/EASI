# Estimation Approach to Statistical Inference
## Means Relational

### Estimate

estimateRelational <- estimateMeansRelational <- function(x, ...) {
  UseMethod("estimateMeansRelational")
}

estimateMeansRelational.wsm <- function(moments, corrs, conf.level = .95, ...) {
  results <- estimateMeans(moments, conf.level = conf.level)
  mymodel <- describeMeansEffect(moments, corrs)
  dfe <- mymodel[3, 2]
  mse <- mymodel[3, 3]
  ntilde <- 1 / mean(1 / moments[, 1])
  a2 <- sqrt(2 * mse / ntilde)
  a1 <- qt(1 / 2 - conf.level / 2, dfe, lower.tail = FALSE)
  rill <- results[, 1] - a1 * a2 / 2
  riul <- results[, 1] + a1 * a2 / 2
  results <- cbind(results[, 1], rill, riul, results[, c(4, 5)])
  colnames(results) <- c("M", "RI.LL", "RI.UL", "CI.LL", "CI.UL")
  comment(results) <- "Confidence and Relational Intervals for the Means"
  class(results) <- c("easi.frame", "intervals.main")
  return(results)
}

estimateMeansRelational.bsm <- function(moments, conf.level = .95, ...) {
  results <- estimateMeans(moments, conf.level = conf.level)
  mymodel <- describeMeansEffect(moments)
  dfe <- mymodel[2, 2]
  mse <- mymodel[2, 3]
  ntilde <- 1 / mean(1 / moments[, 1])
  a2 <- sqrt(2 * mse / ntilde)
  a1 <- qt(1 / 2 - conf.level / 2, dfe, lower.tail = FALSE)
  rill <- results[, 1] - a1 * a2 / 2
  riul <- results[, 1] + a1 * a2 / 2
  results <- cbind(results[, 1], rill, riul, results[, c(4, 5)])
  colnames(results) <- c("M", "RI.LL", "RI.UL", "CI.LL", "CI.UL")
  comment(results) <- "Confidence and Relational Intervals for the Means"
  class(results) <- c("easi.frame", "intervals.main")
  return(results)
}

estimateMeansRelational.data.frame <- function(frame, conf.level = .95, ...) {
  moments <- describeMoments(frame)
  corrs <- describeCorrelations(frame)
  estimateMeansRelational(moments, corrs, conf.level = conf.level, ...)
}

estimateMeansRelational.formula <- function(formula, conf.level = .95, ...) {
  moments <- describeMoments(formula)
  estimateMeansRelational(moments, conf.level = conf.level, ...)
}

estimateMeansRelational.bsml <- function(moments, ...) {
  iterate(moments, estimateMeansRelational, ...)
}

estimateMeansRelational.wsml <- function(moments, corrs, ...) {
  iterate(moments, corrs, estimateMeansRelational, ...)
}

### Plot

plotRelational <- plotMeansRelational <- function(x, ...) {
  UseMethod("plotMeansRelational")
}

plotMeansRelational.wsm <- plotMeansRelational.wsml <- plotMeansRelational.data.frame <- function(..., add = FALSE, main = NULL, ylab = "Outcome", xlab = "", conf.level = .95, line = NULL, rope = NULL, values = TRUE, pos = 2, pch = 16, connect = TRUE, ylim = NULL, digits = 3, col = "black", border = NA, offset = 0, intervals = TRUE) {
  results <- estimateMeansRelational(..., conf.level = conf.level)
  colnames(results) <- c("Mean", "RI.LL", "RI.UL", "LL", "UL")
  if (!add) {
    plot(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, line = line, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
  }
  rect(1:nrow(results) + offset - .05, results[, 2], 1:nrow(results) + offset + .05, results[, 3], border = border, col = .colorTransparent(col, 50))
}

plotMeansRelational.bsm <- plotMeansRelational.bsml <- plotMeansRelational.formula <- function(..., add = FALSE, main = NULL, ylab = "Outcome", xlab = "", conf.level = .95, line = NULL, rope = NULL, values = TRUE, pos = 2, pch = 16, connect = FALSE, ylim = NULL, digits = 3, col = "black", border = NA, offset = 0, intervals = TRUE) {
  results <- estimateMeansRelational(..., conf.level = conf.level)
  colnames(results) <- c("Mean", "RI.LL", "RI.UL", "LL", "UL")
  if (!add) {
    plot(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, line = line, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
  }
  rect(1:nrow(results) + offset - .05, results[, 2], 1:nrow(results) + offset + .05, results[, 3], border = border, col = .colorTransparent(col, 50))
}

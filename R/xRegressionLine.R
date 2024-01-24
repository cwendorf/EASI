# Estimation Approach to Statistical Inference
## Regression Line

### Estimate

.regression <- function(dM, eR, dRO, value, conf.level) {
  N <- dM[1]
  M <- dM[2]
  SD <- dM[3]
  SSx <- (SD^2) * (N - 1)
  intercept <- eR[1, 1]
  slope <- eR[2, 1]
  MSres <- dRO[2, 3]
  tval <- qt((1 - conf.level) / 2, df = N - 2)
  fit <- slope * value + intercept
  cill <- sqrt(MSres * (1 / N + (value - M)^2 / SSx)) * tval + fit
  ciul <- sqrt(MSres * (1 / N + (value - M)^2 / SSx)) * tval * (-1) + fit
  pill <- sqrt(MSres * (1 + 1 / N + (value - M)^2 / SSx)) * tval + fit
  piul <- sqrt(MSres * (1 + 1 / N + (value - M)^2 / SSx)) * tval * (-1) + fit
  results <- cbind(Est = fit, CI.LL = cill, CI.UL = ciul, PI.LL = pill, PI.UL = piul)
  rownames(results) <- value
  comment(results) <- "Confidence and Prediction Intervals for the Regression"
  class(results) <- "easi.frame"
  return(results)
}

estimateLine <- estimateRegressionLine <- function(x, ...) {
  UseMethod("estimateRegressionLine")
}

estimateRegressionLine.wsm <- function(moments, corrs, y = NULL, value = NULL, conf.level = .95, ...) {
  if (!is.null(y)) {
    rn <- rownames(moments)
    ri <- which(rn == deparse(substitute(y)))
    rn <- c(rn[-ri], rn[ri])
    moments <- moments[rn, ]
    class(moments) <- "wsm"
    corrs <- corrs[rn, rn]
  }
  dM <- moments[1, ]
  eR <- estimateRegressionCoefficients(moments, corrs)
  dRO <- describeRegressionModel(moments, corrs)
  .regression(dM, eR, dRO, value = value, conf.level = conf.level)
}

estimateRegressionLine.data.frame <- function(frame, y = NULL, value = NULL, conf.level = .95, ...) {
  frame <- data.frame(frame)
  if (!is.null(y)) {
    cn <- colnames(frame)
    ci <- which(cn == deparse(substitute(y)))
    cn <- c(cn[-ci], cn[ci])
    frame <- frame[, cn]
  }
  dM <- describeMoments(frame)[1, ]
  eR <- estimateRegressionCoefficients(frame)
  dRO <- describeRegressionModel(frame)
  .regression(dM, eR, dRO, value = value, conf.level = conf.level)
}

### Plot

.prediction <- function(intervals, results = NULL, interval = FALSE, values = TRUE, conf.level = .95, digits = 3, col = "black") {
  newx <- as.numeric(rownames(intervals))
  if (interval == "prediction" || interval == "both") {
    lines(newx, intervals[,4], col = .colorTransparent(col, 100), lty = 2)
    lines(newx, intervals[,5], col = .colorTransparent(col, 100), lty = 2)
  }
  if (interval == "confidence" || interval == "both") {
    lines(newx, intervals[,2], col = .colorTransparent(col, 200), lty = 2)
    lines(newx, intervals[,3], col = .colorTransparent(col, 200), lty = 2)
  }
  if (!is.null(results)) {
    value <- as.numeric(rownames(results))
    labels <- .formatFrame(unclass(results), digits = digits)
    if (interval == "confidence" || interval == "prediction" || interval == "both") {
      if (values) text(value, results[1], labels[1], cex = .8, pos = 2, offset = .5, font = 2, col = col)
    }
    if (interval == "confidence" || interval == "both") {
      lines(x = c(value, value), y = c(results[2], results[3]), lwd = 2, col = col)
      if (values) {
        for (i in 2:3) text(value, results[i], labels[i], cex = .8, pos = 2, offset = .5, font = 2, col = col)
      }
    }
    if (interval == "prediction" || interval == "both") {
      lines(x = c(value, value), y = c(results[4], results[5]), lwd = 1, col = col)
      if (values) {
        for (i in 4:5) text(value, results[i], labels[i], cex = .8, pos = 2, offset = .5, font = 2, col = col)
      }
    }
  }
}

plotLine <- plotRegressionLine <- function(x, ...) {
  UseMethod("plotRegressionLine")
}

plotRegressionLine.wsm <- function(moments, corrs, y = NULL, line = TRUE, value = NULL, range = NULL, interval = FALSE, values = TRUE, conf.level = .95, xlim = NULL, ylim = NULL, main = "Regression Plot for the Variables", ylab = NULL, xlab = NULL, pch = 16, points = FALSE, cross = FALSE, digits = 3, col = "black", add = FALSE, ...) {
  if (!is.null(y)) {
    rn <- rownames(moments)
    ri <- which(rn == deparse(substitute(y)))
    rn <- c(rn[-ri], rn[ri])
    moments <- moments[rn, ]
    class(moments) <- "wsm"
    corrs <- corrs[rn, rn]
  }
  if (is.null(xlab)) {
    xlab <- rownames(moments)[1]
  }
  if (is.null(ylab)) {
    ylab <- rownames(moments)[2]
  }
  if (is.null(xlim)) {
    xmin <- moments[1, "M"] - 2 * moments[1, "SD"]
    xmax <- moments[1, "M"] + 2 * moments[1, "SD"]
    xlim <- c(xmin, xmax)
  } else {
    xmin <- xlim[1]
    xmax <- xlim[2]
  }
  if (is.null(range)) {
    range <- seq(xmin - .25, xmax + .25, by = .05)
  } else {
    range <- seq(range[1], range[2], by = .05)
  }
  intervals <- estimateRegressionLine(moments, corrs, value = range, conf.level = conf.level)
  if (is.null(ylim)) {
    ylim <- c(min(intervals), max(intervals))
  }
  if (!add) plot(NULL, bty = "l", xlim = xlim, ylim = ylim, main = main, pch = pch, xlab = xlab, ylab = ylab, cex.lab = 1.15)
  if (cross) {
    abline(v = moments[1, "M"], col = .colorTransparent(col, 50))
    abline(h = moments[2, "M"], col = .colorTransparent(col, 50))
  }
  if (line) {
    Est <- estimateRegressionCoefficients(moments, corrs)[, "Est"]
    abline(Est[1], Est[2], col = col)
  }
  if (!is.null(value)) {
    results <- estimateRegressionLine(moments, corrs, value = value, conf.level = conf.level)
  } else {
    results <- NULL
  }
  .prediction(intervals, results, interval = interval, values = values, conf.level = conf.level, digits = digits, col = col)
}

plotRegressionLine.data.frame <- function(frame, y = NULL, line = TRUE, value = NULL, range = NULL, interval = FALSE, values = TRUE, conf.level = .95, xlim = NULL, ylim = NULL, main = "Regression Plot for the Variables", ylab = NULL, xlab = NULL, pch = 16, points = FALSE, cross = FALSE, digits = 3, col = "black", add = FALSE, ...) {
  frame <- data.frame(frame)
  if (!is.null(y)) {
    cn <- colnames(frame)
    ci <- which(cn == deparse(substitute(y)))
    cn <- c(cn[-ci], cn[ci])
    frame <- frame[, cn]
  }
  Criterion <- frame[, 2]
  Predictor <- frame[, 1]
  if (is.null(xlab)) {
    xlab <- colnames(frame)[1]
  }
  if (is.null(ylab)) {
    ylab <- colnames(frame)[2]
  }
  if (is.null(xlim)) {
    xmin <- min(Predictor)
    xmax <- max(Predictor)
    xlim <- c(xmin, xmax)
  } else {
    xmin <- xlim[1]
    xmax <- xlim[2]
  }
  if (is.null(range)) {
    range <- seq(xmin - .25, xmax + .25, by = .05)
  } else {
    range <- seq(range[1], range[2], by = .05)
  }
  intervals <- estimateRegressionLine(frame, value = range, conf.level = conf.level)
  if (is.null(ylim)) {
    ylim <- c(min(intervals), max(intervals))
  }
  if (!add) {
    plotScatter(frame, xlim = xlim, ylim = ylim, main = main, xlab = xlab, ylab = ylab, points = points, pch = pch)
  }
  if (cross) {
    abline(v = mean(Predictor), col = .colorTransparent(col, 50))
    abline(h = mean(Criterion), col = .colorTransparent(col, 50))
  }
  if (line) {
    Est <- estimateRegressionCoefficients(frame)[, "Est"]
    abline(Est[1], Est[2], col = col)
  }
  if (!is.null(value)) {
    results <- estimateRegressionLine(frame, value = value, conf.level = conf.level)
  } else {
    results <- NULL
  }
  .prediction(intervals, results, interval = interval, values = values, conf.level = conf.level, digits = digits, col = col)
}

addLine <- addRegressionLine <- function(...) {
  plotRegressionLine(..., add = TRUE)
}

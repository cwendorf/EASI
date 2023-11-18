# Estimation Approach to Statistical Inference
## Summary Statistics

### Descriptives

.skewness <- function(x, na.rm = FALSE, type = 2) {
  if (any(ina <- is.na(x))) {
    if (na.rm) {
      x <- x[!ina]
    } else {
      return(NA)
    }
  }
  if (!(type %in% (1:3))) stop("Invalid 'type' argument.")
  n <- length(x)
  x <- x - mean(x)
  y <- sqrt(n) * sum(x^3) / (sum(x^2)^(3 / 2))
  if (type == 2) {
    if (n < 3) stop("Need at least 3 complete observations.")
    y <- y * sqrt(n * (n - 1)) / (n - 2)
  } else if (type == 3) y <- y * ((1 - 1 / n))^(3 / 2)
  y
}

.kurtosis <- function(x, na.rm = FALSE, type = 2) {
  if (any(ina <- is.na(x))) {
    if (na.rm) {
      x <- x[!ina]
    } else {
      return(NA)
    }
  }
  if (!(type %in% (1:3))) stop("Invalid 'type' argument.")
  n <- length(x)
  x <- x - mean(x)
  r <- n * sum(x^4) / (sum(x^2)^2)
  y <- if (type == 1) {
    r - 3
  } else if (type == 2) {
    if (n < 4) stop("Need at least 4 complete observations.")
    ((n + 1) * (r - 3) + 6) * (n - 1) / ((n - 2) * (n - 3))
  } else {
    r * (1 - 1 / n)^2 - 3
  }
  y
}

.describeSummary <- .describeMeans <- function(x, ...) {
  UseMethod(".describeSummary")
}

.describeSummary.bss <- .describeSummary.wss <- .describeMeans.bss <- .describeMeans.wss <-function(frame, ...) {
  frame <- unclass(frame)
  frame <- frame[, c("N", "M", "SD"), drop = FALSE]
  return(frame)
}

.describeSummary.default <- .describeMeans.default <- function(frame, ...) {
  if (typeof(frame) == "double") {
    data <- data.frame(frame)
    if (ncol(data) == 1) {
      colnames(data) <- deparse(substitute(frame))
    }
  } else {
    data <- frame
  }
  N <- sapply(data, length)
  M <- sapply(data, mean, na.rm = TRUE)
  SD <- sapply(data, sd, na.rm = TRUE)
  Skew <- sapply(data, .skewness, na.rm = TRUE)
  Kurt <- sapply(data, .kurtosis, na.rm = TRUE)
  results <- cbind(N = N, M = M, SD = SD, Skew = Skew, Kurt = Kurt)
  return(results)
}

.describeSummary.formula <- .describeMeans.formula <- function(formula, ...) {
  results <- aggregate(formula, FUN = .describeSummary)
  rn <- results[, 1]
  results <- results[[2]]
  rownames(results) <- rn
  colnames(results) <- c("N", "M", "SD", "Skew", "Kurt")
  return(results)
}

.describeSummary.list <- function(list, ...) {
  results <- lapply(list, .describeSummary.bss)
  return(results)
}

describeSummary <- desribeMeans <- function(..., main = NULL, digits = 3) {
  if (is.null(main)) {
    main <- "Summary Statistics for the Data"
  }
  if(typeof(...) == "list") {
    results <- .describeSummary.list(...)
    main <- paste(main, names(results), sep = ": ")
    }
  else {
    results <- list(.describeSummary(...))
    }
  results <- .formatList(results, main = main, digits = digits)
  return(results)
}

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

plotSummary <- function(x, ...) {
  UseMethod("plotSummary")
}

plotSummary.bss <- plotSummary.wss <- function(x, add = FALSE, main = NULL, ylab = "Outcome", xlab = "", ylim = NULL, offset = 0, col = "black", values = TRUE, digits = 3, pos = 2, pch = 16) {
  results <- describeSummary(x, main = main, digits = digits)
  if (is.null(main)) {
    main <- names(results)
  }
  results[[1]] <- cbind(.unformatFrame(results[[1]]), Skew = 0, Kurt = 0)
  results[[1]] <- .formatFrame(results[[1]], digits = digits)
  .deviations(results, main = main, ylab = ylab, xlab = xlab, ylim = ylim, values = values, digits = digits, pos = pos, pch = pch, add = add, col = col, offset = offset)
  invisible(eval(x))
}

plotSummary.default <- function(frame, add = FALSE, main = NULL, ylab = "Outcome", xlab = "", ylim = NULL, offset = 0, col = "black", values = TRUE, digits = 3, pos = 2, pch = 16) {
  results <- describeSummary(frame, main = main, digits = digits)
  if (is.null(main)) {
    main <- names(results)
  }
  .deviations(results, main = main, ylab = ylab, xlab = xlab, ylim = ylim, values = values, digits = digits, pos = pos, pch = pch, add = add, col = col, offset = offset)
  invisible(eval(frame))
}

plotSummary.formula <- function(formula, add = FALSE, main = NULL, ylab = "Outcome", xlab = "", ylim = NULL, offset = 0, col = "black", values = TRUE, digits = 3, pos = 2, pch = 16) {
  results <- describeSummary(formula, main = main, digits = digits)
  if (is.null(main)) {
    main <- names(results)
  }
  .deviations(results, main = main, ylab = ylab, xlab = xlab, ylim = ylim, values = values, digits = digits, pos = pos, pch = pch, add = add, col = col, offset = offset)
  invisible(eval(formula))
}

addSummary <- function(...) {
  plotSummary(..., add = TRUE)
}

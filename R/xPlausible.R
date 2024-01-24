# Estimation Approach to Statistical Inference
## Plausible

### Plot

.plausible <- function(results) {
  out <- density(0, from = -4.5, to = 4.5, bw = 1, kernel = "gaussian")
  out$x <- (out$x * results[2]) + results[1]
  return(out)
}

.plausible.main <- function(results, conf.level = .95, add = FALSE, main = NULL, ylab = "Outcome", xlab = "", slab = "Difference", ylim = NULL, type = "right", offset = 0, scale = 1, col = "black", pch = 16, ...) {
  out <- results
    graph <- results
    results <- results[, c(1, (ncol(results) - 1):ncol(results))]
    if (!add) {
      if (is.null(main)) {
        main <- "Plausibility Plot"
      }
      plot.main(results, main = main, ylab = ylab, xlab = xlab, ylim = ylim, pch = pch)
    }
    z <- apply(graph, 1, FUN = .plausible)
    if (length(col) > nrow(graph)) {
      col <- col[1:nrow(graph)]
    }
    mapply(plot.curve, z, loc = 1:nrow(graph), type = type, offset = offset, scale = 1, col = col)
  invisible(out)
}

.plausible.comp <- function(results, conf.level = .95, add = FALSE, main = NULL, ylab = "Outcome", xlab = "", slab = "Difference", ylim = NULL, type = "right", offset = 0, scale = 1, col = "black", pch = 16, ...) {
  out <- results
    graph <- results[, c(1, 2)]
    if (!add) {
      if (is.null(main)) {
        main <- "Plausibility Plot"
      }
      results <- results[, c(1, (ncol(results) - 1):ncol(results))]
      plot.comp(results, main = main, ylab = ylab, xlab = xlab, ylim = ylim, slab = slab, pch = pch)
    }
    graph[3, 1] <- graph[3, 1] + graph[1, 1]
    z <- apply(graph, 1, FUN = .plausible)
    if (length(col) > nrow(graph)) {
      col <- col[1:nrow(graph)]
    }
    (mapply(plot.curve, z, loc = 1:nrow(graph), type = type, offset = offset, scale = 1, col = col))
  invisible(out)
}

plotPlausible <- function(x, ...) {
  UseMethod("plotPlausible")
}

plotPlausible.default <- function(x, contrast = NULL, ...) {
  howmany <- nrow(estimateMeans(x))
  if (!is.null(contrast)) {
    z <- estimateMeansSubsets(x, contrast = contrast, conf.level = .95)
    .plausible.comp(z, ...)
  } else if (howmany == 2) {
    z <- estimateMeansComparison(x, conf.level = .95)
    .plausible.comp(z, ...)
  } else {
    z <- estimateMeansSet(x, ...)
    .plausible.main(z, ...)
  }
  invisible(eval(x))
}

plotPlausible.intervals.main <- function(x, ...) {
  .plausible.main(x, ...)
}

plotPlausible.intervals.comp <- function(x, ...) {
  .plausible.comp(x, ...)
}

addPlausible <- function(...) {
  plotPlausible(..., add = TRUE)
}

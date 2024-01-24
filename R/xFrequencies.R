# Estimation Approach to Statistical Inference
## Frequencies

### Describe

.frequencies <- function(x) {
  Freq <- table(x)
  Perc <- prop.table(table(x)) * 100
  CumFreq <- cumsum(table(x))
  CumPerc <- cumsum(table(x)) / summary(table(x))[[2]] * 100
  results <- cbind(Freq, Perc, CumFreq, CumPerc)
  class(results) <- "easi.frame"
  comment(results) <- "Frequencies for the Data"
  return(results)
}

describeFrequencies <- function(x, ...) {
  UseMethod("describeFrequencies")
}

describeFrequencies.data.frame <- function(frame, ...) {
  data <- data.frame(frame)
  results <- lapply(data, FUN = .frequencies)
  return(results)
}

describeFrequencies.formula <- function(formula, ...) {
  data <- unstack(model.frame(formula))
  if (typeof(data) == "list") {
    results <- lapply(data, .frequencies)
  } else {
    results <- apply(data, 2, .frequencies)
  }
  return(results)
}

### Plot

.histogram <- function(y, x, type = "right", offset = 0, col = "black") {
  y <- as.integer(y)
  yhist <- hist(y, plot = FALSE, breaks = seq(min(y) - .5, max(y) + .5, 1))
  if (type == "left") {
    yhist$density <- -yhist$density
  }
  rect(x + offset, yhist$mids - .5, x + offset + yhist$density, yhist$mids + .5, border = col)
}

plotFrequencies <- function(x, ...) {
  UseMethod("plotFrequencies")
}

plotFrequencies.data.frame <- function(frame, add = FALSE, ylim = NULL, main = NULL, ylab = "Outcome", xlab = "", type = "right", offset = .1, col = "black", ...) {
  data <- data.frame(frame)
  if (!add) {
    if (is.null(main)) {
      main <- "Frequencies for the Variables"
    }
    z <- apply(data, 2, density)
    a <- sapply(z, "[", "x")
    b <- lapply(a, function(x) c(min(x), max(x)))
    results <- data.frame(matrix(unlist(b), nrow = length(b), byrow = TRUE))
    rownames(results) <- names(data)
    plot.main(results, main = main, ylab = ylab, xlab = xlab, ylim = ylim)
  }
  if (length(col) > length(data)) {
    col <- col[seq_along(data)]
  }
  invisible(mapply(.histogram, data, x = seq_along(data), type = type, offset = offset, col = col))
  invisible(eval(frame))
}

plotFrequencies.formula <- function(formula, add = FALSE, ylim = NULL, main = NULL, ylab = NULL, xlab = "", type = "right", offset = .1, col = "black", ...) {
  data <- unstack(data.frame(model.frame(formula)))
  if (!add) {
    if (is.null(main)) {
      main <- "Frequencies for the Groups"
    }
    if (is.null(ylab)) {
      ylab <- all.vars(formula)[1]
    }
    if (typeof(data) == "list") {
      z <- lapply(data, density)
    } else {
      z <- apply(data, 2, density)
    }
    a <- sapply(z, "[", "x")
    b <- lapply(a, function(x) c(min(x), max(x)))
    results <- data.frame(matrix(unlist(b), nrow = length(b), byrow = TRUE))
    rownames(results) <- names(data)
    plot.main(results, main = main, ylab = ylab, xlab = xlab, ylim = ylim)
  }
  if (length(col) > length(data)) {
    col <- col[seq_along(data)]
  }
  invisible(mapply(.histogram, data, x = seq_along(data), type = type, offset = offset, col = col))
  invisible(eval(formula))
}

addFrequencies <- function(...) {
  plotFrequencies(..., add = TRUE)
}

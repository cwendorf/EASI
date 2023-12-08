# Estimation Approach to Statistical Inference
## Means Interaction Contrast (Factorial and Mixed Design ANOVA)

### Confidence Intervals

.estimateMeansInteraction <- function(x, ...) {
  UseMethod(".estimateMeansInteraction")
}

.estimateMeansInteraction.wss <- function(ListDescStats, ListCorrStats, conf.level = .95) {
  row4 <- .estimateMeansDifference.wss(ListDescStats[[1]], ListCorrStats[[1]])
  row5 <- .estimateMeansDifference.wss(ListDescStats[[2]], ListCorrStats[[2]])
  n1 <- row4[[3]] + 1
  n2 <- row5[[3]] + 1
  vd1 <- row4[[2]]^2 * n1
  vd2 <- row5[[2]]^2 * n2
  est1 <- row5[[1]] - row4[[1]]
  se1 <- sqrt(vd1 / n1 + vd2 / n2)
  df1 <- (se1^4) / (vd1^2 / (n1^3 - n1^2) + vd2^2 / (n2^3 - n2^2))
  tcrit1 <- qt((1 - conf.level) / 2, df1, lower.tail = FALSE)
  LL1 <- est1 - tcrit1 * se1
  UL1 <- est1 + tcrit1 * se1
  row1 <- c(est1, se1, df1, LL1, UL1)
  out <- data.frame(rbind(row1, row4, row5))
  rownames(out) <- c("Interaction", "Simple Effect at 1", "Simple Effect at 2")
  rownames(out)[2] <- paste("Simple Effect at", names(ListDescStats)[1], sep = " ")
  rownames(out)[3] <- paste("Simple Effect at", names(ListDescStats)[2], sep = " ")
  colnames(out) <- c("Est", "SE", "df", "LL", "UL")
  out <- list(out[2:3, ], out[1, ])
  names(out) <- c("Confidence Intervals for the Simple Effect Constrasts", "Confidence Interval for the Interaction Contrast")
  return(out)
}

.estimateMeansInteraction.default <- function(frame, by, conf.level = .95, ...) {
  ListDescStats <- .describeSummaryBy(frame, by = by)
  ListCorrStats <- .describeCorrelationsBy(frame, by = by)
  results <- .estimateMeansInteraction.wss(ListDescStats, ListCorrStats, conf.level = conf.level)
  return(results)
}

.estimateMeansInteraction.bss <- function(ListDescStats, conf.level = .95) {
  ListDescStats[[1]] <- ListDescStats[[1]][1:2, 1:3]
  ListDescStats[[2]] <- ListDescStats[[2]][1:2, 1:3]
  DescStats <- .deList(.collapseList(ListDescStats))
  colnames(DescStats) <- c("N", "M", "SD")
  v1 <- c(1, -1, -1, 1)
  v4 <- c(-1, 1, 0, 0)
  v5 <- c(0, 0, -1, 1)
  m <- DescStats[, 2]
  sd <- DescStats[, 3]
  n <- DescStats[, 1]
  var <- diag(sd^2) %*% (solve(diag(n)))
  est1 <- t(v1) %*% m
  se1 <- sqrt(t(v1) %*% var %*% v1)
  df1 <- (se1^4) / sum(((v1^4) * (sd^4) / (n^2 * (n - 1))))
  tcrit1 <- qt((1 - conf.level) / 2, df1, lower.tail = FALSE)
  LL1 <- est1 - tcrit1 * se1
  UL1 <- est1 + tcrit1 * se1
  row1 <- c(est1, se1, df1, LL1, UL1)
  est4 <- t(v4) %*% m
  se4 <- sqrt(t(v4) %*% var %*% v4)
  df4 <- (se4^4) / sum(((v4^4) * (sd^4) / (n^2 * (n - 1))))
  tcrit4 <- qt((1 - conf.level) / 2, df4, lower.tail = FALSE)
  LL4 <- est4 - tcrit4 * se4
  UL4 <- est4 + tcrit4 * se4
  row4 <- c(est4, se4, df4, LL4, UL4)
  est5 <- t(v5) %*% m
  se5 <- sqrt(t(v5) %*% var %*% v5)
  df5 <- (se5^4) / sum(((v5^4) * (sd^4) / (n^2 * (n - 1))))
  tcrit5 <- qt((1 - conf.level) / 2, df5, lower.tail = FALSE)
  LL5 <- est5 - tcrit5 * se5
  UL5 <- est5 + tcrit5 * se5
  row5 <- c(est5, se5, df5, LL5, UL5)
  out <- data.frame(rbind(row1, row4, row5))
  rownames(out) <- c("Interaction", "Simple Effect at 1", "Simple Effect at 2")
  rownames(out)[2] <- paste("Simple Effect at", names(ListDescStats)[1], sep = " ")
  rownames(out)[3] <- paste("Simple Effect at", names(ListDescStats)[2], sep = " ")
  colnames(out) <- c("Est", "SE", "df", "LL", "UL")
  out <- list(out[2:3, ], out[1, ])
  names(out) <- c("Confidence Intervals for the Simple Effect Constrasts", "Confidence Interval for the Interaction Contrast")
  return(out)
}

.estimateMeansInteraction.formula <- function(formula, by, conf.level = .95, ...) {
  ListDescStats <- .describeSummaryBy(formula, by = by)
  results <- .estimateMeansInteraction.bss(ListDescStats, conf.level = conf.level)
  return(results)
}

estimateMeansInteraction <- function(..., main = NULL, digits = 3) {
  results <- .estimateMeansInteraction(...)
  if (is.null(main)) {
    main <- names(results)
  }
  results <- .formatList(results, main = main, digits = digits)
  return(results)
}

### Null Hypothesis Significance Tests

.testMeansInteraction <- function(x, ...) {
  UseMethod(".testMeansInteraction")
}

.testMeansInteraction.wss <- function(ListDescStats, ListCorrStats) {
  row4 <- .testMeansDifference.wss(ListDescStats[[1]], ListCorrStats[[1]])
  row5 <- .testMeansDifference.wss(ListDescStats[[2]], ListCorrStats[[2]])
  n1 <- row4[[3]] + 1
  n2 <- row5[[3]] + 1
  vd1 <- row4[[2]]^2 * n1
  vd2 <- row5[[2]]^2 * n2
  est1 <- row5[[1]] - row4[[1]]
  se1 <- sqrt(vd1 / n1 + vd2 / n2)
  df1 <- (se1^4) / (vd1^2 / (n1^3 - n1^2) + vd2^2 / (n2^3 - n2^2))
  t1 <- est1 / se1
  p1 <- 2 * (1 - pt(abs(t1), df1))
  row1 <- c(est1, se1, t1, df1, p1)
  row1 <- c(est1, se1, t1, df1, p1)
  out <- data.frame(rbind(row1, row4, row5))
  rownames(out) <- c("Interaction", "Simple Effect at 1", "Simple Effect at 2")
  rownames(out)[2] <- paste("Simple Effect at", names(ListDescStats)[1], sep = " ")
  rownames(out)[3] <- paste("Simple Effect at", names(ListDescStats)[2], sep = " ")
  colnames(out) <- c("Est", "SE", "t", "df", "p")
  out <- list(out[2:3, ], out[1, ])
  names(out) <- c("Hypothesis Tests for the Main Effect Constrasts", "Hypothesis Test for the Interaction Contrast")
  return(out)
}

.testMeansInteraction.default <- function(frame, by, ...) {
  ListDescStats <- .describeSummaryBy(frame, by = by)
  ListCorrStats <- .describeCorrelationsBy(frame, by = by)
  results <- .testMeansInteraction.wss(ListDescStats, ListCorrStats)
  return(results)
}

.testMeansInteraction.bss <- function(ListDescStats) {
  ListDescStats[[1]] <- ListDescStats[[1]][1:2, 1:3]
  ListDescStats[[2]] <- ListDescStats[[2]][1:2, 1:3]
  DescStats <- .deList(.collapseList(ListDescStats))
  colnames(DescStats) <- c("N", "M", "SD")
  v1 <- c(1, 1, -1, -1)
  v4 <- c(-1, 1, 0, 0)
  v5 <- c(0, 0, -1, 1)
  m <- DescStats[, 2]
  sd <- DescStats[, 3]
  n <- DescStats[, 1]
  var <- diag(sd^2) %*% (solve(diag(n)))
  est1 <- t(v1) %*% m
  se1 <- sqrt(t(v1) %*% var %*% v1)
  t1 <- est1 / se1
  df1 <- (se1^4) / sum(((v1^4) * (sd^4) / (n^2 * (n - 1))))
  p1 <- 2 * (1 - pt(abs(t1), df1))
  row1 <- c(est1, se1, t1, df1, p1)
  est4 <- t(v4) %*% m
  se4 <- sqrt(t(v4) %*% var %*% v4)
  t4 <- est4 / se4
  df4 <- (se4^4) / sum(((v4^4) * (sd^4) / (n^2 * (n - 1))))
  p4 <- 2 * (1 - pt(abs(t4), df4))
  row4 <- c(est4, se4, t4, df4, p4)
  est5 <- t(v5) %*% m
  se5 <- sqrt(t(v5) %*% var %*% v5)
  t5 <- est5 / se5
  df5 <- (se5^4) / sum(((v5^4) * (sd^4) / (n^2 * (n - 1))))
  p5 <- 2 * (1 - pt(abs(t5), df5))
  row5 <- c(est5, se5, t5, df5, p5)
  out <- data.frame(rbind(row1, row4, row5))
  rownames(out) <- c("Interaction", "Simple Effect at 1", "Simple Effect at 2")
  rownames(out)[2] <- paste("Simple Effect at", names(ListDescStats)[1], sep = " ")
  rownames(out)[3] <- paste("Simple Effect at", names(ListDescStats)[2], sep = " ")
  colnames(out) <- c("Est", "SE", "t", "df", "p")
  out <- list(out[2:3, ], out[1, ])
  names(out) <- c("Hypothesis Tests for the Main Effect Constrasts", "Hypothesis Test for the Interaction Contrast")
  return(out)
}

.testMeansInteraction.formula <- function(formula, by, ...) {
  ListDescStats <- .describeSummaryBy(formula, by = by)
  results <- .testMeansInteraction.bss(ListDescStats)
  return(results)
}

testMeansInteraction <- function(..., main = NULL, digits = 3) {
  results <- .testMeansInteraction(...)
  if (is.null(main)) {
    main <- names(results)
  }
  results <- .formatList(results, main = main, digits = digits)
  return(results)
}

### Confidence Interval Plots

plotMeansInteraction <- function(x, ...) {
  UseMethod("plotMeansInteraction")
}

plotMeansInteraction.bss <- plotMeansInteraction.formula <- function(..., add = FALSE, main = NULL, ylab = "Outcome", xlab = "", conf.level = .95, rope = NULL, labels = NULL, values = TRUE, ylim = NULL, digits = 3, connect = FALSE, pos = c(2, 2, 4), pch = c(17, 17, 18), col = "black", offset = 0, intervals = TRUE) {
  results <- estimateMeansInteraction(..., conf.level = conf.level, main = main, digits = digits)
  if (is.null(main)) {
    main <- "Confidence Intervals for the Mean Interaction"
  }
  plotIntervals(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
}

plotMeansInteraction.default <- plotMeansInteraction.wss <- function(..., add = FALSE, main = NULL, ylab = "Outcome", xlab = "", conf.level = .95, rope = NULL, labels = NULL, values = TRUE, ylim = NULL, digits = 3, connect = TRUE, pos = c(2, 2, 4), pch = c(17, 17, 18), col = "black", offset = 0, intervals = TRUE) {
  results <- estimateMeansInteraction(..., conf.level = conf.level, main = main, digits = digits)
  if (is.null(main)) {
    main <- "Confidence Intervals for the Mean Interaction"
  }
  plotIntervals(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
}

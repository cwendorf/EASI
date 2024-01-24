# Estimation Approach to Statistical Inference
## Means Interaction

### Estimate

estimateInteraction <- estimateMeansInteraction <- function(x, ...) {
  UseMethod("estimateMeansInteraction")
}

estimateMeansInteraction.wsml <- function(moments, corrs, conf.level = .95, ...) {
  row4 <- estimateMeansDifference(moments[[1]], corrs[[1]])
  row5 <- estimateMeansDifference(moments[[2]], corrs[[2]])
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
  results <- rbind(row4, row5, row1)
  rownames(results) <- c("Simple Effect at 1", "Simple Effect at 2", "Interaction")
  rownames(results)[1] <- paste("Simple Effect at", names(moments)[1], sep = " ")
  rownames(results)[2] <- paste("Simple Effect at", names(moments)[2], sep = " ")
  colnames(results) <- c("Est", "SE", "df", "LL", "UL")
  comment(results) <- "Confidence Intervals for the Mean Interaction"
  class(results) <- c("easi.frame", "intervals.comp")
  return(results)
}

estimateMeansInteraction.bsml <- function(moments, conf.level = .95, ...) {
  moments[[1]] <- moments[[1]][1:2, 1:3]
  moments[[2]] <- moments[[2]][1:2, 1:3]
  DescStats <- rbind(moments[[1]],moments[[2]])
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
  results <- rbind(row4, row5, row1)
  rownames(results) <- c("Simple Effect at 1", "Simple Effect at 2", "Interaction")
  rownames(results)[1] <- paste("Simple Effect at", names(moments)[1], sep = " ")
  rownames(results)[2] <- paste("Simple Effect at", names(moments)[2], sep = " ")
  colnames(results) <- c("Est", "SE", "df", "LL", "UL")
  comment(results) <- "Confidence Intervals for the Mean Interaction"
  class(results) <- c("easi.frame", "intervals.comp")
  return(results)
}

estimateMeansInteraction.data.frame <- function(frame, by, conf.level = .95, ...) {
  moments <- describeMomentsBy(frame, by = by)
  corrs <- describeCorrelationsBy(frame, by = by)
  results <- estimateMeansInteraction(moments, corrs, conf.level = conf.level)
  return(results)
}

estimateMeansInteraction.formula <- function(formula, by, conf.level = .95, ...) {
  moments <- describeMomentsBy(formula, by = by)
  results <- estimateMeansInteraction(moments, conf.level = conf.level)
  return(results)
}

### Plot

plotInteraction <- plotMeansInteraction <- function(x, ...) {
  UseMethod("plotMeansInteraction")
}

plotMeansInteraction.formula <- plotMeansInteraction.bsml <- function(..., add = FALSE, main = NULL, ylab = "Outcome", xlab = "", conf.level = .95, rope = NULL, labels = NULL, values = TRUE, ylim = NULL, digits = 3, connect = FALSE, pos = c(2, 2, 4), pch = c(17, 17, 18), col = "black", offset = 0, intervals = TRUE) {
  results <- estimateMeansInteraction(..., conf.level = conf.level, main = main, digits = digits)
  plot(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
}

plotMeansInteraction.data.frame <- plotMeansInteraction.wsml <- function(..., add = FALSE, main = NULL, ylab = "Outcome", xlab = "", conf.level = .95, rope = NULL, labels = NULL, values = TRUE, ylim = NULL, digits = 3, connect = TRUE, pos = c(2, 2, 4), pch = c(17, 17, 18), col = "black", offset = 0, intervals = TRUE) {
  results <- estimateMeansInteraction(..., conf.level = conf.level, main = main, digits = digits)
  plot(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
}

### Test

testInteraction <- testMeansInteraction <- function(x, ...) {
  UseMethod("testMeansInteraction")
}

testMeansInteraction.wsml <- function(moments, corrs, ...) {
  row4 <- testMeansDifference(moments[[1]], corrs[[1]])
  row5 <- testMeansDifference(moments[[2]], corrs[[2]])
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
  results <- rbind(row4, row5, row1)
  rownames(results) <- c("Effect at 1", "Effect at 2", "Interaction")
  rownames(results)[1] <- paste("Effect at", names(moments)[1], sep = " ")
  rownames(results)[2] <- paste("Effect at", names(moments)[2], sep = " ")
  colnames(results) <- c("Est", "SE", "t", "df", "p")
  comment(results) <- "Hypothesis Tests for the Mean Interaction"
  class(results) <- c("easi.frame")
  return(results)
}

testMeansInteraction.bsml <- function(moments, ...) {
  moments[[1]] <- moments[[1]][1:2, 1:3]
  moments[[2]] <- moments[[2]][1:2, 1:3]
  DescStats <- rbind(moments[[1]], moments[[2]])
  v1 <- c(1, -1, -1, 1)
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
  results <- rbind(row4, row5, row1)
  rownames(results) <- c("Effect at 1", "Effect at 2", "Interaction")
  rownames(results)[1] <- paste("Effect at", names(moments)[1], sep = " ")
  rownames(results)[2] <- paste("Effect at", names(moments)[2], sep = " ")
  colnames(results) <- c("Est", "SE", "t", "df", "p")
  comment(results) <- "Hypothesis Tests for the Mean Interaction"
  class(results) <- c("easi.frame")
  return(results)
}

testMeansInteraction.data.frame <- function(frame, by, ...) {
  moments <- describeMomentsBy(frame, by = by)
  corrs <- describeCorrelationsBy(frame, by = by)
  results <- testMeansInteraction(moments, corrs)
  return(results)
}

testMeansInteraction.formula <- function(formula, by, ...) {
  moments <- describeMomentsBy(formula, by = by)
  results <- testMeansInteraction(moments)
  return(results)
}

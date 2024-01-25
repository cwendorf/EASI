# Estimation Approach to Statistical Inference
## Formatting

### Frames

.formatFrame <- function(results, digits = 3, padding = 2, width = NULL, ...) {
  if (is.null(width)) width <- digits + (padding * 2)
  format(as.data.frame(round(results, digits = digits)), width = width, trim = TRUE, nsmall = digits, scientific = FALSE, ...)
}

.formatEASI <- function(results, digits = 3, padding = 2, width = NULL, ...) {
  if (is.null(width)) width <- digits + (padding * 2)
  colnames(results) <- format(colnames(results), width = width, justify = "right")
  noquote(format(round(results, digits = digits), width = width, justify = "right", digits = digits, nsmall = digits, trim = TRUE, scientific = FALSE, ...))
}

.unformatFrame <- function(results) {
  apply(results, c(1, 2), FUN = as.numeric)
}

.deList <- function(results) {
  out <- results[[1]]
  if (length(results) > 1) {
    for (i in 2:length(results)) {
      out <- rbind(out, results[[i]])
    }
  }
  return(out)
}

### Print

print.easi.frame <- function(x, format = "easi", main = NULL, ...) {
  results <- unclass(x)
  if (format == "frame") {
    print(.formatFrame(results, ...))}
  else if (format == "easi") {
    if (is.null(main)) {main <- comment(x)}
    cat("\n", main, "\n\n", sep = "")
    print(.formatEASI(results, ...))
    cat("\n", sep = "")}
  invisible(x)
}

print.easi.list <- function(x, ...) {
  results <- unclass(x)
  print(results, ...)
  invisible(x)
}

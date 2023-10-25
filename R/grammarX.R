# Estimation Approach to Statistical Inference
## Grammar for Building and Handling Datasets

### Frame Construction

frame <- function(..., type="data") {
  if (type == "bss" || type == "wss") {
    out <- rbind(...)
    class(out) <- type}
  else if (type == "data") {
    out <- data.frame(...)}
  out
}

### Choose Variables

choose <- function(x, ...) {
  UseMethod("choose")
}

choose.bss <- choose.wss <- function(DescStats, ...) {
  chosen <- as.character(match.call(expand.dots = FALSE)$...)
  results <- DescStats[chosen,]
  class(results) <- class(DescStats)
  return(results)
}

choose.default <- function(frame, ...) {
  chosen <- as.character(match.call(expand.dots = FALSE)$...)
  subset(frame, select = chosen)
}

choose.formula <- function(formula, ...) {
  chosen <- as.character(match.call(expand.dots = FALSE)$...)
  update <- paste("~ factor(.,", paste(deparse(chosen), collapse=","), ")")
  update(formula, update)
}

### Infix Operators

"%c%" <- function(lhs, rhs) {
  lhs <- substitute(lhs)
  rhs <- substitute(rhs)
  do.call(c, list(lhs, rhs))
}

### Exposition Pipe

"%$>%" <- function(lhs, rhs) {
  lhs <- substitute(lhs)
  rhs <- substitute(rhs)
  do.call(with, list(lhs, rhs))
}

### Dot Pipes

insert_dot <- function(expr) {
  if (is.symbol(expr)) {expr <- as.call(c(expr, quote(`.`)))}
  else if (length(expr) == 1) {expr <- as.call(c(expr[[1]], quote(`.`)))}
  else if (all(sapply(expr[-1], `!=`, quote(`.`)))) {expr <- as.call(c(expr[[1]], quote(`.`), as.list(expr[-1])))}
  return(expr)
}

'%.>%' <- forwardPipe <- function(lhs, rhs) {
  . <- eval(lhs)
  rhs <- substitute(rhs)
  rhs <- insert_dot(rhs)
  eval(rhs)
}

"%.>>%" <- function(lhs, rhs) {
  . <- eval(lhs)
  rhs <- substitute(rhs)
  rhs <- insert_dot(rhs)
  print(eval(rhs))
  invisible(.)
}

# Estimation Approach to Statistical Inference
## Infix and Pipe Operators

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

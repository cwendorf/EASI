# Estimation Approach to Statistical Inference
## Infix and Pipe Operators

### Infix Operators

"%$>%" <- "%w%" <- function(lhs,rhs) {
  lhs <- substitute(lhs)
  rhs <- substitute(rhs)
  do.call(with,list(lhs,rhs))
}

"%c%" <- function(lhs,rhs) {
  lhs <- substitute(lhs)
  rhs <- substitute(rhs)
  do.call(c,list(lhs,rhs))
}

### Pipe Operators

"%.>%" <- function(lhs,rhs) {
  . <- eval(lhs)
  rhs <- substitute(rhs)
  eval(rhs)
}

"%p>%" <- function(lhs,rhs) {
  . <- eval(lhs)
  rhs <- substitute(rhs)
  print(eval(rhs))
  invisible(.)
}

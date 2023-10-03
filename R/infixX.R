# Estimation Approach to Statistical Inference
## Infix Operators

### Exposition Pipe

"%$>%" <- function(lhs,rhs) {
  lhs <- substitute(lhs)
  rhs <- substitute(rhs)
  do.call(with,list(lhs,rhs))
}

### Dot Pipes

"%.>%" <- function(lhs,rhs) {
  . <- eval(lhs)
  rhs <- substitute(rhs)
  eval(rhs)
}

"%.>>%" <- function(lhs,rhs) {
  . <- eval(lhs)
  rhs <- substitute(rhs)
  print(eval(rhs))
  invisible(.)
}

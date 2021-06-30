# Estimation Approach to Statistical Inference
## Combine Elements

### Variables

combine <- function(x,...) 
  UseMethod("combine")

combine.default <- function(...) {
  invisible(data.frame(...))
}

combine.formula <- function(formula) {
  invisible(formula)
}


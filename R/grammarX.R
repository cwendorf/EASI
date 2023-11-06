# Estimation Approach to Statistical Inference
## Grammar for Building and Handling Datasets

### Frame Construction

frame <- function(..., type = "data") {
  if (type == "bss" || type == "wss") {
    out <- rbind(...)
    class(out) <- type
  } else if (type == "data") {
    out <- data.frame(...)
  } else if (type == "corr") {
    out <- rbind(...)
    colnames(out) <- rownames(out)
    class(out) <- type
  }
  out
}

create <- function(..., type = "corr") {
  clist <- as.character(match.call(expand.dots = FALSE)$...)
  nr <- length(clist)
  if (type == "corr") {
    results <- matrix(data = NA, nr, nr)
    colnames(results) <- clist
  } else if (type == "bss" || type == "wss") {
    results <- matrix(data = NA, nr, 3)
    colnames(results) <- c("N", "M", "SD")
  }
  rownames(results) <- clist
  class(results) <- type
  return(results)
}

complete <- function(x, ...) {
  UseMethod("complete")
}

complete.corr <- function(mat) {
  nr <- nrow(mat)
  nc <- ncol(mat)
  rn <- rownames(mat)
  cn <- colnames(mat)
  results <- matrix(data = NA, nr, nc)
  rownames(results) <- rn
  colnames(results) <- cn
  for (i in 1:nr) {
    for (j in 1:nc) {
      if (!is.na(mat[rn[i], cn[j]])) {
        if (mat[rn[i], cn[j]] == results[cn[j], rn[i]] || is.na(results[cn[j], rn[i]])) {
          results[cn[j], rn[i]] <- mat[rn[i], cn[j]]
          results[rn[i], cn[j]] <- mat[rn[i], cn[j]]
        } else {
          return("error")
        }
      }
    }
  }
  diag(results) <- 1.000
  class(results) <- "corr"
  return(results)
}

### pick Variables

pick <- function(x, ...) {
  UseMethod("pick")
}

pick.bss <- pick.wss <- function(DescStats, ...) {
  chosen <- as.character(match.call(expand.dots = FALSE)$...)
  results <- DescStats[chosen, ]
  class(results) <- class(DescStats)
  return(results)
}

pick.default <- function(frame, ...) {
  chosen <- as.character(match.call(expand.dots = FALSE)$...)
  subset(frame, select = chosen)
}

pick.formula <- function(formula, ...) {
  chosen <- as.character(match.call(expand.dots = FALSE)$...)
  update <- paste("~ factor(.,", paste(deparse(chosen), collapse = ","), ")")
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
  if (is.symbol(expr)) {
    expr <- as.call(c(expr, quote(`.`)))
  } else if (length(expr) == 1) {
    expr <- as.call(c(expr[[1]], quote(`.`)))
  } else if (all(sapply(expr[-1], `!=`, quote(`.`)))) {
    expr <- as.call(c(expr[[1]], quote(`.`), as.list(expr[-1])))
  }
  return(expr)
}

"%.>%" <- forwardPipe <- function(lhs, rhs) {
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

# Estimation Approach to Statistical Inference
## Grammar for Piping

### Construction

construct <- function(..., class = "data") {
  if (class == "bss" || class == "wss") {
    out <- rbind(...)
    class(out) <- class
  } else if (class == "data") {
    out <- data.frame(...)
  } else if (class == "corr") {
    out <- rbind(...)
    colnames(out) <- rownames(out)
    class(out) <- class
  }
  return(out)
}

combine <- function(..., class = NULL) {
  out <- list(...)
  class(out) <- class
  return(out)
}

create <- function(..., class = "corr") {
  clist <- as.character(match.call(expand.dots = FALSE)$...)
  nr <- length(clist)
  if (class == "corr") {
    results <- matrix(data = NA, nr, nr)
    colnames(results) <- clist
  } else if (class == "bss" || class == "wss") {
    results <- matrix(data = NA, nr, 3)
    colnames(results) <- c("N", "M", "SD")
  }
  rownames(results) <- clist
  class(results) <- class
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

### Assign and Retain

retain <- function(x, name, where = parent.frame()) {
  name_string <- deparse(substitute(name))
  if (is.null(where)) {
    sys_calls <- sys.calls()
    func_calls <- grepl("\\<retain\\(", sys_calls) & !grepl("\\<retain\\(\\.",sys_calls)
    where <- sys.frame(max(which(func_calls)) - 1)
  }
  assign(name_string, value = x, pos = where)
  invisible(x)
}

### Filtering and Focusing

is.formula <- function(x) {
  inherits(x, "formula")
}

filters <- function(data, ...) {
  filts <- (match.call(expand.dots = FALSE)$...)
  for (i in seq_along(filts)) {
    data <- subset(data, eval(filts[[i]]))
  }
  return(data)
}

focus <- function(x, ...) {
  UseMethod("focus")
}

focus.bss <- focus.wss <- function(DescStats, ...) {
  chosen <- as.character(match.call(expand.dots = FALSE)$...)
  results <- DescStats[chosen, ]
  class(results) <- class(DescStats)
  return(results)
}

focus.data.frame <- function(frame, ...) {
  filts <- (match.call(expand.dots = FALSE)$...)
  chosen <- NULL
  for (i in seq_along(filts)) {
    type <- typeof(do.call(with, list(frame, filts[[i]])))
    if (type == "logical") {frame <- subset(frame, eval(filts[[i]]))}
    else if (type == "language") {return(do.call(with, list(frame, filts[[i]])))}
    else {
      chose <- as.character(filts[[i]])
      chosen <- c(chosen, chose)
    }
  }
  if (is.null(chosen)) {
    return(frame)
  } else {
    return(subset(frame, select = chosen))
  }
}

focus.formula <- function(formula, ...) {
  chosen <- as.character(match.call(expand.dots = FALSE)$...)
  update <- paste("~ factor(.,", paste(deparse(chosen), collapse = ","), ")")
  update(formula, update)
}

focus.corr <- function(CorrStats, ...) {
  chosen <- as.character(match.call(expand.dots = FALSE)$...)
  results <- CorrStats[chosen, chosen]
  class(results) <- class(CorrStats)
  return(results)
}

### Exposition

"%$>%" <- function(lhs, rhs) {
  lhs <- substitute(lhs)
  rhs <- substitute(rhs)
  do.call(with, list(lhs, rhs))
}

# Estimation Approach to Statistical Inference
## Grammar

### Construct

construct <- function(..., class = "data") {
  if (class == "bsm" || class == "wsm") {
    results <- rbind(...)
    class(results) <- c(class, "easi.frame")
    comment(results) <- "Summary Statistics for the Data"
  } else if (class == "data") {
    results <- data.frame(...)
    comment(results) <- "Data"
  } else if (class == "cor") {
    results <- rbind(...)
    colnames(results) <- rownames(results)
    class(results) <- c(class, "easi.frame")
    comment(results) <- "Correlations for the Data"
  }
  return(results)
}

combine <- function(..., class = NULL) {
  results <- list(...)
  if (class(results[[1]])[1] == "bsm") (class <- "bsml")
  if (class(results[[1]])[1] == "wsm") (class <- "wsml")
  if (class(results[[1]])[1] == "cor") (class <- "corl")
  class(results) <- c(class, "easi.list")
  return(results)
}

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

### Focus

focus <- function(x, ...) {
  UseMethod("focus")
}

focus.default <- function(...) {
  data.frame(...)
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
  chosen <- (match.call(expand.dots = FALSE)$...)
  if (is.null(chosen)) update <- formula
  else {
    chosen <- as.character(chosen)
    update <- paste("~ factor(.,", paste(deparse(chosen), collapse = ","), ")")}
  update(formula, update)
}

focus.bsm <- focus.wsm <- function(moments, ...) {
  chosen <- as.character(match.call(expand.dots = FALSE)$...)
  results <- moments[chosen, , drop = FALSE]
  class(results) <- class(moments)
  comment(results) <- comment(moments)
  return(results)
}

focus.cor <- function(corrs, ...) {
  chosen <- as.character(match.call(expand.dots = FALSE)$...)
  results <- corrs[chosen, chosen]
  class(results) <- class(corrs)
  comment(results) <- comment(corrs)
  return(results)
}

focus.bsml <- focus.wsml <- focus.corl <- function(list, ...) {
  chosen <- as.character(match.call(expand.dots = FALSE)$...)
  for (i in seq_along(list)) {
    newclass <- class(list[[i]])
    newcomment <- comment(list[[i]])
    if (class(list[[i]][1]) == "corl") (list[[i]] <- list[[i]][chosen, chosen])
    else (list[[i]] <- list[[i]][chosen, ])
    class(list[[i]]) <- newclass
    comment(list[[i]]) <- newcomment
    }
  return(list)
}

### Iterate

iterate <- function(x, ...) {
  UseMethod("iterate")
}

iterate.bsml <- function(moments, func, ...) {
  results <- NULL
  for (i in seq_along(moments)) {
    results[[i]] <- func(moments[[i]], ...)
  }
  names(results) <- names(moments)
  class(results) <- "easi.list"
  return(results)
}

iterate.wsml <- function(moments, corrs, func, ...) {
  results <- NULL
  for (i in seq_along(moments)) {
    results[[i]] <- func(moments[[i]], corrs[[i]], ...)
  }
  names(results) <- names(moments)
  class(results) <- "easi.list"
  return(results)
}

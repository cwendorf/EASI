# Estimation Approach to Statistical Inference
## Basic Formatting

### Formatting

.formatFrame <- function(results,digits=3) {
    format(as.data.frame(round(results,digits=digits)),width=7,trim=T,nsmall=digits)
}

.formatList <- function(results,main=NULL,digits=3) {
    results <- lapply(results,.formatFrame,digits)
    names(results) <- main
    results
}

.unformatFrame <- function(results) {
    apply(results,c(1,2),FUN=as.numeric)
}

.unformatList <- function(results) {
    lapply(results,.unformatFrame)
}

simplify <- function(results) {
    if(length(results)==1) {.unformatFrame(results[[1]])}
    else {.unformatList(results)}
}

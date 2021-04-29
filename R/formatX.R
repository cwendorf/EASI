# Estimation Approach to Statistical Inference
## Formatting

### Frames and Lists

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

unformat <- function(results) {
    if(length(results)==1) {.unformatFrame(results[[1]])}
    else {.unformatList(results)}
}

### Colors

.colorTransparent <- function(someColor,alpha=100) {
  newColor <- col2rgb(someColor)
  apply(newColor,2,function(curcoldata) {rgb(red=curcoldata[1],green=curcoldata[2],blue=curcoldata[3],alpha=alpha,maxColorValue=255)})
}

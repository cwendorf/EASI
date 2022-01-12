# Estimation Approach to Statistical Inference
## Formatting

### Frames

.formatFrame <- function(results,digits=3) {
  format(as.data.frame(round(results,digits=digits)),width=7,trim=T,nsmall=digits)
}

.unformatFrame <- function(results) {
  apply(results,c(1,2),FUN=as.numeric)
}

### Lists

.formatList <- function(results,main=NULL,digits=3) {
  results <- lapply(results,.formatFrame,digits)
  names(results) <- main
  results
}

.unformatList <- function(results) {
  lapply(results,.unformatFrame)
}

.deList <- function(results) {
  out <- results[[1]]
  colnames(out)[1]="Est" 
  if(length(results)>1) {
    for (i in 2:length(results)) {
      colnames(results[[i]])[1]="Est"
      out <- rbind(out,results[[i]])}}
  return(out)
}

.collapseList <- function(results,main=NULL) {
  if(is.null(main)) {main=names(results)[2]} else {main=main}
  out <- list(.deList(results))
  names(out) <- main   
  return(out)
}

### Colors

.colorTransparent <- function(someColor,alpha=100) {
  newColor <- col2rgb(someColor)
  apply(newColor,2,function(curcoldata) {rgb(red=curcoldata[1],green=curcoldata[2],blue=curcoldata[3],alpha=alpha,maxColorValue=255)})
}

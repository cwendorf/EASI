# Estimation Approach to Statistical Inference
## Colors

### Color Transformations

.colorTransparent <- function(someColor,alpha=100) {
  newColor <- col2rgb(someColor)
  apply(newColor,2,function(x) {rgb(red=x[1],green=x[2],blue=x[3],alpha=alpha,maxColorValue=255)})
}

.colorIntensity <- function(someColor,percent=100) {
  newColor <- col2rgb(someColor)
  percent <- (percent/100)
  if((newColor[1]*percent)>255) (newColor[1]=255) else (newColor[1]=round(newColor[1]*percent))
  if((newColor[2]*percent)>255) (newColor[2]=255) else (newColor[2]=round(newColor[2]*percent))
  if((newColor[3]*percent)>255) (newColor[3]=255) else (newColor[3]=round(newColor[3]*percent))
  apply(newColor,2,function(x) {rgb(red=x[1],green=x[2],blue=x[3],maxColorValue=255)})
}

### Color Schemes

vibrantTheme <- c(vibrantred = "#C80003", vibrantblue = "#0085C8", vibrantgold = "#C8A700", vibrantgreen = "#00C800", vibrantpurple = "#6400C8")
mutedTheme <- c(mutedred = "#8B0000", mutedblue = "#005D8B", mutedgold = "#8B7400", mutedgreen = "#008B00", mutedpurple = "#45008B")

vibrantMain <- function(n) {
    if (n==2) {hstart=.556} else {hstart=.14}
    colors=rev(hsv(h=seq.int(hstart,1,length.out=n),s=1,v=.784,alpha=1))
    return(colors)
}

vibrantComp <- function(n=3) {
    colors=c(vibrantMain(n-1),"black")
    return(colors)
}

mutedMain <- function(n) {
    if (n==2) {hstart=.556} else {hstart=.14}
    colors=rev(hsv(h=seq.int(hstart,1,length.out=n),s=1,v=.545,alpha=1))
    return(colors)
}

mutedComp <- function(n=3) {
    colors=c(mutedMain(n-1),"black")
    return(colors)
}

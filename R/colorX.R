# Estimation Approach to Statistical Inference
## Colors

### Color Transformations

.colorTransparent <- function(someColor,alpha=100) {
  newColor <- col2rgb(someColor)
  apply(newColor,2,function(x) {rgb(red=x[1],green=x[2],blue=x[3],alpha=alpha,maxColorValue=255)})
}

.colorIntensity <- function(someColor,increase=.0) {
  newColor <- rgb2hsv(col2rgb(someColor))
  newColor[3,] <- newColor[3,]+increase
  newColor[newColor > 1] <- 1
  apply(newColor,2,function(x) {hsv(h=x[1],s=x[2],v=x[3])})
}

### Color Themes

theme <- function(palette="muted",type="main") {
  if(palette=="vibrant") {palette <- c(vibrantred = "#C80003", vibrantblue = "#0085C8", vibrantgold = "#C8A700", vibrantgreen = "#00C800", vibrantpurple = "#6400C8")}
  else if(palette=="muted") {palette <- c(mutedred = "#8B0000", mutedblue = "#005D8B", mutedgold = "#8B7400", mutedgreen = "#008B00", mutedpurple = "#45008B")}
  if(type=="comp" && length(palette)==1) {palette <- c(palette,palette)}
  if(type=="comp") {palette <- c(palette[1:2],"black")}
  return(palette)
}

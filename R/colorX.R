# Estimation Approach to Statistical Inference
## Colors

### Color Transformations

.colorTransparent <- function(someColor, alpha = 100) {
  newColor <- col2rgb(someColor)
  apply(newColor, 2, function(x) {
    rgb(red = x[1], green = x[2], blue = x[3], alpha = alpha, maxColorValue = 255)
  })
}

.colorIntensity <- function(someColor, increase = .0) {
  newColor <- rgb2hsv(col2rgb(someColor))
  newColor[3, ] <- newColor[3, ] + increase
  newColor[newColor > 1] <- 1
  apply(newColor, 2, function(x) {
    hsv(h = x[1], s = x[2], v = x[3])
  })
}

### Color Themes

transparent <- rgb(255, 255, 255, max = 255, alpha = 0)

theme <- function(colors = "black", type = "main") {
  if (colors == "vibrant") {
    colors <- c(hsv(1, 1, .784), hsv(.667, 1, .784), hsv(.14, 1, .784), hsv(.333, 1, .784), hsv(.883, 1, .784), hsv(.5, 1, .784), hsv(.105, 1, .784), hsv(.75, 1, .784))
  } else if (colors == "muted") {
    colors <- c(hsv(1, 1, .545), hsv(.667, 1, .545), hsv(.14, 1, .545), hsv(.333, 1, .545), hsv(.883, 1, .545), hsv(.5, 1, .545), hsv(.105, 1, .545), hsv(.75, 1, .545))
  }
  if (type == "comp" && length(colors) == 1) {
    colors <- c(colors, colors)
  }
  if (type == "comp") {
    colors <- c(colors[1:2], "black")
  }
  return(colors)
}

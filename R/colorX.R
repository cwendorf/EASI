# Estimation Approach to Statistical Inference
## Colors

### Sequential Color Schemes

mediumTheme.main <- function(n) {
    if (n==2) {hstart=.6} else {hstart=.12}
    colors=rev(hsv(h=seq.int(hstart,1,length.out=n),s=.8,v=.8,alpha=1))
    return(colors)
}

mediumTheme.comparison <- function(n) {
    colors=c(mediumTheme.main(n-1),"black")
    return(colors)
}

# Estimation Approach to Statistical Inference
## Colors

### Sequential Color Scheme

easi.colors <- function(n,s=.8,v=.8) {
    if (n==2) {hstart=.6} else {hstart=.12}
    colors=rev(hsv(h=seq.int(hstart,1,length.out=n),s=s,v=v,alpha=1))
    return(colors)
}

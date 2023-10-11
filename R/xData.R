# Estimation Approach to Statistical Inference
## Data Plots

### Data Plot

plotData <- function(x,...)
  UseMethod("plotData")

plotData.default <- function(frame,add=FALSE,main=NULL,ylim=NULL,ylab="Outcome",xlab="",offset=.13,method="stack",jitter=.05,col="black",pch=16,lty="solid",connect=FALSE,...) {
  data <- data.frame(frame)
  if(ncol(data)==1) {colnames(data) <- deparse(substitute(frame))}
  loc <- (1:length(data))+offset
  if(!add) {
    if(is.null(main)) {main="Data for the Variables"}
    results <- describePercentiles(data)
    results[[1]] <- results[[1]][,c(1,5)]
    .plotMain(results,main=main,ylab=ylab,xlab=xlab,ylim=ylim)}
  dataChart(data,add=TRUE,at=loc,vertical=TRUE,method=method,jitter=jitter,col=.colorTransparent(col,70),pch=pch)
  if(connect && method!="jitter") {
    lesscol <- length(data)-1
    for(i in 1:lesscol) {segments(loc[i],data[,i],loc[i+1],data[,i+1],col=.colorTransparent(col,70),lty=lty)}}
  invisible(eval(frame))
}

plotData.formula <- function(formula,add=FALSE,main=NULL,ylim=NULL,ylab=NULL,xlab="",offset=.13,method="stack",jitter=.05,col="black",pch=16,...) {
  data <- unstack(model.frame(formula))
  loc <- (1:length(data))+offset
  if(!add) {
    if(is.null(ylab)) {ylab <- all.vars(formula)[1]}
    results <- describePercentiles(data)
    results[[1]] <- results[[1]][,c(1,5)]
    if(is.null(main)) {main="Data for the Groups"}
    .plotMain(results,main=main,ylab=ylab,xlab=xlab,ylim=ylim)}
  dataChart(data,add=TRUE,at=loc,vertical=TRUE,method=method,jitter=jitter,col=.colorTransparent(col,70),pch=pch)
  invisible(eval(formula))
}

### Modified stripchart

dataChart <- function(x, ...) UseMethod("dataChart")

dataChart.default <-
function(x, method = "overplot", jitter = 0.1, offset = 1/3, vertical = FALSE,
	 group.names, add = FALSE, at = NULL,
	 xlim = NULL, ylim = NULL, ylab = NULL, xlab = NULL,
         dlab = "", glab = "", log = "", pch = 0, col = par("fg"),
         cex = par("cex"), axes = TRUE, frame.plot = axes, ...)
{
    method <- pmatch(method, c("overplot", "jitter", "stack", "swarm"))[1L]
    if(is.na(method) || method == 0L)
	stop("invalid plotting method")
    groups <-
	if(is.list(x)) x else if(is.numeric(x)) list(x)
    n <- length(groups)
    if(!n) stop("invalid first argument")
    if(!missing(group.names))
	attr(groups, "names") <- group.names
    else if(is.null(attr(groups, "names")))
	attr(groups, "names") <- seq_len(n)
    if(is.null(at)) at <- seq_len(n)
    else if(length(at) != n)
	stop(gettextf("'at' must have length equal to the number %d of groups", n), domain = NA)
    if (is.null(dlab)) dlab <- deparse(substitute(x))
    dev.hold(); on.exit(dev.flush())
    if(!add) {
        dlim <- range(unlist(groups, use.names = FALSE), na.rm = TRUE)
	glim <- c(1L, n) # in any case, not range(at)
	if(method == 2L) { # jitter
	    glim <- glim + jitter * if(n == 1) c(-5, 5) else c(-2, 2)
	} else if(method == 3L || method == 4L) { # stack or swarm
	    glim <- glim + if(n == 1L) c(-1,1) else c(0, 0.5)
	}
	if(is.null(xlim))
	    xlim <- if(vertical) glim else dlim
	if(is.null(ylim))
	    ylim <- if(vertical) dlim else glim
        plot.new()
        plot.window(xlim, ylim, log, ...)
        if(frame.plot) box() # maybe (...)
	if(vertical) {
	    if (axes) {
		if(n > 1L) axis(1, at = at, labels = names(groups), ...)
		Axis(x, side = 2, ...)
	    }
	    if (is.null(ylab)) ylab <- dlab
	    if (is.null(xlab)) xlab <- glab
	}
	else {
	    if (axes) {
		Axis(x, side = 1, ...)
		if(n > 1L) axis(2, at = at, labels = names(groups), ...)
	    }
	    if (is.null(xlab)) xlab <- dlab
	    if (is.null(ylab)) ylab <- glab
	}
	title(xlab = xlab, ylab = ylab, ...)
    }
    csize <- cex * if(vertical) xinch(par("cin")[1L]) else yinch(par("cin")[2L])
    for(i in seq_len(n)) {
	x <- groups[[i]]
	y <- rep.int(at[i], length(x))
	if(method == 2L) ## jitter
	    y <- y + stats::runif(length(y), -jitter, jitter)
	else if(method == 3L) { ## stack
        xg <- split(x, factor(x))
	    xo <- lapply(xg, seq_along)
        x <- unlist(xg, use.names=FALSE)
	    y <- rep.int(at[i], length(x)) + (unlist(xo, use.names=FALSE) - 1) * offset * csize
	}
	else if(method == 4L) { ## swarm
	    xg <- split(x, factor(x))
	    xo <- lapply(xg, seq_along)
        xmean <- lapply(xo, mean)
        xo <- mapply('-', xo, xmean, SIMPLIFY = FALSE)
        x <- unlist(xg, use.names=FALSE)
	    y <- rep.int(at[i], length(x)) + (unlist(xo, use.names=FALSE)) * offset * csize
	}
	if(vertical) points(y, x, col = col[(i - 1L) %% length(col) + 1L], pch = pch[(i - 1L) %% length(pch) + 1L], cex = cex, ...)
	else points(x, y, col = col[(i - 1L) %% length(col) + 1L], pch = pch[(i - 1L) %% length(pch) + 1L], cex = cex, ...)
    }
    invisible()
}

dataChart.formula <-
    function(x, data = NULL, dlab = NULL, ..., subset, na.action = NULL)
{
    if(missing(x) || (length(x) != 3L))
	stop("formula missing or incorrect")
    m <- match.call(expand.dots = FALSE)
    if(is.matrix(eval(m$data, parent.frame())))
	m$data <- as.data.frame(data)
    m$... <- NULL
    m$formula <- m$x
    m$x <- NULL
    m$na.action <- na.action # force use of default for this method
    ## need stats:: for non-standard evaluation
    m[[1L]] <- quote(stats::model.frame)
    mf <- eval(m, parent.frame())
    response <- attr(attr(mf, "terms"), "response")
    if (is.null(dlab)) dlab <- names(mf)[response]
    dataChart(split(mf[[response]], mf[-response]), dlab = dlab, ...)
}

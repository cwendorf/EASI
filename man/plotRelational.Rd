% File man/plotRelational.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{plotRelational}
\alias{plotRelational}
\alias{plotMeansRelational}
\title{Plot Relational}
\description{Provides a plot of arelational (confidence) and relational (comparative) intervals for each group or level mean.}

\usage{
\method{plotRelational}{data.frame}(frame, add=FALSE, main=NULL, ylab="Outcome", xlab="", conf.level=.95, mu=NULL, rope=NULL, values=TRUE, ylim=NULL, digits=3, col=rgb(.5, .5, .5, .4), border=NA)

\method{plotRelational}{formula}(formula, add=FALSE, main=NULL, ylab="Outcome", xlab="", conf.level=.95, mu=NULL, rope=NULL, values=TRUE, ylim=NULL, digits=3, col=rgb(.5, .5, .5, .4), border=NA)

\method{plotRelational}{wsm}(moments, add=FALSE, main=NULL, ylab="Outcome", xlab="", conf.level=.95, mu=NULL, rope=NULL, values=TRUE, ylim=NULL, digits=3, col=rgb(.5, .5, .5, .4), border=NA)

\method{plotRelational}{bsm}(moments, add=FALSE, main=NULL, ylab="Outcome", xlab="", conf.level=.95, mu=NULL, rope=NULL, values=TRUE, ylim=NULL, digits=3, col=rgb(.5, .5, .5, .4), border=NA)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{moments}{a matrix/frame of descriptive/summary statistics}
\item{ylab}{a label for the y-axis}
\item{xlab}{a label for the x-axis}
\item{mu}{a number indicating the true/hypothesized value of the mean}
\item{conf.level}{confidence level of the interval}
\item{line}{a number for a horizontal reference line}
\item{add}{whether the plot should added to the existing plot}
\item{values}{whether the points should be labeled with their values}
\item{main}{a custom title for the graph}
\item{ylim}{custom limits for the y axis}
\item{digits}{the specified number of decimal places}
\item{col}{a value for the shaded color of the relational plot}
\item{border}{a value for the border color of the relational plot}
}

\value{
The returned plot contains the following components:
\item{M}{the means for the variables or groups}
\item{CI.LL}{the lower limits of the confidence intervals of the means}
\item{CI.UL}{the upper limits of the confidence intervals of the means}
\item{RI.LL}{the lower limits of the relational intervals for the means}
\item{RI.UL}{the upper limits of the relational intervals for the means}
\item{mu}{a horizontal line for the true/hypothesized value}
}

\references{
Wendorf, C. A. (2012). Drawing inferences from multiple intervals in the single-factor design: Derivations, clarifications, extensions, and representations. Methodology European Journal of Research Methods for the Behavioral and Social Sciences, 8, 125-133.
}
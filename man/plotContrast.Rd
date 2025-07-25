% File man/plotContrast.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{plotContrast}
\alias{plotContrast}
\alias{plotMeansContrast}
\title{Plot Contrast}
\description{Provides the plot of the mean contrast and its confidence interval.}

\usage{
\method{plotContrast}{data.frame}(frame, contrast, ylab="Outcome", xlab="", mu=0, conf.level=.95, rope=NULL, values=TRUE, main=NULL, ylim=NULL, digits=3)

\method{plotContrast}{formula}(formula, contrast, ylab="Outcome", xlab="", mu=0, conf.level=.95, rope=NULL, values=TRUE, main=NULL, ylim=NULL, digits=3)

\method{plotContrast}{wsm}(moments, corrs, contrast, ylab="Outcome", xlab="", mu=0, conf.level=.95, rope=NULL, values=TRUE, main=NULL, ylim=NULL, digits=3)

\method{plotContrast}{bsm}(moments, contrast, ylab="Outcome", xlab="", mu=0, conf.level=.95, rope=NULL, values=TRUE, main=NULL, ylim=NULL, digits=3)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{moments}{a matrix/frame of descriptive/summary statistics}
\item{corrs}{a matrix/frame of correlations among the measures}
\item{contrast}{a vector of codes for the contrast among all means}
\item{mu}{a number indicating the true/hypothesized value of the mean contrast}
\item{conf.level}{confidence level of the interval}
\item{main}{a custom title for the graph}
\item{ylim}{custom limits for the y axis}
\item{digits}{the specified number of decimal places}
}

\value{
The returned plot contains the following components:
\item{Est}{the contrast among the means}
\item{LL}{the lower limit of the confidence interval for the contrast}
\item{UL}{the upper limit of the confidence interval for the contrast}
\item{mu}{a horizontal line for the true/hypothesized value}
}
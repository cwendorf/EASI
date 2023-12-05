% File man/plotMeansInteraction.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{plotMeansInteraction}
\alias{plotMeansInteraction}
\alias{plotInteraction}
\title{Plot Means Interaction}
\description{Provides a plot of the confidence intervals for the simple effects and the interaction contrast in a 2x2 design.}

\usage{
\method{plotMeansInteraction}{default}(frame, ylab="Outcome", xlab="", mu=0, conf.level=.95, rope=NULL, values=TRUE, main=NULL, ylim=NULL, digits=3)

\method{plotMeansInteraction}{formula}(formula, ylab="Outcome", xlab="", mu=0, conf.level=.95, rope=NULL, values=TRUE, main=NULL, ylim=NULL, digits=3)

\method{plotMeansInteraction}{bss}(CompStats, ylab="Outcome", xlab="", mu=0, conf.level=.95, rope=NULL, values=TRUE, main=NULL, ylim=NULL, digits=3)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{CompStats}{a matrix/frame of descriptive/summary statistics}
\item{by}{a factor used for blocking}
\item{ylab}{a label for the y-axis}
\item{xlab}{a label for the x-axis}
\item{mu}{a number indicating the true/hypothesized value of the mean difference}
\item{conf.level}{confidence level of the interval}
\item{rope}{lower and upper values for a region of practical equivalence}
\item{values}{whether the points should be labeled with their values}
\item{main}{a custom title for the graph}
\item{ylim}{custom limits for the y axis}
\item{digits}{the specified number of decimal places}
}

\value{
The returned plot contains the following components:
\item{Est}{the contasts for the simple effects}
\item{LL}{the lower limit of the confidence intervals for the simple effects}
\item{UL}{the upper limit of the confidence intervals for the simple effects}
\item{Est}{the interaction contrast}
\item{LL}{the lower limit of the confidence interval for the interaction contrast}
\item{UL}{the upper limit of the confidence interval for the interaction contrast}
\item{mu}{a horizontal line for the true/hypothesized value}
\item{rope}{a shaded region of practical equivalence}
}
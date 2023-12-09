% File man/estimateMeansInteraction.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{estimateMeansInteraction}
\alias{estimateMeansInteraction}
\alias{estimateInteraction}
\title{Estimate Means Interaction}
\description{Provides the confidence intervals for the simple effects and the interaction contrast in a 2x2 design.}

\usage{
\method{estimateMeansInteraction}{default}(frame, by, conf.level=.95, main=NULL, digits=3)

\method{estimateMeansInteraction}{formula}(formula, by, conf.level=.95, main=NULL, digits=3)

\method{estimateMeansInteraction}{bss}(CompStats, conf.level=.95, main=NULL, digits=3)

\method{estimateMeansInteraction}{wss}(CompStats, CorrStats, conf.level=.95, main=NULL, digits=3)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{CompStats}{a list of matrices/frames of descriptive/summary statistics}
\item{CorrStats}{a list of matrices/frames of correlations}
\item{by}{a factor used for blocking}
\item{conf.level}{confidence level of the interval}
\item{main}{a custom title for the table}
\item{digits}{the specified number of decimal places}
}

\value{
The returned list contains two frames with the following components:    
\item{Est}{the contrasts for the simple effects}
\item{SE}{the standard errors for the simple effects}
\item{df}{the degrees of freedom for the simple effects}
\item{LL}{the lower limit of the confidence intervals for the simple effects}
\item{UL}{the upper limit of the confidence intervals for the simple effects}
\item{Est}{the interaction contrast}
\item{SE}{the standard error of the interaction contrast}
\item{df}{the degrees of the freedom for the interaction contrast}
\item{LL}{the lower limit of the confidence interval for the interaction contrast}
\item{UL}{the upper limit of the confidence interval for the interaction contrast}
}
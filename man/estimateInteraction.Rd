% File man/estimateInteraction.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{estimateInteraction}
\alias{estimateInteraction}
\alias{estimateMeansInteraction}
\title{Estimate Interaction}
\description{Provides the confidence intervals for the simple effects and the interaction contrast in a 2x2 design.}

\usage{
\method{estimateInteraction}{data.frame}(frame, by, conf.level=.95, ...)

\method{estimateInteraction}{formula}(formula, by, conf.level=.95, ...)

\method{estimateInteraction}{bsm}(moments, conf.level=.95, ...)

\method{estimateInteraction}{wsm}(moments, corrs, conf.level=.95, ...)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{moments}{a list of matrices/frames of descriptive/summary statistics}
\item{corrs}{a list of matrices/frames of correlations}
\item{by}{a factor used for blocking}
\item{conf.level}{confidence level of the interval}
}

\value{
The returned frame contains the following components:
\item{Est}{the contrasts for the simple effects and the interaction}
\item{SE}{the standard errors for the simple effects and the interaction}
\item{df}{the degrees of freedom for the simple effects and the interaction}
\item{LL}{the lower limit of the confidence intervals for the simple effects and the interaction}
\item{UL}{the upper limit of the confidence intervals for the simple effects and the interaction}
}
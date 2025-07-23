% File man/estimateDifference.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{estimateDifference}
\alias{estimateDifference}
\alias{estimateMeansDifference}
\title{Estimate Difference}
\description{Provides the mean difference, standard error, and confidence interval of the difference.}

\usage{
\method{estimateDifference}{data.frame}(frame, conf.level=.95, ...)

\method{estimateDifference}{formula}(formula, conf.level=.95, ...)

\method{estimateDifference}{wsm}(moments, corrs, conf.level=.95, ...)

\method{estimateDifference}{bsm}(moments, conf.level=.95, ...)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{moments}{a matrix/frame of descriptive/summary statistics}
\item{corrs}{a matrix/frame of correlations among the measures}
\item{conf.level}{confidence level of the interval}
}

\details{
This function compares two groups or variables. As such, the supplied factor or table of summary statistics should contain only two groups or two variables.
}

\value{
The returned frame contains the following components:
\item{Diff}{the difference between the two means}
\item{SE}{the standard error of the difference}
\item{df}{the degrees of the freedom for the difference}
\item{LL}{the lower limit of the confidence interval for the difference}
\item{UL}{the upper limit of the confidence interval for the difference}
}
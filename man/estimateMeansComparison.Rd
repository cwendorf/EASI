% File man/estimateMeansComparison.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{estimateMeansComparison}
\alias{estimateMeansComparison}
\alias{estimateComparison}
\title{Estimate Means Comparison}
\description{Provides the confidence intervals for the means and mean difference of a specified comparison.}

\usage{
\method{estimateMeansComparison}{data.frame}(frame, conf.level=.95, ...)

\method{estimateMeansComparison}{formula}(formula, conf.level=.95, ...)

\method{estimateMeansComparison}{wsm}(moments, corrs, conf.level=.95, ...)

\method{estimateMeansComparison}{bsm}(moments, conf.level=.95, ...)
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
\item{Est}{the estimates for the variables or groups and the difference}
\item{SE}{the standard Errors for the variables or groups and the difference}
\item{df}{the degrees of freedom for the variables or groups and the difference}
\item{LL}{the lower limit of the confidence interval of the means and the difference}
\item{UL}{the upper limit of the confidence interval of the means and the difference}
}
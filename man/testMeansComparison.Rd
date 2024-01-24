% File man/testMeansComparison.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{testMeansComparison}
\alias{testMeansComparison}
\alias{testComparison}
\title{Test Means Comparison}
\description{Provides the statistical significances tests for the means and mean difference of a specified comparison.}

\usage{
\method{testMeansComparison}{data.frame}(frame, ...)

\method{testMeansComparison}{formula}(formula, ...)

\method{testMeansComparison}{wsm}(moments, corrs, ...)

\method{testMeansComparison}{bsm}(moments, ...)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{moments}{a matrix/frame of descriptive/summary statistics}
\item{corrs}{a matrix/frame of correlations among the measures}
}

\details{
This function compares two groups or variables. As such, the supplied factor or table of summary statistics should contain only two groups or two variables.
}

\value{
The returned frame contains the following components:
\item{Est}{the means for the variables or groups and the difference}
\item{SE}{the standard Errors for the variables or groups and the difference}
\item{df}{the degrees of freedom for the variables or groups and the difference}
\item{t}{the t value for the means and the difference}
\item{p}{the p value for the means and the difference}
}
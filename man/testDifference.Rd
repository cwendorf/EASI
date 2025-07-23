% File man/testDifference.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{testDifference}
\alias{testDifference}
\alias{testMeansDifference}
\title{Test Difference}
\description{Provides a statistical significance test of the mean difference.}

\usage{
\method{testDifference}{data.frame}(frame, mu=0, ...)

\method{testDifference}{formula}(formula, mu=0, ...)

\method{testDifference}{wsm}(moments, corrs, mu=0, ...)

\method{testDifference}{bsm}(moments, mu=0, ...)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{moments}{a matrix/frame of descriptive/summary statistics}
\item{corrs}{a matrix/frame of correlations among the measures}
\item{mu}{a number indicating the true/hypothesized value of the mean difference}
}

\details{
This function compares two groups or variables. As such, the supplied factor or table of summary statistics should contain only two groups or two variables.
}

\value{
The returned frame contains the following components:
\item{Diff}{the difference between the two means}
\item{SE}{the standard error of the difference}
\item{df}{the degrees of the freedom for the difference}
\item{t}{the t value for the difference}
\item{p}{the p value for the difference}
}
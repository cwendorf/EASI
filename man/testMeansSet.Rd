% File man/testMeansSet.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{testMeansSet}
\alias{testMeansSet}
\alias{testMeans}
\title{Test Means Set}
\description{Provides a statistical significance test for each group or level mean.}

\usage{
\method{testMeansSet}{data.frame}(frame, mu=0, ...)

\method{testMeansSet}{formula}(formula, mu=0, ...)

\method{testMeansSet}{wsm}(moments, mu=0, ...)

\method{testMeansSet}{bsm}(moments, mu=0, ...)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{moments}{a matrix/frame of descriptive/summary statistics}
\item{mu}{a number indicating the true/hypothesized value of the mean}
}

\value{
The returned frame contains the following components:
\item{M}{the means for the variables or groups}
\item{SE}{the standard errors for the variables or groups}
\item{df}{the degrees of freedom for the variables or groups}
\item{t}{the t values for the means}
\item{p}{the p values for the means}
}
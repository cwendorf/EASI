% File man/estimateMeansDifference.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{estimateMeansDifference}
\alias{estimateMeansDifference}
\alias{estimateDifference}
\title{Estimate Means Difference}
\description{Provides the mean difference, standard error, and confidence interval of the difference.}

\usage{
\method{estimateMeansDifference}{default}(frame, conf.level=.95, main=NULL, digits=3)

\method{estimateMeansDifference}{formula}(formula, conf.level=.95, main=NULL, digits=3)

\method{estimateMeansDifference}{wss}(CompStats, CorrStats, conf.level=.95, main=NULL, digits=3)

\method{estimateMeansDifference}{bss}(CompStats, conf.level=.95, main=NULL, digits=3)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{CompStats}{a matrix/frame of descriptive/summary statistics}
\item{CorrStats}{a matrix/frame of correlations among the measures}
\item{conf.level}{confidence level of the interval}
\item{main}{a custom title for the table}
\item{digits}{the specified number of decimal places}
}

\details{
This function compares two groups or variables. As such, the supplied factor or table of summary statistics should contain only two groups or two variables.
}

\value{
The returned list contains one frame with the following components:    
\item{Diff}{the difference between the two means}
\item{SE}{the standard error of the difference}
\item{df}{the degrees of the freedom for the difference}
\item{LL}{the lower limit of the confidence interval for the difference}
\item{UL}{the upper limit of the confidence interval for the difference}
}
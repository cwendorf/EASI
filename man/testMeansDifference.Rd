% File man/testMeansDifference.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{testMeansDifference}
\alias{testMeansDifference}
\alias{testDifference}
\title{Test Means Difference}
\description{Provides a statistical significance test of the mean difference.}

\usage{
\method{testMeansDifference}{default}(frame, mu=0, main=NULL, digits=3)

\method{testMeansDifference}{formula}(formula, mu=0, main=NULL, digits=3)

\method{testMeansDifference}{wss}(CompStats, CorrStats, mu=0, main=NULL, digits=3)

\method{testMeansDifference}{bss}(CompStats, mu=0, main=NULL, digits=3)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{CompStats}{a matrix/frame of descriptive/summary statistics}
\item{CorrStats}{a matrix/frame of correlations among the measures}
\item{mu}{a number indicating the true/hypothesized value of the mean difference}
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
\item{t}{the t value for the difference}
\item{p}{the p value for the difference}
}
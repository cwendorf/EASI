% File man/testMeanComparison.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{testMeanComparison}
\alias{testMeanComparison}
\alias{testMeanComparison.default}
\alias{testMeanComparison.formula}
\alias{testMeanComparison.wss}
\alias{testMeanComparison.bss}
\title{Test Mean Comparison}
\description{Provides the statistical significances tests for the means and mean difference of a specified comparison.}

\usage{
\method{testMeanComparison}{default}(\dots,main=NULL,digits=3)

\method{testMeanComparison}{formula}(formula,main=NULL,digits=3)

\method{testMeanComparison}{wss}(CompStats,CorrStats,main=NULL,digits=3)

\method{testMeanComparison}{bss}(CompStats,main=NULL,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{CompStats}{a matrix/frame of descriptive/summary statistics}
\item{CorrStats}{a matrix/frame of correlations among the measures}
\item{main}{a custom title for the table}
\item{digits}{the specified number of decimal places}
}

\details{
This function compares two groups or variables. As such, the supplied factor or table of summary statistics should contain only two groups or two variables.
}

\value{
The returned list contains two frames with the following components:    
\item{M}{the means for the variables or groups}
\item{SE}{the standard Errors for the variables or groups}
\item{df}{the degrees of freedom for the variables or groups}
\item{t}{the t value for the means}
\item{p}{the p value for the means}
\item{Diff}{the difference between the two means}
\item{SE}{the standard error of the difference}
\item{df}{the degrees of the freedom for the difference}
\item{t}{the t value for the difference}
\item{p}{the p value for the difference}
}
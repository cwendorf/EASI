% File man/testMeansFactorial.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{testMeansFactorial}
\alias{testMeansFactorial}
\alias{testFactorial}
\title{Test Means Factorial}
\description{Provides a statistical significance test for an Analysis of Variance for a factorial or mixed design.}

\usage{
\method{testMeansFactorial}{default}(frame, by, main=NULL, digits=3)

\method{testMeansFactorial}{formula}(formula, by, main=NULL, digits=3)

\method{testMeansFactorial}{wss}(DescStats, CorrStats, main=NULL, digits=3)

\method{testMeansFactorial}{bss}(DescStats, main=NULL, digits=3)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{DescStats}{a matrix/frame of descriptive/summary statistics}
\item{CorrStats}{a matrix/frame of correlations for the data set}
\item{by}{a blocking factor}
\item{main}{a custom title for the table}
\item{digits}{the specified number of decimal places}
}

\value{
The returned list contains one frame with the following components:    
\item{F}{the F value for the Effect effect}
\item{dfb}{the degrees of freedom for the Effect effect}
\item{dfw}{the degrees of freedom for the error term}
\item{p}{the p value for the Effect effect}
}
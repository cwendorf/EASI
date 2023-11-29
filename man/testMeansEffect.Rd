% File man/testMeansEffect.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{testMeansEffect}
\alias{testEffect}
\title{Test Means Effect}
\description{Provides a statistical significance test for an Analysis of Variance.}

\usage{
\method{testMeansEffect}{default}(frame, main=NULL, digits=3)

\method{testMeansEffect}{formula}(formula, main=NULL, digits=3)

\method{testMeansEffect}{wss}(DescStats, CorrStats, main=NULL, digits=3)

\method{testMeansEffect}{bss}(DescStats, main=NULL, digits=3)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{DescStats}{a matrix/frame of descriptive/summary statistics}
\item{CorrStats}{a matrix/frame of correlations for the data set}
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
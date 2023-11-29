% File man/describeSummary.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{describeSummary}
\alias{describeSummary}
\title{Describe Summary}
\description{Provides a table of descriptive/summary statistics for a data set.}

\usage{
\method{describeSummary}{default}(frame, main=NULL, digits=3)

\method{describeSummary}{formula}(formula, main=NULL, digits=3)

\method{describeSummary}{wss}(DescStats, main=NULL, digits=3)

\method{describeSummary}{bss}(DescStats, main=NULL, digits=3)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{DescStats}{a matrix/frame of descriptive/summary statistics}
\item{main}{a custom title for the table}
\item{digits}{the specified number of decimal places}
}

\value{
The returned list contains one frame with the following components:    
\item{N}{the number of individuals for the variables or groups}
\item{M}{the mean for the variables or groups}
\item{SD}{the standard deviation for the variables or groups}
\item{Skew}{an index of skewness for the variables or groups}
\item{Kurt}{an index of kurtosis for the variables or groups}
}
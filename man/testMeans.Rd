% File man/testMeans.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{testMeans}
\title{Test Means}
\description{Provides a statistical significance test for each group or level mean.}

\usage{
\method{testMeans}{default}(frame, mu=0, main=NULL, digits=3)

\method{testMeans}{formula}(formula, mu=0, main=NULL, digits=3)

\method{testMeans}{wss}(DescStats, mu=0, main=NULL, digits=3)

\method{testMeans}{bss}(DescStats, mu=0, main=NULL, digits=3)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{DescStats}{a matrix/frame of descriptive/summary statistics}
\item{mu}{a number indicating the true/hypothesized value of the mean}
\item{main}{a custom title for the table}
\item{digits}{the specified number of decimal places}
}

\value{
The returned list contains one frame with the following components:    
\item{M}{the means for the variables or groups}
\item{SE}{the standard errors for the variables or groups}
\item{df}{the degrees of freedom for the variables or groups}
\item{t}{the t values for the means}
\item{p}{the p values for the means}
}
% File man/testPosthoc.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{testPosthoc}
\alias{testPosthoc}
\alias{testMeansPosthoc}
\title{Test Posthoc}
\description{Provides a statistical significance test for all Tukey HSD comparisons.}

\usage{
\method{testPosthoc}{default}(frame, mu=0, main=NULL, digits=3)

\method{testPosthoc}{formula}(formula, mu=0, main=NULL, digits=3)

\method{testPosthoc}{wss}(DescStats, mu=0, main=NULL, digits=3)

\method{testPosthoc}{bss}(DescStats, mu=0, main=NULL, digits=3)
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
\item{Diff}{the differences between the pairs of means}
\item{SE}{the standard error of the differences}
\item{df}{the degrees of the freedom for the differences}
\item{t}{the t values for the differences}
\item{p}{the p values for the differences}
}
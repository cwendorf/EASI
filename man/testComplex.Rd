% File man/testComplex.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{testComplex}
\alias{testComplex}
\alias{testMeansComplex}
\title{Test Complex}
\description{Provides the statistical significance tests for mean contrasts and the difference between those contrasts.}

\usage{
\method{testComplex}{data.frame}(frame, contrast1, contrast2, main=NULL, labels=NULL, digits=3)

\method{testComplex}{formula}(formula, contrast1, contrast2, main=NULL, labels=NULL, digits=3)

\method{testComplex}{wsm}(moments, corrs, contrast1, contrast2, main=NULL, labels=NULL, digits=3)

\method{testComplex}{bsm}(moments, contrast1, contrast2, main=NULL, labels=NULL, digits=3)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{moments}{a matrix/frame of descriptive/summary statistics}
\item{corrs}{a matrix/frame of correlations among the measures}
\item{contrast1}{a vector of codes for the first contrast among all means}
\item{contrast2}{a vector of codes for the second contrast among all means}
\item{labels}{custom labels for the contrasts}
}

\value{
The returned frame contains the following components:
\item{Est}{the contrasts for the variables or groups and the difference}
\item{SE}{the standard errors of the contrasts for the variables or groups and the difference}
\item{df}{the degrees of freedom for the contrasts of the variables or groups and the difference}
\item{t}{the t values for the contrasts and the difference}
\item{p}{the p values for the contrasts and the difference}
}
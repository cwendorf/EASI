% File man/testSubsets.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{testSubsets}
\alias{testSubsets}
\alias{testMeansSubsets}
\title{Test Subsets}
\description{Provides the statistical significance tests for a mean contrast and the mean subsets that comprise that contrast.}

\usage{
\method{testSubsets}{data.frame}(frame, contrast, main=NULL, labels=NULL, digits=3)

\method{testSubsets}{formula}(formula, contrast, main=NULL, labels=NULL, digits=3)

\method{testSubsets}{wsm}(moments, corrs, contrast, main=NULL, labels=NULL, digits=3)

\method{testSubsets}{bsm}(moments, contrast, main=NULL, labels=NULL, digits=3)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{moments}{a matrix/frame of descriptive/summary statistics}
\item{corrs}{a matrix/frame of correlations among the measures}
\item{contrast}{a vector of codes for the contrast among all means}
\item{main}{a custom title for the table}
}

\value{
The returned frame contains the following components:
\item{Est}{the subset means for the variables or groups and the difference}
\item{SE}{the standard errors of the subset means for the variables or groups and the difference}
\item{df}{the degrees of freedom of the subsets for the variables or groups and the difference}
\item{t}{the t value for the subset means and the difference}
\item{p}{the p value for the subset means and the difference}
}
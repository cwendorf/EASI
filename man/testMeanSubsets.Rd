% File man/testMeanSubsets.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{testMeanSubsets}
\alias{testMeanSubsets}
\alias{testMeanSubsets.default}
\alias{testMeanSubsets.formula}
\alias{testMeanSubsets.wss}
\alias{testMeanSubsets.bss}
\title{Test Mean Subsets}
\description{Provides the statistical significance tests for a mean contrast and the mean subsets that comprise that contrast.}

\usage{
\method{testMeanSubsets}{default}(frame, contrast, main=NULL, labels=NULL, digits=3)

\method{testMeanSubsets}{formula}(formula, contrast, main=NULL, labels=NULL, digits=3)

\method{testMeanSubsets}{wss}(DescStats, CorrStats, contrast, main=NULL, labels=NULL, digits=3)

\method{testMeanSubsets}{bss}(DescStats, contrast, main=NULL, labels=NULL, digits=3)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{DescStats}{a matrix/frame of descriptive/summary statistics}
\item{CorrStats}{a matrix/frame of correlations among the measures}
\item{contrast}{a vector of codes for the contrast among all means}
\item{main}{a custom title for the table}
\item{labels}{custom labels for the subsets}
\item{digits}{the specified number of decimal places}
}

\value{
The returned list contains two frames with the following components:  
\item{Est}{the subset means for the variables or groups}
\item{SE}{the standard errors of the subset means for the variables or groups}
\item{df}{the degrees of freedom of the subsets for the variables or groups}
\item{t}{the t value for the subset means}
\item{p}{the p value for the subset means}
\item{Est}{the difference between the two subset means}
\item{SE}{the standard error of the difference between the two subset means}
\item{df}{the degrees of the freedom for the difference between the two subset means}
\item{t}{the t value for the difference between the two subset means}
\item{p}{the p value for the difference between the two subset means}
}
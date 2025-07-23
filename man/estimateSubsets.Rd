% File man/estimateSubsets.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{estimateSubsets}
\alias{estimateSubsets}
\alias{estimateMeansSubsets}
\title{Estimate Subsets}
\description{Provides the confidence intervals for a mean contrast and the mean subsets that comprise that contrast.}

\usage{
\method{estimateSubsets}{data.frame}(frame, contrast, conf.level=.95, labels=NULL)

\method{estimateSubsets}{formula}(formula, contrast, conf.level=.95, labels=NULL)

\method{estimateSubsets}{wsm}(moments, corrs, contrast, conf.level=.95, labels=NULL)

\method{estimateSubsets}{bsm}(moments, contrast, conf.level=.95, labels=NULL)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{moments}{a matrix/frame of descriptive/summary statistics}
\item{corrs}{a matrix/frame of correlations among the measures}
\item{contrast}{a vector of codes for the contrast among all means}
\item{conf.level}{confidence level of the interval}
\item{labels}{custom labels for the subsets}
}

\value{
The returned frame contains the following components:
\item{Est}{the subset means for the variables or groups and the difference}
\item{SE}{the standard errors of the subset means for the variables or groups and the difference}
\item{df}{the degrees of freedom of the subsets for the variables or groups and the difference}
\item{LL}{the lower limit of the confidence interval of the subset means and the difference}
\item{UL}{the upper limit of the confidence interval of the subset means and the difference}
}
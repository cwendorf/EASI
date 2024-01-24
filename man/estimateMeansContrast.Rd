% File man/estimateMeansContrast.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{estimateMeansContrast}
\alias{estimateMeansContrast}
\alias{estimateContrast}
\title{Estimate Means Contrast}
\description{Provides the mean contrast, standard error, and confidence interval of the contrast.}

\usage{
\method{estimateMeansContrast}{data.frame}(frame, contrast, conf.level=.95, ...)

\method{estimateMeansContrast}{formula}(formula, contrast, conf.level=.95, ...)

\method{estimateMeansContrast}{wsm}(moments, corrs, contrast, conf.level=.95, ...)

\method{estimateMeansContrast}{bsm}(moments, contrast, conf.level=.95, ...)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{moments}{a matrix/frame of descriptive/summary statistics}
\item{corrs}{a matrix/frame of correlations among the measures}
\item{contrast}{a vector of codes for the contrast among all means}
\item{conf.level}{confidence level of the interval}
}

\value{
The returned frame contains the following components:
\item{Est}{the contrast among the means}
\item{SE}{the standard error of the contrast}
\item{df}{the degrees of the freedom for the contrast}
\item{LL}{the lower limit of the confidence interval for the contrast}
\item{UL}{the upper limit of the confidence interval for the contrast}
}
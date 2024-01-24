% File man/standardizeMeansContrast.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{standardizeMeansContrast}
\alias{standardizeMeansContrast}
\alias{standardizeContrast}
\title{Standardize Means Contrast}
\description{Provides the standardized effect size and its confidence interval for the contrast.}

\usage{
\method{standardizeMeansContrast}{data.frame}(frame, contrast, mu=0, conf.level=.95, ...)

\method{standardizeMeansContrast}{formula}(formula, contrast, mu=0, conf.level=.95, ...)

\method{standardizeMeansContrast}{wsm}(moments, corrs, contrast, mu=0, conf.level=.95, ...)

\method{standardizeMeansContrast}{bsm}(moments, contrast, mu=0, conf.level=.95, ...)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{moments}{a matrix/frame of descriptive/summary statistics}
\item{corrs}{a matrix/frame of correlations among the measures}
\item{contrast}{a vector of codes for the contrast among all means}
\item{mu}{a number indicating the true/hypothesized value of the mean contrast}
\item{conf.level}{confidence level of the interval}
}

\value{
The returned frame contains the following components:
\item{d}{the standardized mean contrast}
\item{SE}{the standard errors of the standardized mean contrast}
\item{LL}{the lower limit of the confidence interval of the standardized mean contrast}
\item{UL}{the upper limit of the confidence interval of the standardized mean contrast}
}

\references{
Bonett, D. G. (2008). Confidence intervals for standardized linear contrasts of means. Psychological Methods, 13(2), 99-109.
}
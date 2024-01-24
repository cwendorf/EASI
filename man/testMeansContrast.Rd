% File man/testMeansContrast.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{testMeansContrast}
\alias{testMeansContrast}
\alias{testContrast}
\title{Test Means Contrast}
\description{Provides a statistical significance test of the mean contrast.}

\usage{
\method{testMeansContrast}{data.frame}(frame, contrast, mu=0, ...)

\method{testMeansContrast}{formula}(formula, contrast, mu=0, ...)

\method{testMeansContrast}{wsm}(moments, corrs, contrast, mu=0, ...)

\method{testMeansContrast}{bsm}(moments, contrast, mu=0, ...)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{moments}{a matrix/frame of descriptive/summary statistics}
\item{corrs}{a matrix/frame of correlations among the measures}
\item{contrast}{a vector of codes for the contrast among all means}
\item{mu}{a number indicating the true/hypothesized value of the mean contrast}
}

\value{
The returned frame contains the following components:
\item{Est}{the contrast among the means}
\item{SE}{the standard error of the contrast}
\item{df}{the degrees of the freedom for the contrast}
\item{t}{the t value for the contrast}
\item{p}{the p value for the contrast}
}
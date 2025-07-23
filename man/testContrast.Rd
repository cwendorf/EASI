% File man/testContrast.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{testContrast}
\alias{testContrast}
\alias{testMeansContrast}
\title{Test Contrast}
\description{Provides a statistical significance test of the mean contrast.}

\usage{
\method{testContrast}{data.frame}(frame, contrast, mu=0, ...)

\method{testContrast}{formula}(formula, contrast, mu=0, ...)

\method{testContrast}{wsm}(moments, corrs, contrast, mu=0, ...)

\method{testContrast}{bsm}(moments, contrast, mu=0, ...)
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
% File man/estimateMeansContrast.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{estimateMeansContrast}
\alias{estimateContrast}
\title{Estimate Means Contrast}
\description{Provides the mean contrast, standard error, and confidence interval of the contrast.}

\usage{
\method{estimateMeansContrast}{default}(frame, contrast, conf.level=.95, main=NULL, digits=3)

\method{estimateMeansContrast}{formula}(formula, contrast, conf.level=.95, main=NULL, digits=3)

\method{estimateMeansContrast}{wss}(DescStats, CorrStats, contrast, conf.level=.95, main=NULL, digits=3)

\method{estimateMeansContrast}{bss}(DescStats, contrast, conf.level=.95, main=NULL, digits=3)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{DescStats}{a matrix/frame of descriptive/summary statistics}
\item{CorrStats}{a matrix/frame of correlations among the measures}
\item{contrast}{a vector of codes for the contrast among all means}
\item{conf.level}{confidence level of the interval}
\item{main}{a custom title for the table}
\item{digits}{the specified number of decimal places}
}

\value{
The returned list contains one frame with the following components:    
\item{Est}{the contrast among the means}
\item{SE}{the standard error of the contrast}
\item{df}{the degrees of the freedom for the contrast}
\item{LL}{the lower limit of the confidence interval for the contrast}
\item{UL}{the upper limit of the confidence interval for the contrast}
}
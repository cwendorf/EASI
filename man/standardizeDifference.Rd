% File man/standardizeDifference.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{standardizeDifference}
\alias{standardizeDifference}
\alias{standardizeMeansDifference}
\title{Standardize Difference}
\description{Provides the standardized effect size for the difference and its confidence interval.}

\usage{
\method{standardizeDifference}{data.frame}(frame, mu=0, conf.level=.95, ...)

\method{standardizeDifference}{formula}(formula, mu=0, conf.level=.95, ...)

\method{standardizeDifference}{wsm}(moments, corrs, mu=0, conf.level=.95, ...)

\method{standardizeDifference}{bsm}(moments, mu=0, conf.level=.95, ...)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{moments}{a matrix/frame of descriptive/summary statistics}
\item{corrs}{a matrix/frame of correlations among the measures}
\item{mu}{a number indicating the true/hypothesized value of the mean difference}
\item{conf.level}{confidence level of the interval}
}

\details{
This function compares two groups or variables. As such, the supplied factor or table of summary statistics should contain only two groups or two variables.
}

\value{
The returned frame contains the following components:
\item{d}{the standardized mean difference}
\item{SE}{the standard error of the standardized mean difference}
\item{LL}{the lower limit of the confidence interval of the standardized mean difference}
\item{UL}{the upper limit of the confidence interval of the standardized mean difference}
}

\references{
Bonett, D. G. (2008). Confidence intervals for standardized linear contrasts of means. Psychological Methods, 13(2), 99-109.
}
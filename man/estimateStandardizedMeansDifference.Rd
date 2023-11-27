% File man/estimateStandardizedMeansDifference.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{estimateStandardizedMeansDifference}
\alias{estimateStandardizedMeansDifference}
\alias{estimateStandardizedMeansDifference.default}
\alias{estimateStandardizedMeansDifference.formula}
\alias{estimateStandardizedMeansDifference.wss}
\alias{estimateStandardizedMeansDifference.bss}
\title{Estimate Standardized Means Difference}
\description{Provides the standardized effect size for the difference and its confidence interval.}

\usage{
\method{estimateStandardizedMeansDifference}{default}(frame, mu=0, conf.level=.95, main=NULL, digits=3)

\method{estimateStandardizedMeansDifference}{formula}(formula, mu=0, conf.level=.95, main=NULL, digits=3)

\method{estimateStandardizedMeansDifference}{wss}(CompStats, CorrStats, mu=0, conf.level=.95, main=NULL, digits=3)

\method{estimateStandardizedMeansDifference}{bss}(CompStats, mu=0, conf.level=.95, main=NULL, digits=3)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{CompStats}{a matrix/frame of descriptive/summary statistics}
\item{CorrStats}{a matrix/frame of correlations among the measures}
\item{mu}{a number indicating the true/hypothesized value of the mean difference}
\item{conf.level}{confidence level of the interval}
\item{main}{a custom title for the table}
\item{digits}{the specified number of decimal places}
}

\details{
This function compares two groups or variables. As such, the supplied factor or table of summary statistics should contain only two groups or two variables.
}

\value{
The returned list contains one frame with the following components:    
\item{d}{the standardized mean difference}
\item{SE}{the standard error of the standardized mean difference}
\item{LL}{the lower limit of the confidence interval of the standardized mean difference}
\item{UL}{the upper limit of the confidence interval of the standardized mean difference}
}

\references{
Bonett, D. G. (2008). Confidence intervals for standardized linear contrasts of means. Psychological Methods, 13(2), 99-109.
}
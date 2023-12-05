% File man/estimateCorrelationsDifference.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{estimateCorrelationsDifference}
\alias{estimateCorrelationsDifference}
\title{Estimate Correlations Difference}
\description{Provides the confidence interval for a correlation difference for independent samples.}

\usage{
\method{estimateCorrelationsDifference}{default}(CorrEst1, CorrEst2, main=NULL, digits=3)
}

\arguments{
\item{CorrEst1}{a matrix/frame of the correlation and its confidence interval in the first group}
\item{CorrEst2}{a matrix/frame of the correlation and its confidence interval in the second group}
\item{main}{a custom title for the table}
\item{digits}{the specified number of decimal places}
}

\value{
The returned list contains one frame with the following components:    
\item{Diff}{the difference between the two correlations}
\item{LL}{the lower limit of the confidence interval for the difference}
\item{UL}{the upper limit of the confidence interval for the difference}
}
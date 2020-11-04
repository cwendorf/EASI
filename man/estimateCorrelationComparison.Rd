% File man/estimateCorrelationComparison.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{estimateCorrelationComparison}
\alias{estimateCorrelationComparison}
\alias{estimateCorrelationComparison.default}
\title{Estimate Correlation Comparison}
\description{Provides the confidence intervals for the correlations and correlation difference for independent samples.}

\usage{
\method{estimateCorrelationComparison}{default}(CorrEst1,CorrEst2,main=NULL,labels=NULL,digits=3)
}

\arguments{
\item{CorrEst1}{a matrix/frame of the correlation and its confidence interval in the first group.}
\item{CorrEst2}{a matrix/frame of the correlation and its confidence interval in the second group.}
\item{main}{a custom title for the table.}
\item{labels}{custom labels for the correlations.}
\item{digits}{the specified number of decimal places.}
}

\details{
Tutorials and examples from published work are available at \url{https://cwendorf.github.io/EASI/}
}
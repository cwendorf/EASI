% File man/plotCorrelationComparison.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{plotCorrelationComparison}
\alias{plotCorrelationComparison}
\alias{plotCorrelationComparison.default}
\title{Plot Correlation Comparison}
\description{Provides a plot of the confidence intervals for the correlations and correlation difference for independent samples.}

\usage{
\method{plotCorrelationComparison}{default}(CorrEst1,CorrEst2,ylab="Outcome",xlab="",rope=NULL,values=TRUE,main=NULL,labels=NULL,ylim=NULL,digits=3)
}

\arguments{
\item{CorrEst1}{a matrix/frame of the correlation and its confidence interval in the first group.}
\item{CorrEst2}{a matrix/frame of the correlation and its confidence interval in the second group.}
\item{ylab}{a label for the y-axis.}
\item{xlab}{a label for the x-axis.}
\item{rope}{lower and upper values for a region of practical equivalence.}
\item{values}{whether the points should be labeled with their values.}
\item{main}{a custom title for the graph.}
\item{labels}{custom labels for the correlations.}
\item{ylim}{custom limits for the y axis.}
\item{digits}{the specified number of decimal places.}
}

\details{
Tutorials and examples from published work are available at \url{https://cwendorf.github.io/EASI/}
}
% File man/analyzePairwise.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{analyzePairwise}
\title{Analyze Pairwise}
\description{Provides a list of output that combines the estimate, plot, test, and standardize functions for all unadjusted pairwise comparisons.}

\usage{
\method{analyzePairwise}{default}(\dots,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,digits=3)

\method{analyzePairwise}{formula}(formula,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,digits=3)

\method{analyzePairwise}{wss}(DescStats,CorrStats,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,digits=3)

\method{analyzePairwise}{bss}(DescStats,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values.}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups.}
\item{DescStats}{a matrix/frame of descriptive/summary statistics.}
\item{CorrStats}{a matrix/frame of correlations among the measures.}
\item{mu}{a number indicating the true/hypothesized value of the mean difference.}
\item{conf.level}{confidence level of the interval.}
\item{digits}{the specified number of decimal places.}
}

\details{
Tutorials and examples from published work are available at \url{https://cwendorf.github.io/EASI/}
}
% File man/analyzeContrast.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{analyzeContrast}
\title{Analyze Contrast}
\description{Provides a list of output that combines the estimate, plot, test, and standardize functions for a contrast.}

\usage{
\method{analyzeContrast}{default}(\dots,contrast,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,digits=3)

\method{analyzeContrast}{formula}(formula,contrast,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,digits=3)

\method{analyzeContrast}{wss}(DescStats,CorrStats,contrast,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,digits=3)

\method{analyzeContrast}{bss}(DescStats,contrast,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values.}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups.}
\item{DescStats}{a matrix/frame of descriptive/summary statistics.}
\item{CorrStats}{a matrix/frame of correlations among the measures.}
\item{contrast}{a vector of codes for the contrast among all means.}
\item{mu}{a number indicating the true/hypothesized value of the mean contrast.}
\item{conf.level}{confidence level of the interval.}
\item{digits}{the specified number of decimal places.}
}

\details{
Tutorials and examples from published work are available at \url{https://cwendorf.github.io/EASI/}
}
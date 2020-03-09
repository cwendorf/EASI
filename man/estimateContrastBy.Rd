% File man/estimateContrastBy.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{estimateContrastBy}
\alias{estimateContrastBy}
\alias{ciContrastBy.default}
\alias{ciContrastBy.formula}
\alias{ciContrastBy.wss}
\alias{ciContrastBy.bss}
\title{Estimate ContrastBy}
\description{Provides the mean contrast, standard error, and confidence interval of the contrast.}

\usage{
\method{estimateContrastBy}{default}(\dots,by,contrast,conf.level=.95,digits=3)

\method{estimateContrastBy}{formula}(formula,by,contrast,conf.level=.95,digits=3)

\method{estimateContrastBy}{wss}(DescStats,CorrStats,by,contrast,conf.level=.95,digits=3)

\method{estimateContrastBy}{bss}(DescStats,by,contrast,conf.level=.95,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values.}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups.}
\item{DescStats}{a matrix/frame of descriptive/summary statistics.}
\item{CorrStats}{a matrix/frame of correlations among the measures.}
\item{by}{a between-subjects factor.}
\item{contrast}{a vector of codes for the contrast among all means.}
\item{conf.level}{confidence level of the interval.}
\item{digits}{the specified number of decimal places.}
}

\details{
Tutorials and examples from published work are available at \url{https://cwendorf.github.io/EASI/}
}
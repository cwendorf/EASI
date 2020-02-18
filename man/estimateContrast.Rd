% File man/estimateContrast.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{estimateContrast}
\alias{estimateContrast}
\alias{ciContrast.default}
\alias{ciContrast.formula}
\alias{ciContrast.wss}
\alias{ciContrast.bss}
\title{Estimate Contrast}
\description{Provides the mean contrast, standard error, and confidence interval of the contrast given the input.}

\usage{
# estimateContrast is a wrapper function. It will automatically call the appropriate method below given the class of the object.
estimateContrast(\dots,digits=3)

\method{ciContrast}{default}(\dots,contrast,conf.level=.95)

\method{ciContrast}{formula}(formula,contrast,conf.level=.95)

\method{ciContrast}{wss}(DescStats,CorrStats,contrast,conf.level=.95)

\method{ciContrast}{bss}(DescStats,contrast,conf.level=.95)
}

\arguments{
  \item{\dots}{a set of (non-empty) numeric vectors of data values.}
  \item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups.}
  \item{DescStats}{a matrix/frame of descriptive/summary statistics.}
  \item{CorrStats}{a matrix/frame of correlations among the measures.}
  \item{contrast}{a vector of codes for the contrast among all means.}
  \item{conf.level}{confidence level of the interval.}
  \item{digits}{the specified number of decimal places.}
}

\details{
Tutorials and examples from published work are available at \url{https://cwendorf.github.io/EASI/}
}
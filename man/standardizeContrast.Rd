% File man/standardizeContrast.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{standardizeContrast}
\alias{standardizeContrast}
\alias{smdContrast.default}
\alias{smdContrast.formula}
\alias{smdContrast.wss}
\alias{smdContrast.bss}
\title{Standardize Contrast}
\description{Provides the standardized effect size and its confidence interval for the contrast given the input.}

\usage{
\method{standardizeContrast}{default}(\dots,contrast,mu=0,conf.level=.95,digits=3)
\method{standardizeContrast}{formula}(formula,contrast,mu=0,conf.level=.95,digits=3)
\method{standardizeContrast}{wss}(DescStats,CorrStats,contrast,mu=0,conf.level=.95,digits=3)
\method{standardizeContrast}{bss}(DescStats,contrast,mu=0,conf.level=.95,digits=3)
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
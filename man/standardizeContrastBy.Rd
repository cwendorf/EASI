% File man/standardizeComtrastBy.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{standardizeComtrastBy}
\alias{standardizeComtrastBy}
\alias{smdComtrastBy.default}
\alias{smdComtrastBy.formula}
\alias{smdComtrastBy.wss}
\alias{smdComtrastBy.bss}
\title{Standardize ContrastBy}
\description{Provides the standardized effect size and its confidence interval for the contrast.}

\usage{
\method{standardizeComtrastBy}{default}(\dots,by,contrast,mu=0,conf.level=.95,digits=3)

\method{standardizeComtrastBy}{formula}(formula,by,contrast,mu=0,conf.level=.95,digits=3)

\method{standardizeComtrastBy}{wss}(DescStats,CorrStats,by,contrast,mu=0,conf.level=.95,digits=3)

\method{standardizeComtrastBy}{bss}(DescStats,by,contrast,mu=0,conf.level=.95,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values.}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups.}
\item{DescStats}{a matrix/frame of descriptive/summary statistics.}
\item{CorrStats}{a matrix/frame of correlations among the measures.}
\item{by}{a between-subjects factor.}
\item{contrast}{a vector of codes for the contrast among all means.}
\item{mu}{a number indicating the true/hypothesized value of the mean contrast.}
\item{conf.level}{confidence level of the interval.}
\item{digits}{the specified number of decimal places.}
}

\details{
Tutorials and examples from published work are available at \url{https://cwendorf.github.io/EASI/}
}
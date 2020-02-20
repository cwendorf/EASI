% File man/testContrast.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{testContrast}
\alias{testContrast}
\alias{nhstContrast.default}
\alias{nhstContrast.formula}
\alias{nhstContrast.wss}
\alias{nhstContrast.bss}
\title{Test Contrast}
\description{Provides a statistical significance test of the mean contrast given the input.}

\usage{
\method{testContrast}{default}(\dots,contrast,mu=0,digits=3)
\method{testContrast}{formula}(formula,contrast,mu=0,digits=3)
\method{testContrast}{wss}(DescStats,CorrStats,contrast,mu=0,digits=3)
\method{testContrast}{bss}(DescStats,contrast,mu=0,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values.}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups.}
\item{DescStats}{a matrix/frame of descriptive/summary statistics.}
\item{CorrStats}{a matrix/frame of correlations among the measures.}
\item{contrast}{a vector of codes for the contrast among all means.}
\item{mu}{a number indicating the true/hypothesized value of the mean contrast.}
\item{digits}{the specified number of decimal places.}
}

\details{
Tutorials and examples from published work are available at \url{https://cwendorf.github.io/EASI/}
}
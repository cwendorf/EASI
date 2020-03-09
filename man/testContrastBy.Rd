% File man/testComtrastBy.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{testComtrastBy}
\alias{testComtrastBy}
\alias{nhstComtrastBy.default}
\alias{nhstComtrastBy.formula}
\alias{nhstComtrastBy.wss}
\alias{nhstComtrastBy.bss}
\title{Test ContrastBy}
\description{Provides a statistical significance test of the mean contrast.}

\usage{
\method{testComtrastBy}{default}(\dots,by,contrast,mu=0,digits=3)

\method{testComtrastBy}{formula}(formula,by,contrast,mu=0,digits=3)

\method{testComtrastBy}{wss}(DescStats,CorrStats,by,contrast,mu=0,digits=3)

\method{testComtrastBy}{bss}(DescStats,by,contrast,mu=0,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values.}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups.}
\item{DescStats}{a matrix/frame of descriptive/summary statistics.}
\item{CorrStats}{a matrix/frame of correlations among the measures.}
\item{by}{a between-subjects factor.}
\item{contrast}{a vector of codes for the contrast among all means.}
\item{mu}{a number indicating the true/hypothesized value of the mean contrast.}
\item{digits}{the specified number of decimal places.}
}

\details{
Tutorials and examples from published work are available at \url{https://cwendorf.github.io/EASI/}
}
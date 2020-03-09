% File man/testMeansBy.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{testMeansBy}
\alias{testMeansBy}
\alias{nhstMeansBy.default}
\alias{nhstMeansBy.formula}
\alias{nhstMeansBy.wss}
\alias{nhstMeansBy.bss}
\title{Test MeansBy}
\description{Provides a statistical significance test for each group or level mean, repeated for each level of a second factor in a factorial or mixed design.}

\usage{
\method{testMeansBy}{default}(\dots,by,mu=0,digits=3)

\method{testMeansBy}{formula}(formula,by,mu=0,digits=3)

\method{testMeansBy}{wss}(DescStats,by,mu=0,digits=3)

\method{testMeansBy}{bss}(DescStats,by,mu=0,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values.}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups.}
\item{DescStats}{a matrix/frame of descriptive/summary statistics.}
\item{by}{a between-subjects factor.}
\item{mu}{a number indicating the true/hypothesized value of the mean.}
\item{digits}{the specified number of decimal places.}
}

\details{
Tutorials and examples from published work are available at \url{https://cwendorf.github.io/EASI/}
}
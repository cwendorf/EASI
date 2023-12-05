% File man/plotMeansFactorial.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{plotMeansFactorial}
\alias{plotMeansFactorial}
\title{Plot Means Factorial}
\description{Provides a plot of all group or level means and their confidence intervals in a factorial or mixed design.}

\usage{
\method{plotMeans}{default}(frame, by, ylab="Outcome", xlab="", conf.level=.95)

\method{plotMeans}{formula}(formula, by, ylab="Outcome", xlab="", conf.level=.95)

\method{plotMeans}{wss}(DescStats, ylab="Outcome", xlab="", conf.level=.95)

\method{plotMeans}{bss}(DescStats, ylab="Outcome", xlab="", conf.level=.95)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{DescStats}{a matrix/frame of descriptive/summary statistics}
\item{by}{a blocking factor}
\item{ylab}{a label for the y-axis}
\item{xlab}{a label for the x-axis}
\item{conf.level}{confidence level of the interval}
}

\value{
The returned plot contains the following components:
\item{M}{the means for the variables or groups}
\item{LL}{the lower limits of the confidence intervals of the means}
\item{UL}{the upper limits of the confidence intervals of the means}
}
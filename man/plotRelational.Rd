% File man/plotRelational.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{plotRelational}
\alias{plotRelational}
\alias{plotRelational.default}
\alias{plotRelational.formula}
\alias{plotRelational.wss}
\alias{plotRelational.bss}
\title{Plot Relational}
\description{Provides a plot of of arelational (confidence) and relational (comparative) intervals for each group or level mean.}

\usage{
\method{plotRelational}{default}(\dots,ylab="Outcome",xlab="",mu=0,conf.level=.95,values=TRUE,digits=3)

\method{plotRelational}{formula}(formula,ylab="Outcome",xlab="",mu=0,conf.level=.95,values=TRUE,digits=3)

\method{plotRelational}{wss}(DescStats,ylab="Outcome",xlab="",mu=0,conf.level=.95,values=TRUE,digits=3)

\method{plotRelational}{bss}(DescStats,ylab="Outcome",xlab="",mu=0,conf.level=.95,values=TRUE,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values.}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups.}
\item{DescStats}{a matrix/frame of descriptive/summary statistics.}
\item{ylab}{a label for the y-axis.}
\item{xlab}{a label for the x-axis.}
\item{mu}{a number indicating the true/hypothesized value of the mean.}
\item{conf.level}{confidence level of the interval.}
\item{values}{whether the points should be labeled with their values.}
\item{digits}{the specified number of decimal places.}
}

\details{
Tutorials and examples from published work are available at \url{https://cwendorf.github.io/EASI/}
}
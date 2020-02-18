% File man/estimateMeans.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{estiamteMeans}
\alias{estimateMeans}
\alias{ciMeans.default}
\alias{ciMeans.formula}
\alias{ciMeans.wss}
\alias{ciMeans.bss}
\title{Estimate Means}
\description{Provides a table of means, standard deviations, and confidence intervals for each mean given the input.}

\usage{
# estimateMeans is a wrapper function. It will automatically call the appropriate method below given the class of the object.
estimateMeans(\dots,digits=3)

\method{ciMeans}{default}(\dots,mu=0,conf.level=.95)

\method{ciMeans}{formula}(formula,mu=0,conf.level=.95)

\method{ciMeans}{wss}(DescStats,mu=0,conf.level=.95)

\method{ciMeans}{bss}(DescStats,mu=0,conf.level=.95)
}

\arguments{
  \item{\dots}{a set of (non-empty) numeric vectors of data values.}
  \item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups.}
  \item{DescStats}{a matrix/frame of user supplied descriptive/summary statistics.}
  \item{mu}{a number indicating the true/hypothesized value of the mean.}
  \item{conf.level}{confidence level of the interval.}
}

\examples{
Tutorials and examples from published work are available at https://cwendorf.github.io/EASI
}
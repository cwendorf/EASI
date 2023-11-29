% File man/estimateMeansRelational.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{estimateMeansRelational}
\alias{estimateMeansRelational}
\alias{estimateRelational}
\title{Estimate Means Relational}
\description{Provides a table of arelational (confidence) and relational (comparative) intervals for each group or level mean.}

\usage{
\method{estimateMeansRelational}{default}(frame, conf.level=.95, main=NULL, digits=3)

\method{estimateMeansRelational}{formula}(formula, conf.level=.95, main=NULL, digits=3)

\method{estimateMeansRelational}{wss}(DescStats, conf.level=.95, main=NULL, digits=3)

\method{estimateMeansRelational}{bss}(DescStats, conf.level=.95, main=NULL, digits=3)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{DescStats}{a matrix/frame of descriptive/summary statistics}
\item{conf.level}{confidence level of the interval}
\item{main}{a custom title for the table}
\item{digits}{the specified number of decimal places}
}

\value{
The returned list contains one frame with the following components:    
\item{M}{the means for the variables or groups}
\item{CI.LL}{the lower limits of the confidence intervals of the means}
\item{CI.UL}{the upper limits of the confidence intervals of the means}
\item{RI.LL}{the lower limits of the relational intervals for the means}
\item{RI.UL}{the upper limits of the relational intervals for the means}
}

\references{
Wendorf, C. A. (2012). Drawing inferences from multiple intervals in the single-factor design: Derivations, clarifications, extensions, and representations. Methodology European Journal of Research Methods for the Behavioral and Social Sciences, 8, 125-133.
}
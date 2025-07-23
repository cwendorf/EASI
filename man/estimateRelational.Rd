% File man/estimateRelational.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{estimateRelational}
\alias{estimateRelational}
\alias{estimateMeansRelational}
\title{Estimate Relational}
\description{Provides a table of arelational (confidence) and relational (comparative) intervals for each group or level mean.}

\usage{
\method{estimateRelational}{data.frame}(frame, conf.level=.95, ...)

\method{estimateRelational}{formula}(formula, conf.level=.95, ...)

\method{estimateRelational}{wsm}(moments, conf.level=.95, ...)

\method{estimateRelational}{bsm}(moments, conf.level=.95, ...)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{moments}{a matrix/frame of descriptive/summary statistics}
\item{conf.level}{confidence level of the interval}
}

\value{
The returned frame contains the following components:
\item{M}{the means for the variables or groups}
\item{CI.LL}{the lower limits of the confidence intervals of the means}
\item{CI.UL}{the upper limits of the confidence intervals of the means}
\item{RI.LL}{the lower limits of the relational intervals for the means}
\item{RI.UL}{the upper limits of the relational intervals for the means}
}

\references{
Wendorf, C. A. (2012). Drawing inferences from multiple intervals in the single-factor design: Derivations, clarifications, extensions, and representations. Methodology European Journal of Research Methods for the Behavioral and Social Sciences, 8, 125-133.
}
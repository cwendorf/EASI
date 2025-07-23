% File man/testInteraction.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{testInteraction}
\alias{testInteraction}
\alias{testMeansInteraction}
\title{Test Interaction}
\description{Provides the statistical significance tests for the simple effects and the interaction contrast in a 2x2 design.}

\usage{
\method{testInteraction}{data.frame}(frame, ...)

\method{testInteraction}{formula}(formula, ...)

\method{testInteraction}{bsm}(moments, ...)

\method{testInteraction}{wsm}(moments, corrs, conf.level=.95, ...)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{moments}{a list of matrices/frames of descriptive/summary statistics}
\item{corrs}{a list of matrices/frames of correlations}
\item{by}{a factor used for blocking}
}

\value{
The returned frame contains the following components:
\item{Est}{the contrast for the simple effects and the interaction}
\item{SE}{the standard errors for the simple effects and the interaction}
\item{df}{the degrees of freedom for the simple effects and the interaction}
\item{t}{the t value for the simple effects and the interaction}
\item{p}{the p value for the simple effects and the interaction}
}
% File man/testMeansInteraction.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{testMeansInteraction}
\alias{testMeansInteraction}
\alias{testInteraction}
\title{Test Means Interaction}
\description{Provides the statistical significance tests for the simple effects and the interaction contrast in a 2x2 design.}

\usage{
\method{testMeansInteraction}{default}(frame, main=NULL, digits=3)

\method{testMeansInteraction}{formula}(formula, main=NULL, digits=3)

\method{testMeansInteraction}{bss}(CompStats, main=NULL, digits=3)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{CompStats}{a matrix/frame of descriptive/summary statistics}
\item{by}{a factor used for blocking}
\item{main}{a custom title for the table}
\item{digits}{the specified number of decimal places}
}

\value{
The returned list contains two frames with the following components:    
\item{Est}{the contrast for the simple effects}
\item{SE}{the standard errors for the simple effects}
\item{df}{the degrees of freedom for the simple effects}
\item{t}{the t value for the simple effects}
\item{p}{the p value for the simple effects}
\item{Diff}{the interaction contrast}
\item{SE}{the standard error of the interaction contrast}
\item{df}{the degrees of the freedom for the interaction contrast}
\item{t}{the t value for the interaction contrast}
\item{p}{the p value for the interaction contrast}
}
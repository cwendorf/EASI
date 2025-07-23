% File man/describeFrequencies.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{describeFrequencies}
\alias{describeFrequencies}
\title{Describe Frequencies}
\description{Provides a frequency distributions for each variable or group.}

\usage{
\method{describeFrequencies}{default}(variable, ...)

\method{describeFrequencies}{data.frame}(frame, ...)

\method{describeFrequencies}{formula}(formula, ...)
}

\arguments{
\item{variable}{a numeric vector of data values}
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
}

\value{
The returned list contains a frame for each variable or group with the following components:    
\item{Freq}{the frequency of each value}
\item{Perc}{the relative frequency of each value}
\item{CumFreq}{the cumulative frequency of each value}
\item{CumPerc}{the cumulative relative frequency of each value}
}
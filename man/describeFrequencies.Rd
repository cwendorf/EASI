% File man/describeFrequencies.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{describeFrequencies}
\alias{describeFrequencies}
\title{Describe Frequencies}
\description{Provides a frequency distributions for each variable or group.}

\usage{
\method{describeFrequencies}{default}(frame, main=NULL, digits=3)

\method{describeFrequencies}{formula}(formula, main=NULL, digits=3)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{main}{a custom title for the table}
\item{digits}{the specified number of decimal places}
}

\value{
The returned list contains a frame for each variable or group with the following components:    
\item{Freq}{the frequency of each value}
\item{Perc}{the relative frequency of each value}
\item{CumFreq}{the cumulative frequency of each value}
\item{CumPerc}{the cumulative relative frequency of each value}
}
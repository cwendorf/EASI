% File man/focus.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{focus}
\alias{focus}
\title{Focus}
\description{Selects the variables or factor levels of the specified frame.}

\usage{
\method{focus}{data.frame}(frame, ...)

\method{focus}{formula}(formula, ...)

\method{focus}{wss}(DescStats, ...)

\method{focus}{bss}(DescStats, ...)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{DescStats}{a matrix/frame of descriptive/summary statistics}
\item{...}{a set of variables or factor levels to be analyzed}
}

\value{
If the provided element is a data frame or a frame of statistics, the function will return a subset frame of the specified variables/levels. If the provided element is a formula, the function will return an updated formula that specifies only the specified factor levels.
}
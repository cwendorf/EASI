% File man/construct.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{construct}
\alias{construct}
\title{Contruct}
\description{Construct a frame from vectors of data, summary statistics, or correlations.}

\usage{
\method{construct}{default}(..., class="data")
}

\arguments{
\item{...}{a set of vectors to combine into a frame}
\item{class}{specified class of the frame}
}

\value{
The returned frame contains a column for each variable (data), a row for each variable (bsm and wsm), and both columns and rows for each variable (cor).
}
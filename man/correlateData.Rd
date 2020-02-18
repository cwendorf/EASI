% File man/correlateData.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{correlateData}
\alias{correlateData}
\alias{corrData.default}
\title{Correlate Data}
\description{Provides a square matrix/frame of correlations for a data set.}

\usage{
# correlateData is a wrapper function. It will automatically call the method below.
correlateData(\dots,digits=3)

\method{corrData}{default}(\dots)

}

\arguments{
  \item{\dots}{a set of (non-empty) numeric vectors of data values.}
}

\examples{
Tutorials and examples from published work are available at https://cwendorf.github.io/EASI
}
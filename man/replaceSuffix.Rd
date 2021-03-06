% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/replaceSuffix.R
\name{replaceSuffix}
\alias{replaceSuffix}
\title{Replace suffix of the given file name with a new extension (suffix)}
\usage{
replaceSuffix(fileName, newSuffix)
}
\arguments{
\item{fileName}{A character vector with original filenames}

\item{newSuffix}{A new extension to replace old extensions in file names \code{fileName}}
}
\value{
A character vector with new file names with old extensions replaced with \code{newSuffix}
}
\description{
This helper function takes a file name \code{fileName}, removes an extension (a suffix)
from it and adds a new extension \code{newSuffix}.
}
\examples{
replaceSuffix('filename.Rmd', '.pdf')          # 'filename.pdf'
replaceSuffix(c('a.x', 'b.y', 'c.z'), '.csv')  # 'a.csv', 'b.csv', 'c.csv'
}
\author{
Michal Burda
}

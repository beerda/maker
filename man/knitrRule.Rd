% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/knitrRule.R
\name{knitrRule}
\alias{knitrRule}
\title{Rule for building text documents by using the knitr package}
\usage{
knitrRule(target, script, depends = NULL, params = list(), task = "all")
}
\arguments{
\item{target}{Name of the output file to be created}

\item{script}{Name of the RNW file to be rendered}

\item{depends}{A vector of file names that the markdown script depends on, or \code{NULL}.}

\item{params}{A list of R values that become available within the \code{script} in
a \code{params} variable.}

\item{task}{A character vector of parent task names. The mechanism of tasks allows to
group rules. Anything different from \code{'all'} will
cause creation of a new task depending on the given rule. Executing \verb{make taskname}
will then force building of this rule.}
}
\value{
Instance of S3 class \code{rmake.rule}
}
\description{
This rule is for execution of knitr in order to create the text file,
as described in \code{\link[=knitr:knit]{knitr:knit()}}.
}
\details{
This rule executes the following command in a separate R process:
\verb{library(knitr); params <- params; knitr::knit(script, output=target)}

That is, parameters given in the \code{params} argument are stored into the global variable
and then the \code{script} is processed with knitr. That is, the re-generation of the
\code{Makefile} with any change to \code{params} will not cause the re-execution of the recipe unless
any other script dependencies change.

Issuing \verb{make clean} from the shell causes removal of all files specified in \code{target} parameter.
}
\examples{
r <- knitrRule(target='report.tex',
               script='report.Rnw',
               depends=c('data1.csv', 'data2.csv'))

# generate the content of a makefile (as character vector)
makefile(list(r))

# generate to file
tmp <- tempdir()
makefile(list(r), file.path(tmp, "Makefile"))
}
\seealso{
\code{\link[=markdownRule]{markdownRule()}}, \code{\link[=rule]{rule()}}, \code{\link[=makefile]{makefile()}}, \code{\link[=rRule]{rRule()}}
}
\author{
Michal Burda
}

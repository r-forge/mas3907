% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/graphical_diagnostics.R
\name{diagnostics}
\alias{diagnostics}
\title{Graphical diagnostics for arrays of MCMC output.}
\usage{
diagnostics(mcmc, rows = 3, lag.max = 50, pool = FALSE, colours = NULL)
}
\arguments{
\item{mcmc}{A matrix with dimensions: iterations, parameters; or a three
dimensional array with dimensions: iterations, chains, parameters. The final
(i.e. parameter) component of the \code{dimnames} attribute of the matrix or
array should contain the parameter names.}

\item{rows}{A number indicating the number of parameters to plot per page on
the graphics device.}

\item{lag.max}{A number indicating the maximum lag for the ACF plots.}

\item{pool}{A logical. If \code{TRUE} the samples are pooled across chains
before generating the plots.}

\item{colours}{A vector indicating the colours to use to represent each chain.
Colours can be specified using any of the three kinds of R colour
specifications, i.e. a colour name (as listed by \code{colors()}), a
hexadecimal string of the form \code{"#rrggbb"} or \code{"#rrggbbaa"} or a
positive integer \code{i} meaning \code{palette()[i]}.}
}
\value{
\code{NULL}
}
\description{
This function generates graphical diagnostics for an array of MCMC output. such
For every parameter, a row of three plots is generated: a trace plot,
an ACF plot and a kernel density plot. If there is output from more than one
chain, the default behaviour is to overlay the plots for different chains in
different colours.
}
\examples{
srs = array(rnorm(8000), c(1000, 2, 4)) # Example for illustration only!
dimnames(srs) = list(NULL, NULL, paste("theta[",1:4,"]",sep=""))
diagnostics(srs)

}

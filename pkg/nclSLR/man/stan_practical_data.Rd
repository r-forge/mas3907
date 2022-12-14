% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/stan_practical_data.R
\docType{data}
\name{stan_practical_data}
\alias{stan_practical_data}
\title{Data for the practical: The Stan programming language.}
\usage{
data(stan_practical_data)
}
\value{
A list with 9 named elements:
\describe{
\item{y}{The response variable (log PSA).}
\item{n}{The sample size.}
\item{q}{The number of explanatory variables, plus one.}
\item{X}{The design matrix.}
\item{x_pred}{The explanatory variables for predicting an extra patient.}
\item{m_beta}{The prior means for beta.}
\item{s_beta}{The prior standard deviations for beta.}
\item{m_sigma_sq}{The prior mean for log(sigma_sq).}
\item{s_sigma_sq}{The prior standard deviations for log(sigma_sq).}}
}
\description{
A data set containing the list to pass as the data argument to the stan function
in the practical: The Stan programming language.
}
\examples{
data(stan_practical_data)
str(stan_practical_data)
}
\keyword{datasets}

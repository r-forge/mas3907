% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Boston.R
\docType{data}
\name{Boston}
\alias{Boston}
\title{Housing values in suburbs of Boston.}
\source{
Harrison, D. and Rubinfeld, D.L. (1978) Hedonic prices and the demand for 
clean air. \emph{J. Environ. Economics and Management} \bold{5}, 81--102.

Belsley D.A., Kuh, E. and Welsch, R.E. (1980) \emph{Regression Diagnostics.} 
\emph{Identifying Influential Data and Sources of Collinearity.} New York: 
Wiley.
}
\usage{
data(Boston, package="nclSLR")
}
\value{
This data frame contains the following columns:
\describe{
\item{lcrim}{Natural logarithm of the per capita crime rate by town.}
\item{zn}{Proportion of residential land zoned for lots over 25,000 sq.ft.}
\item{indus}{Proportion of non-retail business acres per town.}
\item{chas}{Charles River dummy variable (=1 if tract bounds river; =0 
otherwise).}
\item{nox}{Nitrogen oxides concentration (parts per 10 million).}
\item{rm}{Average number of rooms per dwelling.}
\item{age}{Proportion of owner-occupied units built prior to 1940.}
\item{disf}{A numerical vector representing an ordered categorical variable 
with four levels depending on the weighted mean of the distances to five 
Boston employment centres (=1 if distance < 2.5, =2 if 
2.5 <= distance < 5, =3 if 5 <= distance < 7.5, 
=4 if distance >= 7.5).}
\item{rad}{Index of accessibility to radial highways.}
\item{tax}{Full-value property-tax rate per $10,000.}
\item{pratio}{Pupil-teacher ratio by town.}
\item{black}{\eqn{1000(Bk - 0.63)^2} where \eqn{Bk} is the proportion of blacks by town.}
\item{lstat}{Lower status of the population (percent).}
\item{medv}{Median value of owner-occupied homes in $1000s.}}
}
\description{
The Boston data frame has 506 rows and 14 columns.
}
\examples{
data(Boston, package="nclSLR")
head(Boston)
}
\keyword{datasets}

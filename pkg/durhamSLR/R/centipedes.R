#' Counts of centipedes.
#'
#' A data set containing the counts of \emph{Lithobius forficatus}, more
#' commonly known as the brown or stone centipede, at each of 30 sites in
#' microhabitats of rotting wood. For each site, a number of soil and habitat
#' variables are recorded in addition to their altitude and geographical
#' coordinates.
#'
#' @name centipedes
#' @docType data
#' @usage data(centipedes)
#' @return A data frame with 30 rows and 10 variables. The data frame contains
#' the following columns:
#' \describe{
#' \item{site}{The abbreviated site name.}
#' \item{count}{The number of centipedes found at the site.}
#' \item{offset}{The area sampled at the site in square metres.}
#' \item{type}{A factor with two levels, \code{Synanthropic} and
#' \code{Deciduous}, which refer to the habitat in which the site was
#' located; either deciduous woods or ``synanthropic'' areas  associated
#' with human habitation, e.g. parks and gardens.}
#' \item{lorg}{The natural loagarithm of the percentage of organic matter in the soil.}
#' \item{lalt}{The natural loarithm of the altitude of the site in metres.}
#' \item{airt}{The air temperature in degrees Celcius.}
#' \item{soilt}{The soil temperature in degrees Celcius.}
#' \item{east}{The Easting of the site in tenths of a kilometre.}
#' \item{north}{The Northing of the site in tenths of a kilometre.}}
#' @source The complete data set, which involved more species of
#' centipede and more microhabitats, is described in Blackburn \emph{et al.} (2002).
#' @references
#' J. Blackburn and M. Farrow and W. Arthur (2002), Factors influencing the 
#' distribution, abundance and diversity of geophilomorph and lithobiomorph 
#' centipedes. \emph{Journal of Zoology}, \bold{256}, 221--232.
#' @keywords datasets
#' @examples
#' data(centipedes)
#' head(centipedes)
NULL

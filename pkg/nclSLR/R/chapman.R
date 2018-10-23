#' Chapman data.
#'
#' Data from a study on heart disease by Dr. John M. Chapman in the mid-twentieth
#' century. The data were taken from the Los Angeles Heart Study and comprise 
#' measurements from 200 male patients.
#' 
#' @name chapman
#' @docType data
#' @usage data(chapman)
#' @return A data frame with 200 rows and 7 variables. The data frame contains
#' the following columns:
#' \describe{
#' \item{age}{Patient's age; a numeric vector.}
#' \item{highbp}{Patient'systolic blood pressure; a numeric vector.}
#' \item{lowbp}{Patient's diastolic blood pressure; a numeric vector.}
#' \item{chol}{Patient's cholesterol; a numeric vector.}
#' \item{height}{Patient's height; a numeric vector.}
#' \item{weight}{Patient's weight; a numeric vector.}
#' \item{y}{A binary numeric vector which takes the value \code{1} if the 
#' patient experienced a coronory incident in the preceeding 10 years and
#' \code{0} otherwise.}}
#' @source The data were taken from the StatLib Datasets Archive at Carnegie 
#' Mellon University:
#' \url{https://lib.stat.cmu.edu/datasets/christensen-llm}.
#' @keywords datasets
#' @examples
#' data(chapman)
#' head(chapman)
NULL

#' Banknote authentication data.
#' 
#' Data extracted from images taken from genuine and forged banknotes, digitized 
#' into 400 x 400 arrays of pixels, and then summarised into four continuously 
#' valued summary statistics. For each banknote, the data set records whether the 
#' banknote was genuine or forged, along with the four numerical summaries of the 
#' image.
#'
#' @name banknotes
#' @docType data
#' @usage data(banknotes)
#' @return A data frame with 1372 rows and 5 variables. The data frame contains
#' the following columns:
#' \describe{
#' \item{variance}{Variance of Wavelet Transformed image.}
#' \item{skewness}{Skewness of Wavelet Transformed image.}
#' \item{kurtosis}{Kurtosis of Wavelet Transformed image.}
#' \item{entropy}{Entropy of image.}
#' \item{class}{A factor with two levels, \code{0} and \code{1}, which refer to 
#' whether the banknote was a forgery or real.}}
#' @source 
#' The data were taken from the UCI Machine Learning Repository:
#' \url{https://archive.ics.uci.edu/ml/datasets/banknote+authentication}.
#' @keywords datasets
#' @examples
#' data(banknotes)
#' head(banknotes)
NULL

#' Blood and other measurements in diabetics.
#'
#' Data collected in a study concerning patients with diabetes. The response 
#' variable of interest was disease progression one year after taking baseline 
#' measurements on various clinical variables. For each of n=442 patients, 
#' the data comprise a quantitative measure of disease progression (\code{dis}) 
#' and measurements on p=10 baseline (explanatory) variables: age (\code{age}), 
#' sex (\code{sex}), body mass index (\code{bmi}), average blood pressure 
#' (\code{map}) and six blood serum measurements (\code{tc}, \code{ldl}, 
#' \code{hdl}, \code{tch}, \code{ltg}, \code{glu}). The explanatory variables
#' have been transformed to have mean 0, with sum of squares equal to 1.
#' 
#' @name diabetes
#' @docType data
#' @usage data(diabetes)
#' @return A data frame with 442 rows and 11 variables. The data frame contains
#' the following columns:
#' \describe{
#' \item{age}{Age.}
#' \item{sex}{Gender.}
#' \item{bmi}{Body mass index.}
#' \item{map}{Average blood pressure.}
#' \item{tc}{Blood serum measurement 1.}
#' \item{ldl}{Blood serum measurement 2.}
#' \item{hdl}{Blood serum measurement 3.}
#' \item{tch}{Blood serum measurement 4.}
#' \item{ltg}{Blood serum measurement 5.}
#' \item{glu}{Blood serum measurement 6.}
#' \item{dis}{Quantitative measure of disease progression.}}
#' @source
#' \url{http://www-stat.stanford.edu/~hastie/Papers/LARS/LeastAngle_2002.ps}.
#' @references 
#' Efron, B., Hastie, T., Johnstone, I. and Tibshirani, R. (2004), Least Angle 
#' Regression (with discussion). \emph{Annals of Statistics}, \bold{32}, 407--499.
#' @keywords datasets
#' @examples
#' data(diabetes)
#' head(diabetes)
NULL

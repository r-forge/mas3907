#' MBA admissions data.
#'
#' Data on applicants to the Masters of Business Administration (MBA) programme of a US
#' business graduate school.
#'
#' @name admission
#' @docType data
#' @usage data(admission)
#' @return A data frame with 85 rows and 3 variables. The data frame contains
#' the following columns:
#' \describe{
#' \item{GPA}{The applicant's grade point average (GPA) on a 0.0 - 4.0 scale.}
#' \item{GMAT}{The applicant's graduate management admission test (GMAT) score
#' on a 200 - 800 scale.}
#' \item{decision}{A factor with three levels, \code{admit}, \code{border} and
#' \code{notadmit}, which refer to the category to which the student was assigned by
#' admissions tutors (admit, borderline or do not admit).}}
#' @source The data were taken from Johnson and Wichern (2008).
#' @references
#' Johnson, R.A and Wichern, D.W. (2008) \emph{Applied Multivariate Statistical}
#' \emph{Analysis, Sixth Edition.} Pearson.
#' @keywords datasets
#' @examples
#' data(admission)
#' head(admission)
NULL

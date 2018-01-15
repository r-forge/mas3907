#' @title Perform Mahalanobis transformation.
#'
#' @description
#' This function performs the Mahalanobis transformation on a data matrix.
#'
#' @param X A data matrix.
#'
#' @return The transformed data matrix.
#'
#' @examples
#' data(heptathlon)
#' mahalanobis_scale(heptathlon)
#'
#' @export
mahalanobis_scale = function(X) {
  W = scale(X, scale=F)
  decomp = svd(W)
  return(decomp$u %*% t(decomp$v) * sqrt(nrow(X)-1))
}

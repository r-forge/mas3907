#' Linear Discriminant Analysis
#'
#' Performs a Linear Discriminant Analysis
#'
#' When \code{validation=NULL} there is no validation \cr When
#' \code{validation="crossval"} cross-validation is performed by randomly
#' separating the observations in ten groups. \cr When
#' \code{validation="learntest"} validation is performed by providing a
#' learn-set and a test-set of observations. \cr
#'
#' @param variables matrix or data frame with explanatory variables
#' @param group vector or factor with group memberships
#' @param prior optional vector of prior probabilities. Default
#' \code{prior=NULL} implies group proportions
#' @param validation type of validation, either \code{"crossval"} or
#' \code{"learntest"}. Default \code{NULL}
#' @param learn optional vector of indices for a learn-set. Only used when
#' \code{validation="learntest"}. Default \code{NULL}
#' @param test optional vector of indices for a test-set. Only used when
#' \code{validation="learntest"}. Default \code{NULL}
#' @param prob logical indicating whether the group classification results
#' should be expressed in probability terms
#' @return An object of class \code{"linda"}, basically a list with the
#' following elements:
#' @return \item{functions}{table with discriminant functions}
#' @return \item{confusion}{confusion matrix}
#' @return \item{scores}{discriminant scores for each observation}
#' @return \item{classification}{assigned class}
#' @return \item{error_rate}{misclassification error rate}
#' @author Gaston Sanchez
#' @seealso \code{\link{quaDA}}
#' @references Lebart L., Piron M., Morineau A. (2006) \emph{Statistique
#' Exploratoire Multidimensionnelle}. Dunod, Paris.
#'
#' Saporta G. (2006) \emph{Probabilites, analyse des donnees et statistique}.
#' Editions Technip, Paris.
#'
#' Tuffery S. (2011) \emph{Data Mining and Statistics for Decision Making}.
#' Wiley, Chichester.
#' @export
#' @examples
#'
#'   \dontrun{
#'   # load iris dataset
#'   data(iris)
#'
#'   # linear discriminant analysis with no validation
#'   my_lin1 = linDA(iris[,1:4], iris$Species)
#'   my_lin1$confusion
#'   my_lin1$error_rate
#'
#'   # linear discriminant analysis with cross-validation
#'   my_lin2 = linDA(iris[,1:4], iris$Species, validation="crossval")
#'   my_lin2$confusion
#'   my_lin2$error_rate
#'
#'   # linear discriminant analysis with learn-test validation
#'   learning = c(1:40, 51:90, 101:140)
#'   testing = c(41:50, 91:100, 141:150)
#'   my_lin3 = linDA(iris[,1:4], iris$Species, validation="learntest", learn=learning, test=testing)
#'   my_lin3$confusion
#'   my_lin3$error_rate
#'   }
#'
linDA <-
  function(variables, group, prior = NULL, validation = NULL,
           learn = NULL, test = NULL, prob = FALSE)
  {
    # Perform a linear discriminant analysis
    # variables: matrix or data.frame with explanatory variables
    # group: vector or factor with group membership
    # prior: vector of prior probabilities (NULL = proportions)
    # validation: NULL, "crossval", "learntest"
    # learn: vector of learn-set
    # test: vector of test-set
    # prob: logical indicating results in probability terms

    # check inputs
    verify_Xy = my_verify(variables, group, na.rm=FALSE)
    X = verify_Xy$X
    y = verify_Xy$y
    # type of validation
    if (is.null(validation)) {
      validation = "none"
    } else {
      vali = validation %in% c("crossval", "learntest")
      if (!vali)
        stop("nIncorrect type of validation")
    }

    # how many observations
    n = nrow(X)
    # how many variables
    p = ncol(X)
    # how many groups
    ng = nlevels(y)
    # how many obs in each group
    nobs_group = as.vector(table(y))
    # proportion obs in each group
    props = nobs_group / n
    # prior probabilities
    if (!is.null(prior))
    {
      if (!is.numeric(prior) || !is.vector(prior))
        stop("\n'prior' probabilities incorrectly defined")
      if (length(prior) != ng)
        stop("\n'prior' probabilities don't match number of groups")
      if (any(prior > 1) || any(prior < 0))
        stop("'prior' probabilities must range between [0,1]")
      if (round(sum(prior), 5) != 1)
        stop("'prior' probabilities don't add to 1")
    } else {
      # prior as proportions
      prior = props
    }
    # group levels
    glevs = levels(y)

    ## linDA with no validation
    if (validation == "none") {
      get_linda = my_linDA(X, y, 1:n, 1:n, prior, prob)
      err = 1 - sum(diag(get_linda$conf)) / n
    }

    ## linDA with learn-test sets validation
    if (validation == "learntest")
    {
      if (any(learn) <= 0 || any(learn) > n)
        stop("\nsubscript out of bounds in 'learn' set")
      if (any(test) <= 0 || any(test) > n)
        stop("\nsubscript out of bounds in 'test' set")
      # apply linDA
      get_linda = my_linDA(X, y, learn, test, prior, prob)
      # misclassification error rate
      err = 1 - sum(diag(get_linda$conf))/length(test)
    }

    ## linDA with crossvalidation
    if (validation == "crossval")
    {
      # linDA for all observations
      get_linda = my_linDA(X, y, 1:n, 1:n, prior, prob)
      # elements in each group
      elems_group = vector("list", ng)
      for (k in 1:ng) {
        elems_group[[k]] = which(group == glevs[k])
      }
      # misclassification error rate
      mer = 0
      # 10 crossvalidation samples
      for (r in 1:10)
      {
        test = vector("list", ng)
        test_sizes = floor(n * props / 10)
        for (k in 1:ng) {
          test[[k]] = sample(elems_group[[k]], test_sizes[k])
        }
        test = unlist(test)
        learn = (1:n)[-test]
        # apply linDA
        linda_cv = my_linDA(X, y, learn, test, prior, prob)
        # misclassification error rate
        mer = mer + sum(diag(linda_cv$conf))/ n
      }
      # total misclassification error rate
      err = 1 - mer
    }

    ## specifications
    specs = list(n=n, p=p, ng=ng, glevs=glevs,
                 nobs_group=nobs_group, validation=validation)
    ## results
    structure(list(functions = get_linda$FDF,
                   confusion = get_linda$conf,
                   scores = get_linda$Disc,
                   classification = get_linda$pred_class,
                   error_rate = err,
                   specs = specs),
              class = "linda")
  }

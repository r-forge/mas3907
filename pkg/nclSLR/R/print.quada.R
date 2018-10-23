#' @method print quada
#' @export
print.quada <-
  function(x, ...)
  {
    cat("\nQuadratic Discriminant Analysis\n")
    cat(rep("-",41), sep="")
    cat("\n$functions       ", "discriminant functions")
    cat("\n$confusion       ", "confusion matrix")
    cat("\n$scores          ", "discriminant scores")
    cat("\n$classification  ", "assigned class")
    cat("\n$error_rate      ", "error rate\n")
    cat(rep("-",41), sep="")
    cat("\n\n$functions\n")
    if(!is.null(x$functions)) print(x$functions)
    else cat("Not requested.\n\n")
    cat("$confusion\n")
    print(x$confusion, print.gap=2)
    cat("\n\n$error_rate\n")
    print(x$error_rate)
    cat("\n\n$scores\n")
    print(head(x$scores), print.gap=2)
    cat("...\n")
    cat("\n$classification\n")
    print(head(x$classification))
    cat("...\n")
    invisible(x)
  }

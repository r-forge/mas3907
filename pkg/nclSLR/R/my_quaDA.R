my_quaDA <-
  function(X, y, learn, test, prior, prob, functions)
  {
    # Perform a quadratic discriminant analysis
    # X: matrix or data.frame with explanatory variables
    # y: vector or factor with group membership
    # learn: vector of learning observations
    # test: vector of testing observations
    # prior: vector of prior proportions
    # prob: logical indicating results in proability terms

    # how many observations
    n = nrow(X[learn,,drop=FALSE])
    ntest = length(test)
    # how many variables
    p = ncol(X)
    # how many groups
    ng = nlevels(y[learn])
    glevs = levels(y[learn])
    # how many obs in each group
    gobs = as.vector(table(y[learn]))
    names(gobs) = glevs
    if (any(gobs < p+1))
      stop("\nsome group category is too small for quaDA")

    # group means
    GM = my_groupMeans(X[learn,,drop=FALSE], y[learn])
    # within matrices based on QR decomposition
    WMqr = as.list(1:ng)
    # object to store log-determinants
    ldet = numeric(ng)
    # calculate ingredients
    for (k in 1:ng)
    {
      nk = gobs[k] - 1
      # center data
      Xcen = scale(X[learn,,drop=FALSE][unclass(y[learn])==k,,drop=FALSE], center=GM[k,], scale=FALSE)
      # QR decomposition
      qx = qr(Xcen / sqrt(nk) )
      if(qx$rank < p)
        stop("rank deficiency in group ", glevs[k])
      qx = qx$qr
      WMqr[[k]] = backsolve(qx[1:p, ], diag(p))
      ldet[k] = 2*sum(log(abs(diag(qx))))
    }
    ## discriminant functions
    if(functions) {
      funs = list()
      for (k in 1:ng)
      {
       sig_inv =  WMqr[[k]] %*% t(WMqr[[k]])
       funs[[k]] = list()
       tmp = matrix(0, p, p)
       tmp[upper.tri(tmp, diag=FALSE)] = sig_inv[upper.tri(sig_inv, diag=FALSE)]
       diag(tmp) = -0.5 * diag(sig_inv)
       colnames(tmp) = colnames(X); rownames(tmp) = colnames(X)
       funs[[k]]$quadratic = tmp
       funs[[k]]$linear = as.numeric(t(GM[k,]) %*% sig_inv)
       names(funs[[k]]$linear) = colnames(X)
       funs[[k]]$constant = -0.5 * sum(funs[[k]]$linear * GM[k,]) -
         0.5 * ldet[k] + log(prior[k])
      }
    } else funs = NULL

    ## classifcation
    # discrimination matrix to store results
    Disc <- matrix(0, nrow = ntest, ncol = ng)
    # calculate distances (the lower, the better)
    for (k in 1:ng)
    {
      Xk = matrix(GM[k,], ntest, p, byrow = TRUE)
      dev = (X[test,,drop=FALSE] - Xk) %*% WMqr[[k]]
      Disc[,k] = 0.5 * rowSums(dev^2) + 0.5 * ldet[k] - log(prior[k])
    }

    # assignment in terms of probability?
    if (prob)
    {
      # Disc in terms of probability
      Disc <- exp( -(Disc - apply(Disc, 1, min, na.rm=TRUE)))
      # predicting classes
      pred = Disc / drop(Disc %*% rep(1, ng))
      # predicted class
      pred_class = factor(max.col(pred), levels=seq_along(glevs), labels=glevs)
    } else {
      # predicted class
      pred = apply(Disc, 1, function(u) which(u == min(u)))
      names(pred) = NULL
      pred_class = factor(pred, levels=seq_along(glevs), labels=glevs)
    }
    dimnames(Disc) = list(rownames(X[test,,drop=FALSE]), glevs)
    # confusion matrix
    conf = table(original=y[test], predicted=pred_class)

    ## results
    res = list(WMqr = WMqr, GM = GM, ldet = ldet, prior = prior,
               Disc = Disc,
               pred_class = pred_class,
               conf = conf,
               functions = funs)
    res
  }

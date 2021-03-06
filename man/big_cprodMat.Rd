% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils-mult.R
\name{big_cprodMat}
\alias{big_cprodMat}
\title{Cross-product with a matrix}
\usage{
big_cprodMat(X, A.row, ind.row = rows_along(X), ind.col = cols_along(X),
  ncores = 1, block.size = block_size(nrow(X), ncores))
}
\arguments{
\item{X}{A \link[=FBM-class]{FBM}.}

\item{A.row}{A matrix with \code{length(ind.row)} rows.}

\item{ind.row}{An optional vector of the row indices that are used.
If not specified, all rows are used. \strong{Don't use negative indices.}}

\item{ind.col}{An optional vector of the column indices that are used.
If not specified, all columns are used. \strong{Don't use negative indices.}}

\item{ncores}{Number of cores used. Default doesn't use parallelism.
You may use \link{nb_cores}.}

\item{block.size}{Maximum number of columns read at once.
Default uses \link{block_size}.}
}
\value{
\eqn{X^T \cdot A}.
}
\description{
Cross-product between a Filebacked Big Matrix and a matrix.
}
\examples{
X <- big_attachExtdata()
n <- nrow(X)
m <- ncol(X)
A <- matrix(0, n, 10); A[] <- rnorm(length(A))

test <- big_cprodMat(X, A)
true <- crossprod(X[], A)
all.equal(test, true)

# subsetting
ind.row <- sample(n, n/2)
ind.col <- sample(m, m/2)

tryCatch(test2 <- big_cprodMat(X, A, ind.row, ind.col),
         error = function(e) print(e))
# returns an error. You need to use the subset of A:
test2 <- big_cprodMat(X, A[ind.row, ], ind.row, ind.col)
true2 <- crossprod(X[ind.row, ind.col], A[ind.row, ])
all.equal(test2, true2)

}

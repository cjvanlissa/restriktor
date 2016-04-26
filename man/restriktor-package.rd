\name{restriktor}
\alias{restriktor-package}
\title{Package for equality and inequality constrained estimation and hypothesis testing}
\description{
Package \code{restriktor} implements estimation, and testing linear equality and 
inequality constraints about parameters and effects for multivariate (robust) 
normal models.}

\details{
  \tabular{ll}{
  Package: \tab restriktor\cr
  Type: \tab Package\cr
  Version: \tab 0.1-24\cr
  Date: \tab 2016-04-25\cr
  License: \tab GPL (>=2)\cr
  LazyLoad: \tab yes\cr
  }
  
  Function \code{restriktor} estimates the parameters of a linear model (lm) or robust
  linear model (rlm) subject to equality and/or inequality constraints. The function 
  offers the possibility to compute model robust standard errors under the 
  constraints. The parameters estimates can also be bootstrapped, where 
  bootstrapped standard errors and confidence intervals are available via the 
  summary function. Moreover, the function computes the Generalized Order-restricted
  Information Criterion (GORIC), which is a modification of the AIC and the ORIC.
  
  Function \code{conTest} conducts constrained hypothesis tests. Wald-, score and
  LRT test-statistics are available for both lm and rlm. The null-distribution
  of these test-statistics take the form of a mixture of chi-square distributions. 
  These mixing weights can be computed using the multivariate normal distribution
  function. The function also offers the possibility to bootstrap the 
  test-statistics. Parameters estimates under the hypotheses are available from the 
  summary function. 
  
  The package makes use of various other R packages: \pkg{quadprog} is used for 
  constrained estimation, \pkg{boot} for bootstrapping, \pkg{ic.infer} for 
  computing the weights based on the multivariate normal distribution, \pkg{lavaan}
  for parsing the constraint syntax, \pkg{MASS} for the psi.bisquare loss function,
  and \pkg{zoo} for computing sandwich estimators. 
}

\value{
  The output of function \code{restriktor} belongs to S3 class \code{conLM} or \code{conRLM}.  
  
  The output of function \code{conTest} belongs to S3 class \code{conTest}. 
  
  These classes offer print and summary methods. 
}

\section{Acknowledgements}{
  This package uses as an internal function the function \code{nchoosek} from 
  \pkg{ic.infer}, which is originally from \pkg{vsn}, authored by Wolfgang Huber, 
  available under LGPL. 
  
  The output of the summary function for the \code{conTest} function is largely 
  based on the summary of the \code{ic.test} function from the \pkg{ic.infer} 
  package.
  
  It also uses functions from the \code{rlm.default} function in the \pkg{MASS} 
  package.  
}


\examples{
# unrestricted linear model for ages (in months) at which an infant starts to 
# walk alone.
DATA <- ZelazoKolb1972
idx <- which(DATA$Group == 3)
DATA <- DATA[-idx, ]
DATA$Group <- factor(DATA$Group)

fit.lm <- lm(Age ~ Group, data = DATA)
summary(fit.lm)

# restrikted linear model with restriktions that the walking exercises would 
# not have a negative effect of increasing the mean age at which a child starts 
# to walk. 

fit.con <- restriktor(fit.lm, constraints = "Group2 > 0; Group2 < Group4")
summary(fit.con)
}

\references{
    Groemping, U. (2010). Inference With Linear Equality And Inequality
    Constraints Using R: The Package ic.infer. \emph{Journal of Statistical 
    Software}, Forthcoming. 

    Kuiper R.M., Hoijtink H., Silvapulle M.J. (2011). An Akaike-type Information
    Criterion for Model Selection Under Inequality Constraints. \emph{Biometrika}, 
    \bold{98}, 495--501.

    Kuiper R.M., Hoijtink H., Silvapulle M.J. (2012). Generalization of the 
    Order-Restricted Information Criterion for Multivariate Normal Linear Models. 
    \emph{Journal of Statistical Planning and Inference}, \bold{142}, 2454--2463. 
    doi:10.1016/j.jspi.2012.03.007.
    
    Robertson T, Wright F, Dykstra R (1988). \emph{Order-Restricted Inference}. 
    Wiley, New York.

    Schoenberg, R. (1997). Constrained Maximum Likelihood. \emph{Computational 
    Economics}, \bold{10}, 251--266.

    Shapiro, A. (1988). Towards a unified theory of inequality-constrained 
    testing in multivariate analysis. \emph{International Statistical Review} 
    \bold{56}, 49--62.
    
    Silvapulle, M. (1992a). Robust tests of inequality constraints and one-sided 
    hypotheses in the linear model. \emph{Biometrika}, \bold{79}, 621--630.

    Silvapulle, M. (1992b). Robust wald-type tests of one-sided hypotheses in 
    the linear model. \emph{Journal of the American Statistical Association}, 
    \bold{87}, 156--161.

    Silvapulle, M. (1996). Robust bounded influence tests against one-sided 
    hypotheses in general parametric models. \emph{Statistics & probability 
    letters}, \bold{31}, 45--50.
    
    Silvapulle, M.J. and Sen, P.K. (2005). \emph{Constrained Statistical Inference}. 
    Wiley, New York}

\author{ Leonard Vanbrabant and Yves Rosseel - Ghent University}
\seealso{ 
See also \code{\link{restriktor}}, \code{\link{conTest}}, 
          packages \pkg{boot}, \pkg{ic.infer}, \pkg{mvtnorm}, \pkg{quadprog}, 
          and \pkg{goric}
}

\keyword{ models }
\keyword{ regression }
\keyword{ multivariate }
\name{installcmd}
\alias{installcmd}
\title{ Installation command }
\description{
  Function generates installation command for a given installed package. Installation command points to a github page of a package.
}
\usage{
installcmd(pkg = "pkgup")
}
\arguments{
  \item{pkg}{ Character, default \code{"pkgup"}. A package name for which we want to generate installation command. }
}
\value{
  Object of class \code{installcmd} is returned.
}
\seealso{\code{\link{print.installcmd}}}
\examples{
installcmd("pkgup")
}
\keyword{ data }

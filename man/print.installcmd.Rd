\name{print.installcmd}
\alias{print.installcmd}
\title{ susy installcmd method }
\description{
  Prints installation command for \code{installcmd} object.
}
\usage{
  \method{print}{installcmd}(x, \dots)
}
\arguments{
  \item{x}{ An \code{installcmd} object. }
  \item{\dots}{ Ignored. }
}
\value{
  Returns \code{x} invisibly. Display output to console as a side effect.
}
\seealso{\code{\link{installcmd}}}
\examples{
cmd = installcmd("pkgup")
print(cmd)
}
\keyword{ data }

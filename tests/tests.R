library(pkgup)

cmd = installcmd()

stopifnot(all.equal(
  unclass(cmd),
  sprintf('install.packages("pkgup", repos=c("https://jangorecki.github.io/pkgup/","%s"))', getOption("repos"))
))

stopifnot(all.equal(
  capture.output(print(cmd)),
  sprintf('install.packages("pkgup", repos=c("https://jangorecki.github.io/pkgup/","%s"))', getOption("repos"))
))

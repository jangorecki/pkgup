library(pkgup)

cmd = installcmd()

stopifnot(all.equal(
  unclass(cmd),
  'install.packages("pkgup", repos=c("https://jangorecki.github.io/pkgup","https://cloud.r-project.org"))'
))

stopifnot(all.equal(
  capture.output(print(cmd)),
  'install.packages("pkgup", repos=c("https://jangorecki.github.io/pkgup","https://cloud.r-project.org"))'
))

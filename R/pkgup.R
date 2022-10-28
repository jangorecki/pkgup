dcf.field = function(dcf, field) {
  if (field %in% colnames(dcf))
    trimws(strsplit(gsub("\n", " ", dcf[,field][[1L]], fixed=TRUE), ",")[[1L]])
  else
    character()
}

installcmd = function(pkg = "pkgup") {
  dcf = read.dcf(system.file("DESCRIPTION", package=pkg))
  pkg = dcf[,"Package"][[1L]]
  repos = grep("github.io", dcf.field(dcf, "URL"), value=TRUE)
  if (length(repos) > 1L) repos = repos[1L] ## take first github.io url
  repos = c(repos, dcf.field(dcf, "Additional_repositories"))
  repos = unique(c(repos, getOption("repos"))) ## could omit if package.dcf returns length 0
  x = sprintf('install.packages("%s", repos=c(%s))', pkg, paste0('"', repos, '"', collapse=","))
  class(x) = "installcmd"
  x
}

print.installcmd = function(x, ...) {
  cat(unclass(x), "\n", sep="")
}

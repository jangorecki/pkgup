.PHONY : clean build install doc repo

srcpath = $(wildcard ls -1t pkgup_*.tar.gz | head -n 1)

all:
	make clean
	make build
	make public

clean:
	rm -f $(srcpath)
	rm -rf pkgup.Rcheck
	rm -rf doc .pkgup/doc
	rm -rf .pkgup/repo
	rm -rf public
	
build:	
	R CMD build .
	
check:
	R CMD check --as-cran --no-manual $(srcpath)

install:
	R CMD INSTALL $(srcpath)

doc:
	rm -rf .pkgup/doc
	mkdir -p .pkgup/doc/vignettes
	rsync -r --exclude 'doc' --exclude 'repo' .pkgup/* .pkgup/doc/
	cp -r vignettes/* .pkgup/doc/vignettes/
	Rscript -e 'litedown::fuse_site(".pkgup/doc")'
	#ls -aR .pkgup/doc

repo:
	rm -rf .pkgup/repo
	mkdir -p .pkgup/repo/src/contrib
	mv "$(srcpath)" .pkgup/repo/src/contrib
	Rscript -e 'tools::write_PACKAGES(".pkgup/repo/src/contrib", fields="Revision")'
	#ls -aR .pkgup/repo
	
public: install doc repo
	mkdir -p public
	cp -r .pkgup/repo/* public
	rsync -ravz --include '*/' --include='*.html' --exclude='*' .pkgup/doc/ public/
	#ls -aR public

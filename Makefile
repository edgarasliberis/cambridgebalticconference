.PHONY: all cbc2013 cbc2014 root deploy deploy-dev dirs

all: cbc2013 cbc2014 root
	cp -rT out/root out/cbcdev
	cp -rT out/2014 out/cbcdev/2014
	cp -rT out/2013 out/cbcdev/2013
	cp root_static/* out/cbcdev/
	cp root_static/.htaccess out/cbcdev/

root:
	staticjinja build --srcpath=root/ --outpath=out/root/ --static=static

cbc2013:
	staticjinja build --srcpath=2013/ --outpath=out/2013/ --static=static

cbc2014:
	staticjinja build --srcpath=2014/ --outpath=out/2014/ --static=static

deploy-dev: all
	rsync -av out/cbcdev/ emerald.antanas.org:/home/uranium/cbcdev

deploy: all
	rsync -av out/cbcdev/ /societies/culs/public_html/cambridgebalticconference.eu

dirs:
	mkdir -p out/root/
	mkdir -p out/2013/
	mkdir -p out/2014/

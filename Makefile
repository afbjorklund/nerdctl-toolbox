
prefix = /usr/local

all:

.nerdbox: nerdbox
	sed -e 's|$$(dirname $$0)|$(prefix)/share/nerdbox|' \
	<nerdbox >.nerdbox && chmod +x .nerdbox

install: .nerdbox
	mkdir -p $(DESTDIR)$(prefix)/bin
	install .nerdbox $(DESTDIR)$(prefix)/bin/nerdbox
	@rm .nerdbox
	mkdir -p $(DESTDIR)$(prefix)/share/nerdbox
	cp -pR templates $(DESTDIR)$(prefix)/share/nerdbox

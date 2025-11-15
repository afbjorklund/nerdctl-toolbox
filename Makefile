
prefix = /usr/local

TOOLBOX ?= toolbox

all:

.$(TOOLBOX): toolbox
	sed -e 's|$$(dirname $$0)|$(prefix)/share/$(TOOLBOX)|' \
	<$< >$@ && chmod +x $@

.$(TOOLBOX).1: toolbox.1
	sed -e 's/^.B toolbox$$/.B $(TOOLBOX)/' \
	<$< >$@

install: .$(TOOLBOX) .$(TOOLBOX).1
	mkdir -p $(DESTDIR)$(prefix)/bin
	install .$(TOOLBOX) $(DESTDIR)$(prefix)/bin/$(TOOLBOX)
	rm .$(TOOLBOX)
	mkdir -p $(DESTDIR)$(prefix)/share/man/man1
	cp -pR .$(TOOLBOX).1 $(DESTDIR)$(prefix)/share/man/man1/$(TOOLBOX).1
	rm .$(TOOLBOX).1
	mkdir -p $(DESTDIR)$(prefix)/share/$(TOOLBOX)
	cp -pR templates $(DESTDIR)$(prefix)/share/$(TOOLBOX)

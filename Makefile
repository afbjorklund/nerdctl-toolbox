
prefix = /usr/local

TOOLBOX ?= toolbox

all:

.$(TOOLBOX): $(TOOLBOX)
	sed -e 's|$$(dirname $$0)|$(prefix)/share/$(TOOLBOX)|' \
	<$< >$@ && chmod +x $@

install: .$(TOOLBOX)
	mkdir -p $(DESTDIR)$(prefix)/bin
	install .$(TOOLBOX) $(DESTDIR)$(prefix)/bin/$(TOOLBOX)
	@rm .$(TOOLBOX)
	mkdir -p $(DESTDIR)$(prefix)/share/$(TOOLBOX)
	cp -pR templates $(DESTDIR)$(prefix)/share/$(TOOLBOX)

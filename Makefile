HOMEBREW := /opt/homebrew/bin/brew
STOW := $(which stow)
.PHONY: install link

install:
	$(HOMEBREW) bundle

link:
	stow --target $${HOME} -v home

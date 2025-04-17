.PHONY: superprint brew bundle link github

superprint:
	sudo cp /etc/pam.d/sudo_local.template /etc/pam.d/sudo_local
	sudo sed -i '' -e 's/^#auth/auth/' /etc/pam.d/sudo_local

brew:
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

bundle:
	brew bundle

link:
	$(STOW) --target $${HOME} -v home

github:
	gh auth login --git-protocol=ssh --hostname=github.com --web

default: superprint brew bundle link github

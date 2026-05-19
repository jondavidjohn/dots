.PHONY: default superprint brew bundle link alfred github

default: superprint brew bundle link alfred github

superprint:
	sudo cp /etc/pam.d/sudo_local.template /etc/pam.d/sudo_local
	sudo sed -i '' -e 's/^#auth/auth/' /etc/pam.d/sudo_local

brew:
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

bundle:
	/opt/homebrew/bin/brew bundle

link:
	/opt/homebrew/bin/stow --target $${HOME} -v home

github:
	/opt/homebrew/bin/gh auth login --git-protocol=ssh --hostname=github.com --web

alfred:
	./scripts/alfred-prefs.sh

## New Machine Setup

1. Install git

```
xcode-select --install
```

2. Clone this repo

```
git clone https://github.com/jondavidjohn/dots.git ~/Code/jondavidjohn/dots
cd ~/Code/jondavidjohn/dots
```

3. Run make

```
make
```

## Make Targets

### `superprint`

Enables Touch ID for sudo authentication. Copies the system-provided
`sudo_local.template` into place and uncomments the `auth` line to activate
the `pam_tid.so` module.

### `brew`

Installs [Homebrew](https://brew.sh) using the official install script.

### `bundle`

Runs `brew bundle` to install all formulae, casks, and Mac App Store apps
defined in the `Brewfile`.

### `link`

Uses [GNU Stow](https://www.gnu.org/software/stow/) to symlink the contents
of `home/` into `$HOME`, setting up dotfile configurations (shell, editor,
git, etc.).

### `github`

Authenticates with GitHub via the `gh` CLI using SSH protocol and web-based
login. This establishes SSH keys for push/pull access to repositories.

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

## Make Tasks

All tasks below are executed in order by running bare `make`.

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

### `alfred`

Configures Alfred to use the synced preferences bundle from this repo. Reads
or creates `~/Library/Application Support/Alfred/prefs.json` and sets the
`current` path and sync folder to `~/.config/alfred`.

## Post-Setup (Manual)

Steps to complete by hand after `make` finishes:

1. **1Password** — Sign in to your account and install the Chrome extension.

2. **Disable Spotlight shortcuts** — System Settings → Keyboard → Keyboard
   Shortcuts → Spotlight → uncheck "Show Spotlight search" (⌘Space) to free
   it for Alfred.

3. **Alfred** — Enter Powerpack license (stored in 1Password). Configure
   appearance, set activation shortcut to ⌘Space, and enable clipboard history.

4. **Karabiner-Elements** — Grant accessibility permissions when prompted in
   System Settings → Privacy & Security → Accessibility.

5. **GitHub SSH** — Once logged into GitHub in the browser, run:
   ```
   make github
   ```

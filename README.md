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

4. **1Password** — Sign in to your account and install the
   [Chrome extension](https://chromewebstore.google.com/detail/1password-%E2%80%93-password-manag/aeblfdkhhhdcdjpifhhbdiojplfjncoa).

5. **Disable Spotlight shortcuts** — System Settings → Keyboard → Keyboard
   Shortcuts → Spotlight → uncheck "Show Spotlight search" (⌘Space) to free
   it for Alfred.

6. **Alfred** — Enter Powerpack license (stored in 1Password). Configure
   appearance, set activation shortcut to ⌘Space, and enable clipboard history.

7. **Karabiner-Elements** — Grant accessibility permissions when prompted in
   System Settings → Privacy & Security → Accessibility.

8. **GitHub SSH** — Once logged into GitHub in the browser, run:
   ```
   make github
   ```

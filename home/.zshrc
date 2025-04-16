export EDITOR=nvim
ulimit -n 10000

# Emacs mode for a more bash like experience
bindkey -e

# Stop underlining directories
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Autosuggestion style (faint grey for suggestions)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=243"

# Zinit Setup
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Zinit Plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions

# History settings for Autosuggestion
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion Styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':completion:*:*:*:default' menu yes select search
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Aliases
alias tree='tree --dirsfirst -C'
alias ls='ls --color'
alias ll='ls -lh'
alias l='ll'
alias lla='ll -A'
alias la='lla'
alias vi='vim'
alias gtop='cd $(git rev-parse --show-toplevel || echo ".")'
alias ag='ag --ignore=_site --ignore=log --ignore=vendor --ignore=tmp --smart-case --literal'
alias pubkey='cat ~/.ssh/id_rsa.pub'
alias mux='tmuxinator'
alias be="bundle exec"

# Pathing
eval "$(/opt/homebrew/bin/brew shellenv)"
HOMEBREW_ROOT=/opt/homebrew
export HOMEBREW_NO_ANALYTICS=1

export NVM_DIR="$HOME/.nvm"
[ -s "$HOMEBREW_ROOT/opt/nvm/nvm.sh" ] && . "$HOMEBREW_ROOT/opt/nvm/nvm.sh"  # This loads nvm

# more PATH adjustments
export PATH=$PATH:$HOME/bin # user bin directory
export PATH=$PATH:$HOME/.rbenv/bin # rbenv bin

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

export GOROOT_BOOTSTRAP=$GOROOT
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

eval "$(rbenv init -)"

export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# Zoxide init
eval "$(zoxide init zsh --cmd cd)"

# Prompt init
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/config.toml)"
fi

# Fzf integration
eval "$(fzf --zsh)"

#determines search program for fzf
if type ag &> /dev/null; then
    export FZF_DEFAULT_COMMAND='ag -p ~/.gitignore -g ""'
fi

#refer rg over ag
if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden'
fi

source $HOME/.zsh_secrets

[[ -s "/Users/jon/.gvm/scripts/gvm" ]] && source "/Users/jon/.gvm/scripts/gvm"

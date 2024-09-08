# config
setopt AUTO_CD
setopt INTERACTIVE_COMMENTS
setopt HIST_FCNTL_LOCK
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY
unsetopt AUTO_REMOVE_SLASH
unsetopt HIST_EXPIRE_DUPS_FIRST
unsetopt EXTENDED_HISTORY

# PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$PNPM_HOME:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$BUN_HOME:$PATH
export PATH="$BUN_HOME/bin:$PATH"
export PATH="$HOME/Library/Application Support/fnm:$PATH"
# app dev
export PATH=$ANDROID_HOME/emulator:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
# for ios cocoapods
export PATH=/opt/homebrew/opt/ruby/bin:$PATH
if [[ "$(uname -sm)" = "Darwin arm64" ]] then export PATH=/opt/homebrew/bin:$PATH; fi

# Autoload
autoload -U compinit; compinit
zmodload zsh/complist
autoload -Uz edit-command-line; zle -N edit-command-line

# Plugins
# cd ~/.config/zsh/plugins
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
source $ZSHAREDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# git clone https://github.com/zsh-users/zsh-autosuggestions
source $ZSHAREDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# git clone https://github.com/zsh-users/zsh-history-substring-search
source $ZSHAREDIR/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
# git clone https://github.com/zsh-users/zsh-completions
fpath=($ZSHAREDIR/plugins/zsh-completions/src $fpath)

# [[ $- == *i* ]] && source $ZSHAREDIR/fzf/completion.zsh 2> /dev/null
# source $ZSHAREDIR/fzf/key-bindings.zsh

# Auto completion
zstyle ":completion:*:*:*:*:*" menu select
zstyle ":completion:*" use-cache yes
zstyle ":completion:*" special-dirs true
zstyle ":completion:*" squeeze-slashes true
zstyle ":completion:*" file-sort change
zstyle ":completion:*" matcher-list "m:{[:lower:][:upper:]}={[:upper:][:lower:]}" "r:|=*" "l:|=* r:|=*"
source $ZDOTDIR/keymap.zsh

# Tabtab for node cli programs, e.g. `pnpm`
source $ZDOTDIR/tabtab/pnpm.zsh

# bun completions
[ -s "$BUN_HOME/_bun" ] && source "$BUN_HOME/_bun"

# Initialize tools
source $ZDOTDIR/function.zsh
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"
eval "`fnm env`"

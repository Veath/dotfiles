# Zsh root
ZDOTDIR=$HOME/.config/zsh
ZSHAREDIR=$HOME/.config/zsh

# Zsh related
HISTFILE=$ZDOTDIR/.history
HISTSIZE=10000
SAVEHIST=10000
KEYTIMEOUT=1  # makes the switch between modes quicker
HISTORY_SUBSTRING_SEARCH_PREFIXED=1  # enables prefixed search for zsh-history-substring-search

# Temporary variables
__TREE_IGNORE="-I '.git' -I '*.py[co]' -I '__pycache__' $__TREE_IGNORE"
__FD_COMMAND="-L -H --no-ignore-vcs ${__TREE_IGNORE//-I/-E} $__FD_COMMAND"

# Software specific
export EDITOR="nvim"
export VISUAL="nvim"

export MPV_HOME="$HOME/.config/mpv"

export BAT_CONFIG_DIR="$HOME/.config/bat"
export BAT_THEME="Catppuccin-macchiato"
export HOMEBREW_NO_ANALYTICS=1
# export RANGER_LOAD_DEFAULT_RC="FALSE"
export PNPM_HOME=$HOME/Library/pnpm
export BUN_HOME=$HOME/.bun

# app dev
export JAVA_HOME=$HOME/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
export ANDROID_HOME=$HOME/Library/Android/sdk
# ios(cocoapods) for compilers to find ruby you may need to set:
export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"

export LESSKEYIN=$HOME/.config/less/.lesskey
export LESSHISTFILE=$HOME/.config/less/.lesshst

export FZF_DEFAULT_COMMAND="fd $__FD_COMMAND"
export FZF_DEFAULT_OPTS="
--reverse --ansi --no-multi
--bind=ctrl-u:up,ctrl-e:down,ctrl-n:backward-char,ctrl-i:forward-char,ctrl-b:backward-word,ctrl-h:forward-word
--border --color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
"
if [[ -v __FZF_PREVIEW ]]; then
	unset __FZF_PREVIEW
	FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS
--preview='(
	bat --color=always {} ||
	tree -ahpCL 3 $__TREE_IGNORE {}
) 2>/dev/null | head -n 100'"
fi

# Clean up
unset __TREE_IGNORE
unset __FD_COMMAND

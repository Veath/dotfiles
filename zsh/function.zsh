# Alias
alias ..="cd .."
alias ...="cd ../.."
alias ~="cd ~"
alias -- -="cd -"

# 显示当前工作目录
alias p="pwd"
alias v="nvim"
# 列出所有文件和目录，包含图标，目录优先显示
alias l="eza -al --icons --group-directories-first"
# 列出所有文件和目录，包含图标，目录优先显示
alias ll="eza -a --icons --group-directories-first"
# 显示目录和文件的磁盘使用情况
alias du="dust -r -n 999999999"
# 显示目录结构，包括隐藏文件，并带有颜色
alias tree="tree -aC"
# 将当前目录中的所有文件转换为 PNG 格式，输出到 converted-images 目录
alias icpng="mkdir converted-images; sips -s format png * --out converted-images"
# 将当前目录中的所有文件转换为 JPEG 格式，输出到 converted-images 目录
alias icjpg="mkdir converted-images; sips -s format jpeg * --out converted-images"

# git
alias gs="git status"
alias ga="git add -A"
alias gc="git commit -v"
alias gc!="git commit -v --amend --no-edit"
alias gl="git pull"
alias gp="git push"
alias gp!="git push --force"
alias gcl="git clone --depth 1 --single-branch"
alias gf="git fetch --all"
alias gb="git branch"
alias gr="git rebase"
alias gt='cd "$(git rev-parse --show-toplevel)"'

# 快速获取 en0 网络接口的 IP 地址。
alias ,ip="ipconfig getifaddr en0"
alias ,sshconfig="vim ~/.ssh/config"
alias ,gitconfig="vim ~/.gitconfig"
# 用 cdtmp 创建一个临时目录并切换到该目录
alias cdtmp='cd `mktemp -d /tmp/veath-XXXXXX`'
alias pi="echo 'Pinging Baidu' && ping www.baidu.com"
# 获取 en0 和 en1 网络接口的 IP 地址
alias ip="ipconfig getifaddr en0 && ipconfig getifaddr en1"
alias hosts="vi /etc/hosts"

# system
alias showFiles="defaults write com.apple.finder AppleShowAllFiles YES && killall Finder"
alias hideFiles="defaults write com.apple.finder AppleShowAllFiles NO && killall Finder"

# 创建一个新的分支，用于处理 pull request。如果远程仓库的用户名和本地的不同，它会调整远程仓库的 URL
function gpr() {
	local username=$(git config user.name)
	if [ -z "$username" ]; then
		echo "Please set your git username"
		return 1
	fi

	local origin=$(git config remote.origin.url)
	if [ -z "$origin" ]; then
		echo "No remote origin found"
		return 1
	fi

	local remote_username=$(basename $(dirname $origin))
	if [ "$remote_username" != "$username" ]; then
		local new_origin=${origin/\/$remote_username\//\/$username\/}
		new_origin=${new_origin/https:\/\/github.com\//git@github.com:/}

		git config remote.origin.url $new_origin
		git remote remove upstream > /dev/null 2>&1
		git remote add upstream $origin
	fi

	git checkout -b "pr-$(openssl rand -hex 4)"
}

# 用于显示最近的 $1 条 git 提交记录，不使用分页
function glp() {
  git --no-pager log -$1
}

# 于显示 git 差异，使用 diff-so-fancy 进行着色和格式化
function gd() {
  if [[ -z $1 ]] then
    git diff --color | diff-so-fancy
  else
    git diff --color $1 | diff-so-fancy
  fi
}

# 于显示已暂存的 git 差异，使用 diff-so-fancy 进行着色和格式化
function gdc() {
  if [[ -z $1 ]] then
    git diff --color --cached | diff-so-fancy
  else
    git diff --color --cached $1 | diff-so-fancy
  fi
}

# -------------------------------- #
# Directories
#
# I put
# `~/abc` for my projects
# -------------------------------- #

function abc() {
  cd ~/abc/$1
}

function aconf() {
  cd ~/.config/$1
}

function acode() {
  cd ~/abc/code/$1
}

# 列出所有 pull requests 或 checkout 指定的 pull request。
function pr() {
  if [ $1 = "ls" ]; then
    gh pr list
  else
    gh pr checkout $1
  fi
}

# 创建一个目录并切换到该目录
function dir() {
  mkdir $1 && cd $1
}

# 使用 hub 克隆仓库，并切换到克隆的目录。可以指定目标目录
function clone() {
  if [[ -z $2 ]] then
    hub clone "$@" && cd "$(basename "$1" .git)"
  else
    hub clone "$@" && cd "$2"
  fi
}

# Clone to ~/abc/code and cd to it
function clonea() {
  acode && clone "$@" && code . && cd ~2
}

function codea() {
  acode && code "$@" && cd -
}

# 获取 Finder 当前窗口的路径
function pfd() {
  osascript 2> /dev/null <<EOF
  tell application "Finder"
    return POSIX path of (target of window 1 as alias)
  end tell
EOF
}

# 创建一个目录并切换到该目录。
function mcd {
  mkdir $1 && cd $1;
}

# 切换到 Finder 当前目录
function cdf() {
  cd "$(pfd)"
}

# 这个函数用于创建指定文件及其必要的父目录
function ,touch {
  mkdir -p "$(dirname "$1")" && touch "$1"
}

# 这个函数用于创建指定文件及其父目录，并切换到该文件所在的目录
function ,take() {
  mkdir -p "$(dirname "$1")" && touch "$1" && take "$(dirname "$1")"
}

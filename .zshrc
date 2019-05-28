# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:/Users/Dandoh/.local/bin

run() {
	c++ -Wall -std=c++11 $1.cpp -o $1
	if [ $? -eq 0 ]; then
		echo "--------------------------------OUTPUT------------------------------"
		./$1
	fi
}

compilec++() {
  g++ $1.cpp -std=c++14 -pthread -O3 -o $1
}

haskell() {
  ghc -Wall -o $1 $1.hs
	if [ $? -eq 0 ]; then
		echo "--------------------------------OUTPUT------------------------------"
		./$1 $2 $3 $4 $5 $6
	fi
}

compile() {
  ghc -Wall -o $1 $1.hs
}

competitive() {
  cp ~/template.cpp ./$1.cpp
  vim $1.cpp
}

newfile() {
  touch $1
  open $1
}

find_process_using_port () {
  lsof -t -i :$1
}

# Path to your oh-my-zsh installation.
export ZSH="/Users/Dandoh/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster" # (this is one of the fancy ones)
# ZSH_THEME="lambda"
# ZSH_THEME="bullet-train"
#


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  osx
  zsh-256color
  zsh-autosuggestions 
  zsh-syntax-highlighting
  command-not-found
  copyfile
  github
)

source $ZSH/oh-my-zsh.sh



# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
alias hindent="hindent --indent-size 4"

d='dirs -v | head -10'
0='~0'
1='~2'
3='~3'
4='~4'
5='~5'
6='~6'
7='~7'
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

save_current_emacs() {
  rm -rf ~/emacs-backup/.*
  cp ~/.emacs ~/emacs-backup/
  cp -rf ~/.emacs.d ~/emacs-backup/
}

sb() {
  stack build --fast
}

sr() {
  pth=`pwd`
  package_path="$pth/package.yaml"
  package_content=`cat $package_path`
  regex="executables:[[:space:]]+([a-zA-Z-]+):"
  if [[ $package_content =~ $regex ]]; then
    name="${match[1]}" # in bash: ${BASH_REMATCH[1]} instead 
    echo "stack exec $name"
    stack exec $name
  else
    echo "Couldn't find executable"
  fi
}

st() {
  stack test --fast
}

ss() {
  sb
  clear
  sr
}



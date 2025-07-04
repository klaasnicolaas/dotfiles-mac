# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    pyenv
    git
    npm
    nvm
    sudo
    docker-compose
    laravel
    rbenv
    yarn
    vagrant
)

# Custom plugins
plugins+=(zsh-autosuggestions zsh-syntax-highlighting)

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
# export ARCHFLAGS="-arch $(uname -m)"

# Aliases - Remove what you don't need
alias gs="git status -sb"
alias zshreload="source $HOME/.zshrc"
alias zshconfig="mate $HOME/.zshrc"
alias ohmyzsh="mate $HOME/.oh-my-zsh"
alias diskspace="sudo du -shx * | sort -rh | head -10"

# Venv
alias venv_enter="source .venv/bin/activate"
alias venv_create="python3 -m venv .venv"

# Pip
alias pip_freeze="pip freeze > requirements.txt"
alias pip_install="pip install -r requirements.txt"

# Uv
alias uv_install="uv pip install -r requirements.txt"
alias uv_venv="uv venv"
alias uvdate="uv self update"

# Php
alias laravel_clear="php artisan optimize:clear"
alias pint="./vendor/bin/pint"
alias pest="./vendor/bin/pest"
alias phpstan="./vendor/bin/phpstan"
alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'

# Bundle
alias bundle_start="bundle exec bin/dev"
alias bundle_migrate="bundle exec bin/rails db:migrate"
alias bundle_seed="bundle exec bin/rails db:seed"

# Pyenv
alias pyenv_list='pyenv install --list | grep -E "^\s*3\.(11|12|13)(\..*|-dev.*)"'

# Balena
alias balena_dev='fn_balena_dev'

# Git
alias gnext='fn_nextgitbranch'
alias gmrnext='fn_mrgreen_nextgitbranch'
git_rm_branches() {
  local branches=$(git branch | grep "$1")

  if [ -z "$branches" ]; then
    echo "No branches found matching pattern '$1'."
    return 1
  fi

  echo "Branches found matching pattern '$1':"
  echo "$branches"

  read -r "REPLY?Do you want to delete these branches? (y/n): "
  case "$REPLY" in
    [Yy])
      echo "$branches" | xargs git branch -D
      echo "Branches deleted successfully."
      ;;
    *)
      echo "Operation cancelled."
      ;;
  esac
}

function fn_balena_dev() {
  cat .env | xargs -I@ echo "--env @" | xargs balena push $1
}

function fn_mrgreen_nextgitbranch() {
  local branch_type task_number

  # Check if arguments are provided
  if [[ -n "$1" ]]; then
    if [[ "$1" =~ ^[0-9]+$ ]]; then
      branch_type="feature"
      task_number="$1"
    else
      branch_type="$1"
      task_number="$2"
    fi
  fi

  # Ask for branch type if not provided
  if [[ -z "$branch_type" ]]; then
    echo -n "Enter the branch type (feature/bugfix/release) [default: feature]: "
    read branch_type
    branch_type=${branch_type:-feature}
  fi

  # Ask for task number if not provided
  while [[ -z "$task_number" || ! "$task_number" =~ ^[0-9]+$ ]]; do
    echo -n "Enter the task number (e.g. 1001): "
    read task_number
  done

  git checkout -b "${branch_type}/REND-${task_number}"
}

function fn_nextgitbranch() {
  current_year=$(date +%Y)

  last_branch=$(git branch --list "klaas-${current_year}-*" | sort -r | head -n 1)

  if [[ -n "$last_branch" ]]; then
    last_number=${last_branch##*-}
    new_number=$(printf "%03d" $((10#$last_number + 1)))
  else
    new_number="001"
  fi

  new_branch="klaas-${current_year}-${new_number}"

  # Switch to new branch
  git checkout -b $new_branch
}

# Added by `rbenv init` on Fri Aug  9 10:42:39 CEST 2024
eval "$(rbenv init - --no-rehash zsh)"

export PATH="$HOME/.local/bin:$PATH"

# Composer
export PATH=$PATH:~/.composer/vendor/bin

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
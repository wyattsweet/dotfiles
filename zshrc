export TERM=xterm-256color
export EDITOR=$NVIM
export VISUAL=$NVIM
# how often to auto-update (in days).
export UPDATE_ZSH_DAYS=14
# Ignore node_modules directory when using fzf
export FZF_DEFAULT_COMMAND='ag --nocolor --ignore node_modules -g ""'

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="avit"

# disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-nvm vi-mode)
# zsh-syntax-highlighting needs to be the last plugin
plugins+=(zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# source general aliases
source ~/dotfiles/zsh/alias.zsh
# if local aliases source them
[ -f ~/.alias_local.zsh ] && source ~/.alias_local.zsh
# source functions
source ~/dotfiles/zsh/functions.zsh
# vi mode
source ~/dotfiles/zsh/vim_mode.zsh

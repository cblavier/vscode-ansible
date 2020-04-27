export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh
export PATH=$HOME/bin:$PATH
export LC_CTYPE="en_US.UTF-8"

eval "$(direnv hook zsh)"
source "/usr/share/autojump/autojump.sh"

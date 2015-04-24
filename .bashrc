
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
alias redis-serverd="echo \"daemonize yes\" | redis-server -"
# This tells you the active git branch you're in
function parse_git_branch {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function rvm_version {
  local gemset=$(echo $GEM_HOME | awk -F'ruby-' '{print $2}')
  [ "$gemset" != "" ] && echo "$gemset"
}

# And this puts it at the end of your prompt.
export PS1='\[\033[0;32m\]\u@\h:\w\[\033[0;37m\] $(rvm_version) $(parse_git_branch)\n\[\033[0;33m\]⚡\[\033[0;37m\] '

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Git aliases
alias gts='git status'

alias ll='ls -l'

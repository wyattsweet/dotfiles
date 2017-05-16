
PATH=$PATH:/usr/local/sbin
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.59.100:2376"
export DOCKER_CERT_PATH="/Users/wyattsweet/.docker/machine/machines/default"
export DOCKER_MACHINE_NAME="default"
# Run this command to configure your shell: 
# eval $(docker-machine env default)

alias gpull='git pull origin `get_git_branch`'
alias gpush='git push origin `get_git_branch`'
alias grep='grep --color'
alias gs='git status'
alias gup='gpull && gpush'
alias mysql_start='sudo /usr/local/mysql/bin/mysqld_safe'
alias routes='rake routes|less'
alias sshdirect='ssh -p 35987 -i ~/.ssh/id_thredupkids2 thredup@direct.thredup.com'
alias sshpreview='ssh -p 35987 -i ~/.ssh/id_thredupkids2 thredup@preview.thredup.com'
alias sshut='ssh -p 35987 -i ~/.ssh/id_thredupkids2 thredup@utility.thredup.com'
alias t='cd $HOME/projects/iOS-Boutiqe'
alias tu='cd $HOME/projects/thredUP3'
alias vi='vim'
alias killemall='`kill_tup_pids`' #In case of crashing/failed foreman loading, it kills the processes still using ports
get_git_branch() {
   echo `git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
}
kill_tup_pids() {
        kill -9 `lsof -i tcp:8085 -t -a`
        kill -9 `lsof -i tcp:6379 -t -a`
        kill -9 `lsof -i tcp:8086 -t -a`
}

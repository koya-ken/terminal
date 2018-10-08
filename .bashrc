PATH=$PATH:$(readlink -f ~/scoop/apps/nodejs/current)

function _java() {
	local cur prev cword
	_get_comp_words_by_ref -n : cur prev cword
	COMPREPLY=($(compgen -W "--cp -classpath --classpath -p --version" -- "${cur}"))
}

complete  -o default -F _java java

if [ -f "${HOME}/.bash_aliases" ]; then
    . "${HOME}/.bash_aliases"
fi

if [ -f "${HOME}/.bash_functions" ]; then
    . "${HOME}/.bash_functions"
fi

if [ -f ${HOME}/complete/hub.bash_completion.sh ]; then
  . ${HOME}/complete/hub.bash_completion.sh 
fi

if [ -f ${HOME}/complete/gradle-completion.bash ]; then
  . ${HOME}/complete/gradle-completion.bash
fi



# https://qiita.com/mashimalo/items/7e9a17383d13e8a66513
SSH_KEY_LIFE_TIME_SEC=3600

SSH_AGENT_FILE=$HOME/.ssh-agent
test -f $SSH_AGENT_FILE && source $SSH_AGENT_FILE > /dev/null 2>&1
if [ $( ps -ef | grep ssh-agent | grep -v grep | wc -l ) -eq 0 ]; then
    ssh-agent -t $SSH_KEY_LIFE_TIME_SEC > $SSH_AGENT_FILE
    source $SSH_AGENT_FILE > /dev/null 2>&1
    test -f ~/.ssh/id_rsa && ssh-add ~/.ssh/id_rsa
fi

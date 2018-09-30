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

# ssh-agent
eval `ssh-agent`
ssh-add ~/.ssh/id_rsa


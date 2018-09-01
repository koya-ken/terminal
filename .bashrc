function _java() {
	local cur prev cword
	_get_comp_words_by_ref -n : cur prev cword
	COMPREPLY=($(compgen -W "--cp -classpath --classpath -p --version" -- "${cur}"))
}

complete  -o default -F _java java

if [ -f "${HOME}/.bash_aliases" ]; then
    . "${HOME}/.bash_aliases"
fi

if [ -f ${HOME}/complete/hub.bash_completion.sh ]; then
  . ${HOME}/complete/hub.bash_completion.sh 
fi

PATH=$PATH:$(readlink -f ~/scoop/apps/nodejs/current)

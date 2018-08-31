function _java() {
	local cur prev cword
	_get_comp_words_by_ref -n : cur prev cword
	COMPREPLY=($(compgen -W "--cp -classpath --classpath -p --version" -- "${cur}"))
}

complete  -o default -F _java java
PATH=$PATH:$(readlink -f ~/scoop/apps/nodejs/current)

#!/bin/bash

__BEFORE_VARIABLES=$(compgen -A variable)
__BEFORE_FUNCTIONS=$(compgen -A function)


function basename() {
    cat | awk -F "/" '{print $NF}'
}


__AFTER_FUNCTIONS=$(compgen -A function)
__AFTER_VARIABLES=$(compgen -A variable)

# add function
export -f $(cat <(echo "$__BEFORE_FUNCTIONS") <(echo "$__AFTER_FUNCTIONS") | sort | uniq -u) > /dev/null

# delete variable
unset $(cat <(echo "$__BEFORE_VARIABLES") <(echo "$__AFTER_VARIABLES") | sort | uniq -u)
unset __AFTER_VARIABLES


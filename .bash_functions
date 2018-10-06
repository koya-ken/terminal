#!/bin/bash

__BEFORE_VARIABLES=$(compgen -A variable)
__BEFORE_FUNCTIONS=$(compgen -A function)


function basename() {
    cat | awk -F "/" '{print $NF}'
}

function logcat_color_filter() {
    awk '{ 
           colorBrightRed     = "\033[1;93m";
           colorBrightYellow  = "\033[1;91m";
           clearColor = "\033[0m";
           logcatFormat = "([0-9]{2}-[0-9]{2} )(.*  )([0-9]+  )([0-9]+ )(%s)(.*)";
           tmp = $0;
           tmp = gensub(sprintf(logcatFormat,"W"), sprintf("%s%s%s",colorBrightRed,"\\0",clearColor),"g",tmp);
           tmp = gensub(sprintf(logcatFormat,"E"), sprintf("%s%s%s",colorBrightYellow,"\\0",clearColor),"g",tmp);
           print tmp
    }'
}


__AFTER_FUNCTIONS=$(compgen -A function)
__AFTER_VARIABLES=$(compgen -A variable)

# add function
export -f $(cat <(echo "$__BEFORE_FUNCTIONS") <(echo "$__AFTER_FUNCTIONS") | sort | uniq -u) > /dev/null

# delete variable
unset $(cat <(echo "$__BEFORE_VARIABLES") <(echo "$__AFTER_VARIABLES") | sort | uniq -u)
unset __AFTER_VARIABLES


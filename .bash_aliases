# show hide files
alias ll='ls -al'
# sjis to utf-8
alias decode='iconv -f sjis -t utf-8'
# freeze scoop package
alias update_scoop='scoop list > ~/scoop_list.txt'
# open github page
alias open_github='git remote get-url origin | cut -d: -f2 | perl -pe "s/^/https:\/\/github.com\//g"| xargs start'
# refresh bashrc
alias refresh='. ~/.bashrc'
# edit bash_aliases
alias aliases='vim ~/.bash_aliases'
# sqlite3 console
alias sqlite3='winpty sqlite3'
# git hub command
alias git='hub'
# git hub complete update
alias hub-complete='(cd ~/complete && curl -s -O https://raw.githubusercontent.com/github/hub/master/etc/hub.bash_completion.sh)'

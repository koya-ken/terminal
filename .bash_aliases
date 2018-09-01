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


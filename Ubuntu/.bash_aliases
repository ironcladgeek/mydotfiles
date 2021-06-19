# spark aliases
alias spark-shell="$HOME/Programms/spark-3.1.1-bin-hadoop2.7/bin/spark-shell"
alias pyspark="$HOME/Programms/spark-3.1.1-bin-hadoop2.7/bin/pyspark"
alias spark-submit="$HOME/Programms/spark-3.1.1-bin-hadoop2.7/bin/spark-submit"

# git aliases
alias g="git"
alias gst="git status"
alias git-changed-files="git diff-tree --no-commit-id --name-only -r"
alias gl1="git log --oneline"
alias gla="git log --oneline --decorate --all --graph"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gwip="git add . && git commit -m 'wip'"
alias gnah="git reset --hard && git clean -df"

# conda aliases
alias ca="conda activate"
alias cda="conda deactivate"

# python aliases
alias jn="jupyter notebook"

# expressvpn aliases
alias expcon="expressvpn connect"
alias expdis="expressvpn disconnect"
alias expstat="expressvpn status"

# linux commands aliases
alias wifi-reset="nmcli networking off && nmcli networking on"
alias alternate="sudo update-alternatives --config"
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"

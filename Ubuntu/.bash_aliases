# OS aliases
alias _="sudo"
alias cls="clear"
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"


# git aliases
alias g="git"
alias gst="git status"
alias gpl="git pull --rebase"
alias gpom="git push -u origin master"
alias gba="git branch -a"
alias gla="git log --oneline --decorate --all --graph"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias wip="git add . && git commit -m 'wip'"
alias nah="git reset --hard && git clean -df"


# PHP and Laravel aliases
alias art="php artisan"
alias migrate="php artisan migrate"
alias serve="php artisan serve"
alias tinker="php artisan tinker"
alias lara_new_5.4="composer create-project --prefer-dist laravel/laravel blog '5.4.*'"
alias lara_new_5.3="composer create-project --prefer-dist laravel/laravel blog '5.3.*'"
alias lara_new_5.2="composer create-project --prefer-dist laravel/laravel blog '5.2.*'"


# npm aliases
alias npinit="npm init -y"
alias nps="npm start"
alias npd="npm run dev"
alias npb="npm run build"




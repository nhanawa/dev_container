# .bashrc

# User specific aliases and functions
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls --color=auto'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

PROMPT_COMMAND='if [ -d .git -a ! -x .git/hooks/pre-commit -a -e .pre-commit-config.yaml ] && which pre-commit >& /dev/null; then pre-commit install; fi; '"$PROMPT_COMMAND"


PS1="\[\`if [[ \$? = "0" ]]; then echo '\e[34m\h\e[0m'; else echo '\e[31m\h\e[0m' ; fi\`:\$PWD\n\$ "

alias ap='ansible-playbook'
alias ansible-playbook='ansible-playbook-wrapper'
export LANG=en_US.utf8
export PATH=$PATH:/usr/local/pyenv/shims/

function do_git {
  cmd=$1
  shift
  extra=""
  if [ "$cmd" == "clone" ]; then
    extra="--recursive"
    ex="$gitcom $cmd $extra $@"
    ${ex}
  else
    ex=($gitcom $cmd $extra "${@}")
    "${ex[@]}"
  fi
}
gitcom="$(which git)"
alias  git='do_git'

function log() {
    mkdir -p ~/ansible_logs/
    # logoutput parameters
    local log_out=~/ansible_logs/ansible.log

    # read parameters
    local level="$1"
    local text="${@:2:($#-1)}"

    local now=$(date +"%d-%m-%Y %H:%M:%S")
    echo -e "$now [$level] $text"|tee -a $log_out
}

# execute ansible playbook
function ansible-playbook-wrapper() {
  /usr/local/bin/ansible-playbook "$@"
  if [ $? -ne 0 ]; then
      log "ERROR" "asnible-playbook ${@} was failed"
  else
      log "INFO" "asnible-playbook ${@} was successed"
  fi
}


function flush_proxy(){
	proxy_list=`env | grep -i proxy`
	for proxy in $proxy_list;
	do
		#echo $proxy
		export `echo $proxy | cut -d'=' -f1`=
	done
	env|grep -i proxy
}

#
# /etc/bash.bashrc
#

# [Color Variables]

blk='\[\033[01;30m\]' # Black
red='\[\033[01;31m\]' # Red
grn='\[\033[01;32m\]' # Green
ylw='\[\033[01;33m\]' # Yellow
blu='\[\033[01;34m\]' # Blue
pur='\[\033[01;35m\]' # Purple
cyn='\[\033[01;36m\]' # Cyan
wht='\[\033[01;37m\]' # White
clr='\[\033[00;m\]'   # Reset

# [Setters]

set -o vi

# [Aliases]

# Move to parent folder
alias ..='cd ..;pwd'

# Move up two parent folders
alias ...='cd ../..;pwd'

# Move up three parent folders
alias ....='cd ../../..;pwd'

# Press c to clear the terminal screen
alias c='clear'

# Press h to view the bash history
alias h='history'

# Display the directory structure
alias tree='tree --dirsfirst -F'

# Make a directory and all parent directories with verbosity
alias mkdir='mkdir -p -v'

# [Functions]

function find_largest_files()
{
	du -h -x -s -- * | sort -r -h | head -20;
}

function prev_cmd()
{
	history | grep "$1";
}

# [Print Out]

clear

printf "\n"
#printf "  %s\n" "IP ADDRESS: $(curl ifconfig.me)"
printf "  %s\n" "USER: $(echo $USER)"
printf "  %s\n" "DATE: $(date)"
printf "  %s\n" "UPTIME: $(uptime -p)"
#printf "  %s\n" "HOSTNAME: $(hostname -f)"
#printf "  %s\n" "CPU: $(awk -F: '/model name/{print $2}' | head -1)"
printf "  %s\n" "KERNEL: $(uname -rms)"
#printf "  %s\n" "PACKAGES: $(dpkg --get-selections | wc -l)"
printf "  %s\n" "RESOLUTION: $(xrandr | awk '/\*/{printf $1 " "}')"
printf "  %s\n" "MEMORY: $(free -m -h | awk '/Mem/{print $3"/"$2}')"
printf "\n"

# [Pointer]
[[ $- != *i* ]] && return

[[ $DISPLAY ]] && shopt -s checkwinsize

PS1='(\e[0;94m\h\e[m) ? \e[0;92m\u\e[m : \e[0;95m\w\e[m; '

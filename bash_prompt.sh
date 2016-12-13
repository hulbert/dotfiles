#!/usr/bin/env bash

# Shell prompt based on the Solarized Dark theme.
# Screenshot: http://i.imgur.com/EkEtphC.png
# Heavily inspired by @necolas’s prompt: https://github.com/necolas/dotfiles
# iTerm → Profiles → Text → use 13pt Monaco with 1.1 vertical spacing.

if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
	export TERM='gnome-256color';
elif infocmp xterm-256color >/dev/null 2>&1; then
	export TERM='xterm-256color';
fi;

prompt_git() {
	local s='';
	local branchName='';

	# Check if the current directory is in a Git repository.
	if [ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") == '0' ]; then

		# Get the short symbolic ref.
		# If HEAD isn’t a symbolic ref, get the short SHA for the latest commit
		# Otherwise, just give up.
		branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
			git rev-parse --short HEAD 2> /dev/null || \
			echo '(unknown)')";

		echo -e "${1} (${branchName})";
	else
		return;
	fi;
}

if tput setaf 1 &> /dev/null; then
	tput sgr0; # reset colors
	bold=$(tput bold);
	reset=$(tput sgr0);

	black=$(tput setaf 0);
	red=$(tput setaf 1);
	green=$(tput setaf 2);
	yellow=$(tput setaf 3);
	blue=$(tput setaf 4);
	magenta=$(tput setaf 5);
	cyan=$(tput setaf 6);
	white=$(tput setaf 7);
	
	# bonus from http://git.io/solarized-colors
	orange=$(tput setaf 166);
	purple=$(tput setaf 125);
	violet=$(tput setaf 61);

	brightblack=$(tput setaf 8);
	brightred=$(tput setaf 9);
	brightgreen=$(tput setaf 10);
	brightyellow=$(tput setaf 11);
	brightblue=$(tput setaf 12);
	brightmagenta=$(tput setaf 13);
	brightcyan=$(tput setaf 14);
	brightwhite=$(tput setaf 15);
else
	bold='';
	reset="\e[0m";
	black="\e[1;30m";
	blue="\e[1;34m";
	cyan="\e[1;36m";
	green="\e[1;32m";
	orange="\e[1;33m";
	purple="\e[1;35m";
	red="\e[1;31m";
	violet="\e[1;35m";
	white="\e[1;37m";
	yellow="\e[1;33m";
fi;



# Highlight the user name when logged in as root.
if [[ "${USER}" == "root" ]]; then
	userStyle="${red}";
else
	userStyle="${brightgreen}";
fi;

# Highlight the hostname when connected via SSH.
if [[ "${SSH_TTY}" ]]; then
	hostStyle="${bold}${red}";
else
	hostStyle="${yellow}";
fi;

# Set the terminal title and prompt.
PS1="\[\033]0;\W\007\]"; # working directory base name

PS1+="\n\n"; # newline
PS1+="\[${bold}\]\[${userStyle}\]\u"; # username
PS1+="\[${reset}\]";
PS1+="\[${white}\] @ ";

PS1+="\[${bold}\]\[${violet}\]"; 
PS1+="\w";
PS1+="\[${reset}\]";

PS1+="\$(prompt_git "" \"\[${blue}\]\")"; # Git repository details
PS1+="\n";
PS1+="\[${brightwhite}\]\$ \[${reset}\]"; # `$` (and reset color)
export PS1;

PS2="\[${yellow}\]→ \[${reset}\]";
export PS2;

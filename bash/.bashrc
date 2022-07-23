#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

NPATH="$HOME/.local/bin"

. ~/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

case ":${PATH}:" in
	*:${NPATH}*) ;;
	*) PATH=${PATH}:$NPATH ;;
esac

export PATH

# tee /proc/acpi/bbswitch <<< ON
alias ls='ls --color=auto'
alias chrome="google-chrome-stable"
alias newtex="cp -a /D/College/General/template/."
alias newcpp="cp /D/Programming/C++/template/tmpl.cpp main.cpp"
alias newcppds="cp /D/Programming/C++/template/tmpl_ds.cpp main.cpp"
alias newcppall="cp /D/Programming/C++/template/tmpl_all.cpp main.cpp"
alias tlmgr="/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode"
PS1='[\u@\h \W]\$ '

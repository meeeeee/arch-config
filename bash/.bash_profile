#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# opam configuration
test -r /home/fareed/.opam/opam-init/init.sh && . /home/fareed/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

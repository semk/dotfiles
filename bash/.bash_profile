export LANG=en_US.UTF-8
set meta-flag on
set input-meta on
set output-meta on
set convert-meta off

# enables color in the terminal bash shell
export CLICOLOR=1
# sets up the color scheme for list
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
# sets up the prompt color (currently a green similar to linux terminal)
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$ '
# enables color for iTerm
export TERM=xterm-color
# sets up proper alias commands when called
alias ls='ls -G'
alias ll='ls -hl'

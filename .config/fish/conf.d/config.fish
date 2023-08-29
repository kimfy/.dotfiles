#set -g theme_color_scheme gruvbox
alias config='/usr/bin/git --git-dir=/home/kim/.my-dotfiles/ --work-tree=/home/kim'
# alias tmux='TERM=screen-256color tmux'


function t --wraps tmux --description 'alias t=TERM=screen-256color tmux'
  TERM=screen-256color tmux
end

function ii --description 'xdg-open .'
  xdg-open $argv
end

# liquidctl --serial $NZXT_CPU_SERIAL set fan speed 40
# liquidctl --serial $NZXT_GPU_SERIAL set fan speed 40
# liquidctl --serial $NZXT_CPU_SERIAL set pump speed 60
# liquidctl --serial $NZXT_GPU_SERIAL set pump speed 60

set NZXT_CPU_SERIAL 6D950F8D525
set NZXT_GPU_SERIAL 6D71587C525

set -g TERM screen-256color

fish_add_path /usr/local/go/bin
set GOPATH /home/kim/go 
fish_add_path $GOPATH/bin

set --universal nvm_default_version latest


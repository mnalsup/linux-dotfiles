set -U fish_key_bindings fish_vi_key_bindings
set -U budspencer_nocmdhist c d ll ls m s

set PATH ./node_modules/.bin ~/.npm-global/bin $PATH
source ~/Push/push-env.fish

# cfg dotfiles repo
# https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
alias config='/usr/bin/git --git-dir=/home/matthew/.cfg/ --work-tree=/home/matthew'

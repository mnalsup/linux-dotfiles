# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

GIT_PROMPT_ONLY_IN_REPO=1
export __GIT_PROMPT_DIR="/home/matthew/.config/bashrc.d/bash-git-prompt-master"
source ~/.config/bashrc.d/bash-git-prompt-master/gitprompt.sh

# git autocomplete
source ~/.config/bashrc.d/git-completion.sh

# bashrc
source ~/.config/bashrc.d/bashrc

# cfg dotfiles repo
# https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
alias config='/usr/bin/git --git-dir=/home/matthew/.cfg/ --work-tree=/home/matthew'

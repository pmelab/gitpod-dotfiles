git config --global gpg.format ssh
git config --global user.signingkey "$SSH_SIGNING_KEY"
git config --global commit.gpgsign true

alias wip="git commit --no-verify -m \"wip\""

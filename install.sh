git config --global gpg.format ssh
git config --global user.signingkey "$SSH_SIGNING_KEY"
git config --global commit.gpgsign true

cd $GITPOD_REPO_ROOT
gt repo init --no-interactive
gt auth --token $GRAPHITE_TOKEN

#!/bin/bash

echo "Setting up commit signing with 1Password"
git config --global gpg.format ssh
git config --global user.signingkey "$SSH_SIGNING_KEY"
git config --global commit.gpgsign true

echo "Install all files in home_files to the home directory"

current_dir="$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)"
dotfiles_source="${current_dir}/home_files"

while read -r file; do

    relative_file_path="${file#"${dotfiles_source}"/}"
    target_file="${HOME}/${relative_file_path}"
    target_dir="${target_file%/*}"

    if test ! -d "${target_dir}"; then
        mkdir -p "${target_dir}"
    fi

    printf 'Installing dotfiles symlink %s\n' "${target_file}"
    ln -sf "${file}" "${target_file}"

done < <(find "${dotfiles_source}" -type f)

echo "Initialising Graphite"
cd $GITPOD_REPO_ROOT
gt repo init --no-interactive
gt auth --token $GRAPHITE_TOKEN

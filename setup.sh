#!/bin/bash

# Exit when any command fails
set -e

source logger.sh

function install_brew_bundles {
	info "Installing Homebrew"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	info "Installing brew bundles"
	brew bundle install -v --no-lock --file Brewfile
}

function set_zsh_as_default_shell {
	info "Setting zsh as default shell"
	BREW_PREFIX=$(brew --prefix)
	if ! fgrep -q "${BREW_PREFIX}/bin/zsh" /etc/shells; then
		echo "${BREW_PREFIX}/bin/zsh" | sudo tee -a /etc/shells
	fi
	chsh -s "${BREW_PREFIX}/bin/zsh"
}


function symlink_zsh_config {
	info "Symlinking zsh configuration"

	if [ -e ~/.zshrc ]; then
		warn "Skipping symlink as ~/.zshrc already exist"
	else
		ln -s $PWD/.zshrc ~/.zshrc
	fi
}

function generate_ssh_key {
	sh ./ssh-key-generator.sh
}

install_brew_bundles
set_zsh_as_default_shell
symlink_zsh_config
generate_ssh_key

info "Mac is setup. Please check for any [WARN] and do the needful and do not forget to check the todo list which need to be setup manually for now. Happy Coding!!!"

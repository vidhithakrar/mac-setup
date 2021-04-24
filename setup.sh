#!/bin/bash

source logger.sh

function install_brew_bundles {
	info "Installing Homebrew"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	info "Installing brew bundles"
	brew bundle install -v --no-lock --file Brewfile
}

function set_zsh_as_default_shell {
	info "Setting zsh as default shell"
	chsh -s /usr/local/bin/zsh
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

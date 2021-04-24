#!/bin/bash

source logger.sh

function generate_ssh_key {
	info "Generating SSH key"
	read -p "Enter your e-mail for SSH key generation: " ssh_email
	ssh-keygen -t ed25519 -C $ssh_email -f $HOME/.ssh/id_ed25519
}

function add_ssh_key {
	info "Adding SSH key to ssh-agent"
	eval "$(ssh-agent -s)"

	cat >~/.ssh/config <<EOL
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
EOL

	ssh-add -K ~/.ssh/id_ed25519
}

function copy_ssh_key {
	pbcopy < ~/.ssh/id_ed25519.pub
	info "Copied SSH key to your clipboard which can be add on Github"
}


if [ -d ~/.ssh ]; then
	warn "Skipping the SSH key generation as .ssh folder is already present"
else
	generate_ssh_key
	add_ssh_key
	copy_ssh_key
fi


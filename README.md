# Mac Setup
Automation script to setup a new Mac

### Fresh Setup

``` bash
$ git clone https://github.com/vidhithakrar/mac-setup && ./mac-setup/setup.sh
```

### Update Setup
Once the setup is done, you may add more bundles or update the configurations which need to be tracked as 
a part of this project for seamless future setup. There are only two below mentioned files which need to 
be tracked:

##### ~/.zshrc 
Since ~/.zshrc is already symlicked to the project's .zshrc, whatever changes you make in ~/.zshrc will be 
directly reflected as a change in this project which you can push.

##### Brewfile
If you add any new bundle via brew then that has to be added in the Brewfile. This is something which needs
to be updated by manually running the below command from this project:
``` bash
brew bundle dump -f
```

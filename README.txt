Personal configurations


Repository is meant to be placed in the user home directory and managed with
GNU/Stow. The file structure is designed to be modular.

Example installation of configurations for zsh, neovim and profiled:
    $ stow zsh nvim profiled

Stow should not be used for system packages as it's symlinking approach creates
possible security flaws. Therefore using the manual installation is preferred
for "system-*" packages. Use the following syntax:
    # cp -rv system-*/* /

Moving the cloned repository **WILL BREAK** all the installed configurations!

ANYTHING in this repository is subject to change, use at your own risk.

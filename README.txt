Personal configurations


Repository is meant to be placed in the user home directory and managed with
GNU/Stow. The file structure is designed to be modular.

Example installation of configurations for zsh, neovim and profile.d:
    $ stow zsh nvim profile.d

Additional arguments required for "system-*" packages installation. Please use
the following syntax:
    # stow -t / system-*

Moving the cloned repository **WILL BREAK** all the installed configurations!

ANYTHING in this repository is subject to change, use at your own risk.

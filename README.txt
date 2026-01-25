Personal configurations


Repository is meant to be placed in the user home directory and managed with
GNU/Stow. The file structure is designed to be modular.

Example installation of configurations for bash and vim:
    $ stow bash vim

Stow shall not be used for system-* packages as it's symlinking approach creates
a lot of security holes when deploying user-owned files to the system paths.
Therefore using the manual installation is preferred in this case.

Use the following syntax:
    # cp -rv system-.../* /

Moving the cloned repository **WILL BREAK** all the installed configurations!

ANYTHING in this repository is subject to change, use at your own risk.

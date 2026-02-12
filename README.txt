Personal configurations


Repository is meant to be placed in the user home directory and managed with
GNU/Stow. The file structure is designed to be modular.

Example installation of configurations for bash and vim:
    $ stow bash vim

Stow shall not be used for system-* packages as it's symbolic linking approach
creates a lot of security holes when deploying user-owned files to the system
paths. Therefore using the manual installation is preferred in this case.

Go to the required system-* package and use the following commands
to install:
    # cp -Lrv * /
to delete:
    # find . -type f,l -exec rm -v "/{}" \;

Moving the cloned repository **WILL BREAK** all the installed configurations!

ANYTHING in this repository is subject to change, use at your own risk.

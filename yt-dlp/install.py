from pathlib import Path


CONFIG_DIR: Path = Path.home() / Path(".config")
SOURCE = __file__ / Path('yt-dlp.conf')
LINK = CONFIG_DIR / Path('yt-dlp.conf')


if not CONFIG_DIR.exists():
    CONFIG_DIR.mkdir()
    print("Created '{}'".format(CONFIG_DIR))

if LINK.exists():
    print("Configuration file already installed in '{}'".format(LINK))
    exit()

try:
    LINK.symlink_to(SOURCE)
    print("Successfully created the symlink to '{}' in '{}'".format(SOURCE, LINK))
except Exception:
    print("Can not create the link. Run script with elevated privileges or ensure that user is allowed to create symlinks.")

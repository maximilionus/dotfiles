"""
yt-dlp personal config installation script.
Run the script with elevated privileges or ensure that user is allowed to create symlinks!

Supported platforms: Linux, macOS, Windows

How to run:
$ python install.py
"""

from pathlib import Path


config_dir = Path.home() / Path(".config")
source_file = Path(__file__).parent / Path('yt-dlp.conf')
target_file = config_dir / Path('yt-dlp.conf')


if not config_dir.exists():
    config_dir.mkdir()
    print("Created the '{}' dir".format(config_dir))

if target_file.exists():
    print("Configuration file already installed in '{}'".format(target_file))
    exit()

try:
    target_file.symlink_to(source_file)
    print("Successfully created the symlink to '{}' in '{}'".format(source_file, target_file))
except Exception:
    print("Can not create the link. Run the script with elevated privileges or ensure that user is allowed to create symlinks.")

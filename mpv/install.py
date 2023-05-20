"""
MPV personal config installation script.
Run the script with elevated privileges or ensure that user is allowed to create symlinks!

Supported platforms: Linux, macOS, Windows

How to run:
$ python install.py
"""

import platform
from pathlib import Path


source_dir = Path(__file__).parent
current_platform = platform.system()

print("Detected platform: {}".format(current_platform))

if current_platform in ('Linux', 'Darwin'):
    link_target = Path.home() / Path(".config/mpv")
elif current_platform == 'Windows':
    link_target = Path.home() / Path("AppData/Roaming/mpv")
else:
    print("Platform is not supported")
    exit()

if link_target.exists():
    print("Configuration is already installed in '{}'".format(link_target))
    exit()


try:
    link_target.symlink_to(source_dir)
    print("Successfully created the symlink to '{}' in '{}'".format(source_dir, link_target))
except Exception:
    print("Can not create the link. Run the script with elevated privileges or ensure that user is allowed to create symlinks.")

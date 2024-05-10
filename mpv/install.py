"""
MPV personal config installation script.
Run the script with elevated privileges or ensure that user is allowed to create symlinks!

Supported platforms: Linux, macOS, Windows

How to run:
$ python install.py
"""

import platform
from pathlib import Path


current_platform = platform.system()
source_dir = Path(__file__).parent
source_files = ('mpv.conf', 'input.conf')

print("Detected platform: {}".format(current_platform))
if current_platform in ('Linux', 'Darwin'):
    link_dir = Path.home() / Path(".config/mpv")
elif current_platform == 'Windows':
    link_dir = Path.home() / Path("AppData/Roaming/mpv")
else:
    print("Platform is not supported")
    exit()

if link_dir.exists():
    print("Configuration is already installed in '{}'".format(link_dir))
    exit()

try:
    link_dir.mkdir()
    for file in source_files:
        source_path = source_dir / file
        link_path = link_dir / file
        link_path.symlink_to(source_path)
        print("Successfully created the symlink to '{}' in '{}'".format(source_path, link_path))
except Exception as e:
    print("Can not install the configuration, reason: \"{}\"".format(e))

"""
Nushell personal config installation script.
Run the script with elevated privileges or ensure that user is allowed to create symlinks!

Supported platforms: Windows

How to run:
$ python install.py
"""

import platform
from pathlib import Path


supported_platforms = ("Windows")
current_platform = platform.system()

source_dir = Path(__file__).parent / "windows/"
source_files = (
    source_dir / "config.nu",
    source_dir / "env.nu"
)

if current_platform in supported_platforms:
    print("Detected platform: {}".format(current_platform))
    target_dir = Path.home() / Path("AppData/Roaming/nushell")
else:
    print("Platform {} is not supported".format(current_platform))
    exit(1)

if not target_dir.exists():
    target_dir.mkdir()
    print("Created the configuration dir on path '{}'".format(target_dir))

for source_file in source_files:
    if current_platform == "Windows":
        target_file = target_dir / source_file.name

    if target_file.exists():
        print("Configuration {} is already installed in '{}'".format(source_file, target_file))
        continue

    try:
        target_file.symlink_to(source_file.absolute())
        print("Successfully created the symlink to '{}' in '{}'".format(source_file, target_file))
    except Exception:
        print("Can not create the link. Run the script with elevated privileges or ensure that user is allowed to create symlinks.")
        exit(1)

print("Done. Restart your shell to load the changes.")

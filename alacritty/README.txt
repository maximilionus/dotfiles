This alacritty configuration is highly tied with the tmux and currently works
only on Linux platform.

Features
--------
- Multiplexer (tmux) on app start. Closing window from gui WILL NOT exit the
  tmux session, be aware.
- Theme switching. Execute 'alacritty-theme-switch' to switch or set light and
  dark theme. This setting is saved between sessions.
- Automatic theme matching for GNOME DE script in combination with previous
  feature will set the color scheme automatically on start depending on the
  current user scheme (light or dark). Automatic live theme matching is not yet
  implemented, but you can use the previous script to manually trigger the
  switch.

Install
-------
1. Install the alacritty and tmux.
2. Execute the './install.sh' script as root.

Uninstall
------
1. Execute the './uninstall.sh' script.

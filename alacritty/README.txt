This alacritty configuration is highly tied with the tmux and currently works
only on Linux platform.

Features
--------
- Multiplexer (tmux) on app start. Closing window from gui WILL NOT exit the
  tmux session, be aware.
- Automatic theme switching. Add '~/.local/bin' to $PATH and execute
  'alacritty-theme-switch' to switch light and dark theme. This setting is saved
  between sessions.
- GNOME DE scheme matching script in combination with zsh entries will set the
  color scheme depending on the current user scheme (light or dark). This
  feature is highly tied with zsh shell initialization script from this repo for
  now.

Install
-------
1. Install the alacritty and tmux.
2. Execute the './install.sh' script.

Remove
------
1. Execute the './remove' script.

This alacritty configuration is highly tied with the tmux and currently works
only on Linux platform.

Features
--------
- Multiplexer (tmux) on app start. Closing window from gui WILL NOT exit the
  tmux session, be aware.
- Live theme switching. Add '~/.local/bin' to $PATH and execute
  'alacritty_switch_theme' to switch light and dark theme. This setting is saved
  between sessions.

Install
-------
1. Install the alacritty and tmux.
2. Execute the './install.sh' script.

Remove
------
1. Execute the './remove' script.

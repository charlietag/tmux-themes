# Tmux themes

This is an plugin that applying the tmux themes maintained by me.

This plugin is compatible with Tmux plugin manager([TPM](https://github.com/tmux-plugins/tpm))

# Installation
## Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

Requirements: `tmux` version 3.0 (or higher), `bash`.

Add plugin to the list of TPM plugins in `.tmux.conf`:

    set -g @plugin 'charlietag/tmux-themes'

Hit `prefix + I` to fetch the plugin and source it.

Enjoy your tmux's new look !

## Manual Installation

Clone the repo:

    $ git clone https://github.com/charlietag/tmux-themes.git ~/clone/path

Add this line to the bottom of `.tmux.conf`:

    run-shell ~/clone/path/theme.tmux

Reload TMUX environment:

    # type this in terminal
    $ tmux source-file ~/.tmux.conf

Enjoy your tmux's new look !


# Examples

tmux-theme:<br/>
![tmux-theme](/screenshots/tmux-theme-3.png)

There might be more themes in the future.

# Useful command

* List clients and kill clients (works with status-left bar "Clients ▶▶▶ x")

  `<prefix> + D`

# Also read

- [.tmux.conf](https://github.com/charlietag/os_preparation/blob/master/helpers_views/helper_env_user_base/user_home/.tmux.conf) - Tmux configuration sample by CharlieTag

# Other goodies

- [tmux-split-statusbar](https://github.com/charlietag/tmux-split-statusbar) - a plugin for spliting status bar into 2 parts (lines) : windoow , status-left/status-right
- [tmux-cpu-model](https://github.com/charlietag/tmux-cpu-model) - a plugin for fetching cpu info of the server, and counting cpu cores.

# License

[MIT license](https://opensource.org/licenses/MIT)

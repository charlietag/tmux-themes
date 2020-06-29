# Tmux themes

This is an plugin that applying the tmux themes maintained by me.

This plugin is compatible with Tmux plugin manager([TPM](https://github.com/tmux-plugins/tpm))

# Notes

* This is tested on ***CentOS7*** and ***CentOS 8***.
* Network bandwith part
  * Requires
    * awk (GNU awk)
    * netstat (dnf install -y net-tools)
    * numfmt
  * Reference
    * https://github.com/xamut/tmux-network-bandwidth

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
![tmux-theme](/screenshots/tmux-theme-5.png)

tmux-theme (Dark Mode):<br/>
![tmux-theme](/screenshots/tmux-theme_dark-mode-1.png)

There might be more themes in the future.

# Customization

Here are all available options with their default values:

```bash
@theme-loading-cpu-mem 'on'            # [ on | off]

@theme-network-bandwith 'on'           # [ on | off]

@theme-dark-mode 'on'                  # [ on | off] , default off

@theme-dard-mode-bindkey 'T'           # [ -r T | M-s | -n F11 ] , this is for toggle theme dark mode, define yourself just like bind-key
                                       #                         , [NOTICE] toggle feature is not Fully Compatible with "split-status-bar" "tmux-cpu-model"
                                       #                         , [NOTICE] you'd better use config "theme-dark-mode" then, do a tmux RELOAD (<prefix> R) instead

```

Don't forget to reload tmux environment (`$ tmux source-file ~/.tmux.conf`)
after you do this.


# Usage

Sample config in ~/.tmux.conf

```bash
set -g @plugin 'charlietag/tmux-themes'
set -g @theme-loading-cpu-mem 'on'     # [ on | off] , default: on
set -g @theme-network-bandwith 'on'    # [ on | off] , default: on

set -g @theme-dark-mode 'on'           # [ on | off] , default off
set -g @theme-dard-mode-bindkey 'T'    # [ -r T | M-s | -n F11 ] , this is for toggle theme dark mode, define yourself just like bind-key
                                       #                         , toggle feature will is not Fully Compatible with "split-status-bar" "tmux-cpu-model"
                                       #                         , you'd better use config "theme-dark-mode" then, do a tmux RELOAD (<prefix> R) instead
```

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

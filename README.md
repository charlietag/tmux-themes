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
```

# Useful command

* List clients and kill clients (works with status-left bar "Clients ▶▶▶ x")

  `<prefix> + D`

# Also read

- [.tmux.conf](https://github.com/charlietag/tmux_settings/blob/master/tmux.conf) - Tmux configuration sample by CharlieTag

# Other goodies

- [tmux-split-statusbar](https://github.com/charlietag/tmux-split-statusbar) - a plugin for spliting status bar into 2 parts (lines) : windoow , status-left/status-right
- [tmux-cpu-model](https://github.com/charlietag/tmux-cpu-model) - a plugin for fetching cpu info of the server, and counting cpu cores.

# License

[MIT license](https://opensource.org/licenses/MIT)

# Change Log

* 2020/07/01
  * https://github.com/charlietag/tmux-themes/compare/v0.0.0...v0.0.2
    * Complete dark mode toggle function
    * Fully Compatible
      * [split-status-bar](https://github.com/charlietag/tmux-split-statusbar)
      * [tmux-cpu-model](https://github.com/charlietag/tmux-cpu-model)
      * [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum)
* 2020/10/21
  * https://github.com/charlietag/tmux-themes/compare/v0.0.2...v0.0.3
    * change non-active panel background color. 256color from 234 -> 236
* 2020/10/22
  * https://github.com/charlietag/tmux-themes/compare/v0.0.3...v0.0.4
    * tweak for background color

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

### Manual Installation

Clone the repo:

    $ git clone https://github.com/charlietag/tmux-themes.git ~/clone/path

Add this line to the bottom of `.tmux.conf`:

    run-shell ~/clone/path/theme.tmux

Reload TMUX environment:

    # type this in terminal
    $ tmux source-file ~/.tmux.conf

Enjoy your tmux's new look !


## Examples

tmux-theme:<br/>
![tmux-theme](/screenshots/tmux-theme.png)

There might be more themes in the future.


# License

[MIT license](https://opensource.org/licenses/MIT)

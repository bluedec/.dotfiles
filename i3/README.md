### .i3status.conf should be symlinked in one of the following locations

According to the **man page** of i3status:

By default, i3status looks for configuration files in the following order:
1. ~/.config/i3status/config (or $XDG_CONFIG_HOME/i3status/config if set)
2. /etc/xdg/i3status/config (or $XDG_CONFIG_DIRS/i3status/config if set)
3. ~/.i3status.conf
4. /etc/i3status.conf


If a config.ini file is found in /etc/polybar/ then that will be the one used, replace the contents
of that file with the ones at `polybar/config.ini`



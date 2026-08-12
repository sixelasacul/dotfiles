# config.nu
#
# Installed by:
# version = "0.114.1"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings,
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R

const flatpak_apps_with_bin = ["dev.zed.Zed","org.kde.kdiff3"]
let flatpak_bin = $flatpak_apps_with_bin | each {|app| $"/var/lib/flatpak/app/($app)/current/active/files/bin"  }
$env.path ++= $flatpak_bin

# $env.path = ($env.path | prepend $zed_bin)

const homebrew_bin = ["/home/linuxbrew/.linuxbrew/bin", "/home/linuxbrew/.linuxbrew/sbin"]
$env.path ++= $homebrew_bin

# zed is installed via flatpak
$env.config.buffer_editor = ["zed", "--wait", "--new"]
$env.config.show_banner = false
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

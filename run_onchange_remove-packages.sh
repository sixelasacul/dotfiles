#!/bin/sh

flatpak uninstall \
    org.mozilla.firefox \
    org.mozilla.thunderbird \
    --delete-data \
    || echo "could not remove all specified packages"
# fallback to echo so that the script never fails

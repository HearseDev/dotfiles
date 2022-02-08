#!/bin/bash
(cd $(dirname "$0"); curl -JLO https://github.com/ohmyzsh/ohmyzsh/raw/master/plugins/git/git.plugin.zsh; curl -JLO https://github.com/ohmyzsh/ohmyzsh/raw/master/plugins/sudo/sudo.plugin.zsh; git submodule update --recursive --remote --merge)


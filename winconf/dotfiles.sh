#!/bin/bash
eval $(/usr/bin/keychain --eval --quiet id_rsa)
cd $HOME/.dotfiles
git pull
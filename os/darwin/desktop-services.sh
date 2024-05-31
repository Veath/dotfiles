#!/bin/bash

# Avoid creating .DS_Store files on USB or network volumes
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

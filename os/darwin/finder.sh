#!/bin/bash

# Allow quitting via ⌘Q
defaults write com.apple.finder QuitMenuItem -bool true

# Disable warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Show all files and their extensions
defaults write com.apple.finder AppleShowAllExtensions -bool true
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show path bar, and layout as multi-column
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder FXPreferredViewStyle -string clmv

# Search in current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string SCcf

# --- Keep the desktop clean
# ShowHardDrivesOnDesktop：控制是否在桌面上显示硬盘驱动器。
# ShowRemovableMediaOnDesktop：控制是否在桌面上显示可移动介质（如 USB 设备）。
# ShowExternalHardDrivesOnDesktop：控制是否在桌面上显示外部硬盘驱动器。
# ShowMountedServersOnDesktop：控制是否在桌面上显示挂载的服务器。
# defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
# defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
# defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
# defaults write com.apple.finder ShowMountedServersOnDesktop -bool false

# Show directories first
# 将文件夹排在文件列表中的顶部
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# New window use the $HOME path
# 设置新窗口的打开位置为“主文件夹（Home）
defaults write com.apple.finder NewWindowTarget -string PfHm
# 设置新窗口打开位置的路径为用户主文件夹路径
defaults write com.apple.finder NewWindowTargetPath -string "file://$HOME/"

# Allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Show metadata info, but not preview in info panel
defaults write com.apple.finder FXInfoPanesExpanded -dict MetaData -bool true Preview -bool false

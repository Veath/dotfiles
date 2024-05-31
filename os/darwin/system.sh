#!/bin/bash

# Auto hide the menubar
defaults write -g _HIHideMenuBar -bool true

# Enable full keyboard access for all controls
# 可以通过 tab 切换选中项，space 选中选中项(enter 还是表示默认确定)
defaults write -g AppleKeyboardUIMode -int 3

# Enable press-and-hold repeating
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1

# Disable "Natural" scrolling
# defaults write -g com.apple.swipescrolldirection -bool false

# Disable smart dash/period/quote substitutions
# 禁用自动替换连字符为破折号
# 禁用自动替换连续的句号为省略号
# 禁用自动替换引号为半角或全角引号
defaults write -g NSAutomaticDashSubstitutionEnabled -bool false
defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable automatic capitalization
defaults write -g NSAutomaticCapitalizationEnabled -bool false

# Using expanded "save panel" by default
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true
defaults write -g NSNavPanelExpandedStateForSaveMode2 -bool true

# Increase window resize speed for Cocoa applications
defaults write -g NSWindowResizeTime -float 0.001

# Save to disk (not to iCloud) by default
defaults write -g NSDocumentSaveNewDocumentsToCloud -bool true

# --- Set the system accent color
defaults write -g AppleAccentColor -int 6

# Jump to the spot that's clicked on the scroll bar
defaults write -g AppleScrollerPagingBehavior -bool true

# Prefer tabs when opening documents
defaults write -g AppleWindowTabbingMode -string always

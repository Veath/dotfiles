#!/bin/bash

# For better privacy
# 禁用 Safari 的通用搜索功能
defaults write com.apple.Safari UniversalSearchEnabled -bool false
# 禁用 Safari 的搜索建议提示
defaults write com.apple.Safari SuppressSearchSuggestions -bool true
# 启用 Safari 发送 "Do Not Track" 头部信息，用于保护用户隐私
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# Disable auto open downloads
# 禁用 Safari 的自动打开安全下载文件功能
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Enable Develop Menu, Web Inspector
# 启用 Safari 的开发者菜单
defaults write com.apple.Safari IncludeDevelopMenu -bool true
# 启用 Safari 的内部调试菜单
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
# 启用 Safari 的 WebKit 开发者扩展
defaults write com.apple.Safari WebKitDeveloperExtras -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true


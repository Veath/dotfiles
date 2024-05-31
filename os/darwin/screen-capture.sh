#!/bin/bash

# --- Set the filename which screencaptures should be written
# 将截屏文件的命名前缀设置为 "screenshot"
defaults write com.apple.screencapture name -string screenshot
# 禁用截屏文件名中包含日期的功能
defaults write com.apple.screencapture include-date -bool false

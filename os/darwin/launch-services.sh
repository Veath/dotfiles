#!/bin/bash

# Disable quarantine for downloaded apps
# 默认情况下系统禁止安装第三方 App，通过以下代码绕过限制
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Widgets
function vi-yank-wrapped {
  local last_key="$KEYS[-1]"
  local ori_buffer="$CUTBUFFER"

  zle vi-yank
  if [[ "$last_key" = "Y" ]] then
    echo -n "$CUTBUFFER" | pbcopy -i
    CUTBUFFER="$ori_buffer"
  fi
}
zle -N vi-yank-wrapped



bindkey -v
# Normal mode
bindkey -M vicmd "H"         vi-first-non-blank
bindkey -M vicmd "L"         vi-end-of-line
bindkey -M vicmd "^K" history-substring-search-up
bindkey -M vicmd "^J" history-substring-search-down

# Insert mode
# bindkey -M viins "jk" vi-cmd-mode
bindkey -M viins "^K" history-substring-search-up
bindkey -M viins "^J" history-substring-search-down

# Visual mode
bindkey -M visual "^K" history-substring-search-up
bindkey -M visual "^J" history-substring-search-down

# Operator pending mode
# bindkey -M viopp "jk" vi-cmd-mode

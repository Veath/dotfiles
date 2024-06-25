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
# Insert mode
bindkey -M viins "jk" vi-cmd-mode
# Operator pending mode
bindkey -M viopp "jk" vi-cmd-mode

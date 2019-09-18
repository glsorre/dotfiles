typeset -A key

key=(
  BackSpace  "${terminfo[kbs]}"
  Home       "${terminfo[khome]}"
  End        "${terminfo[kend]}"
  Insert     "${terminfo[kich1]}"
  Delete     "${terminfo[kdch1]}"
  Up         "${terminfo[kcuu1]}"
  Down       "${terminfo[kcud1]}"
  Left       "${terminfo[kcub1]}"
  Right      "${terminfo[kcuf1]}"
  PageUp     "${terminfo[kpp]}"
  PageDown   "${terminfo[knp]}"
)

# Setup key accordingly
[[ -n "${key[BackSpace]}" ]] && bindkey "${key[BackSpace]}" backward-delete-char
[[ -n "${key[Home]}"      ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey "${key[End]}" end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n "${key[Delete]}"    ]] && bindkey "${key[Delete]}" delete-char
[[ -n "${key[Up]}"        ]] && bindkey "${key[Up]}" up-line-or-beginning-search
[[ -n "${key[Down]}"      ]] && bindkey "${key[Down]}" down-line-or-beginning-search
[[ -n "${key[PageUp]}"    ]] && bindkey "${key[PageUp]}" beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey "${key[PageDown]}" end-of-buffer-or-history
[[ -n "${key[BackSpace]}" ]] && bindkey -M vicmd "${key[BackSpace]}" backward-delete-char
[[ -n "${key[Insert]}"    ]] && bindkey -M vicmd "${key[Insert]}" overwrite-mode
[[ -n "${key[Delete]}"    ]] && bindkey -M vicmd "${key[Delete]}" delete-char
[[ -n "${key[Up]}"        ]] && bindkey -M vicmd "${key[Up]}" up-line-or-beginning-search
[[ -n "${key[Down]}"      ]] && bindkey -M vicmd "${key[Down]}" down-line-or-beginning-search
[[ -n "${key[PageUp]}"    ]] && bindkey -M vicmd "${key[PageUp]}" beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -M vicmd "${key[PageDown]}" end-of-buffer-or-history
[[ -n "${key[Home]}"      ]] && bindkey -M vicmd "${key[Home]}" beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -M vicmd "${key[End]}" end-of-line

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end
bindkey "^k" vi-kill-eol

# ctrl+left/right : move word by word (backward/forward)
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
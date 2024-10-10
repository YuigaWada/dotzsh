
function _delete_or_detach() {
    if [[ -n "${BUFFER}" ]]
    then
        zle delete-char-or-list
    else
        tmux detach-client
    fi
}

function _kill_current_session() {
  sid=`tmux display-message -p '#S'`
  tmux kill-session -t $sid
}

# makes C-d to detach tmux
if [[ -n "$TMUX" ]]
then
  setopt ignoreeof
  zle -N _delete_or_detach
  zle -N _kill_current_session
  bindkey "^D" _delete_or_detach
  bindkey "^W" _kill_current_session
fi

dotfiles_dir=~/.zsh
ascii_art_file="$dotfiles_dir/core/yuwd-ascii-art.txt"

declare -a messages

function check_dotfiles() {
  messages+=("\e[1;32m[dotfiles] checking ...\e[m")
  if is_dirty ; then
    messages+=("\e[1;33m[warn] DIRTY DOTFILES\e[m")
    messages+=("\e[1;33m    -> Push your local changes in $dotfiles_dir\e[m")
  else
    messages+=("\e[1;32mok\e[m")
  fi
}

function is_dirty() {
  cd $dotfiles_dir
  git status --porcelain | grep -q "^ M"
  return $?
}

function display_art_with_messages() {
  local line_count=$(wc -l < "$ascii_art_file")
  local middle_line=$((line_count / 2 - ${#messages[@]} / 2))
  local i=0
  
  tput cup 0 0
  tput ed
  
  while IFS= read -r line; do
    if [[ $i -ge $middle_line ]] && [[ $i -lt $((middle_line + ${#messages[@]})) ]]; then
      echo -ne "\e[2K"
      echo -e "$line ${messages[i-middle_line]}"
    else
      echo -e "$line"
    fi
    ((i++))
  done < "$ascii_art_file"
}

function boot_complete_message() {
  echo "=========================="
  echo "Welcome to yuwd's terminal"

  echo "System Information:"
  echo "$(uname -srmo) / $(uname -m)"
  echo "CPU: $(sysctl -n machdep.cpu.brand_string) ($(sysctl -n hw.physicalcpu_max) CPU)"
  echo "GPU: $(system_profiler SPDisplaysDataType | grep 'Chipset Model' | awk -F: '{ print $2 }') ($(system_profiler SPHardwareDataType | grep 'Memory' | awk '{print $2}')GB VRAM)"
  echo "Mac OS Version: $(sw_vers -productVersion)"
  echo "=========================="
}

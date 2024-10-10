##### CHECKING #####
source ~/.zsh/core/functions.zsh

messages+=("+-------------------------------------+")
messages+=("[Terminal] Welcome to yuwd's terminal.")

check_dotfiles
messages+=("+-------------------------------------+")
messages+=("\e[1;32m[dotfiles] done\e[m")

display_art_with_messages
messages+=("xx")

touch ~/.hushlogin
unset MAILCHECK

if ! [ -f ~/.zshenv ]; then
    echo 'export ZDOTDIR=$HOME/.zsh' > ~/.zshenv
fi

##### EXPORT #####

source ~/.zsh/core/export.zsh

##### ZSH #####

# zsh
autoload -U compinit
compinit

# p10k
source ~/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[[ ! -f ~/.zsh/.p10k.zsh ]] || source ~/.zsh/.p10k.zsh

##### OS DEPENDENT #####

source ~/.zsh/core/alias.zsh

##### VERSION_MANAGER #####

source ~/.zsh/core/version_manager.zsh
source ~/.zsh/core/tmux.zsh

source ~/.zshrc
display_art_with_messages

##### ALL DONE! #####
clear
boot_complete_message
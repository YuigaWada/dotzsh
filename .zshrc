# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if ! [ -f ~/.zshenv ]; then
    echo 'export ZDOTDIR=$HOME/.zsh' > ~/.zshenv
fi

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi


##### EXPORT #####

# PATH
export PATH
export GOPATH="$HOME/go"
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin
export PATH="$HOME/.cargo/bin:$PATH"

# OTHERS
export EDITOR=emacs


##### ZSH #####

# zsh
autoload -U compinit
compinit

# node
export NODE_ENV="development"

# zplug
source ~/.zplug/init.zsh
zplug load --verbose
source ~/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


##### VERSION_MANAGER #####

# pyenv
export PYENV_ROOT="$HOME/.pyenv/shims"
export PATH="$PYENV_ROOT:$PATH"
export PIPENV_PYTHON="$PYENV_ROOT/versions/workspace/bin/python3"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# nvm (node version manager)
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion



##### OS DEPENDENT #####

case ${OSTYPE} in
  darwin*) # for Mac

    # pure alias
    alias code="open -a '/Applications/Visual Studio Code.app'"
    alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
    # utils
    alias notif='terminal-notifier -sound default -message'
    alias reptempdocx="cp -n /Users/yuigawada/Desktop/Report/template.docx ./ && echo 'success: Made a file ./template.doc !' || echo 'error: template.docx is already existed.'"
    alias reptemptex="cp -n /Users/yuigawada/Desktop/Report/template.tex ./ && echo 'success: Made a file ./template.tex !' || echo 'error: template.tex is already existed.'"
    alias reptemp="reptempdocx; reptemptex"
    # Tex
    eval "$(/usr/libexec/path_helper)"
    export PATH=/usr/local/texlive/2022/bin/universal-darwin:$PATH
    
    ;;
  linux*) # for Linux
    
    alias open="xdg-open"

    ;;
esac

##### ALIAS #####

# utils
alias autopep="autopep8 --recursive --in-place --aggressive --aggressive ."
alias cdf="sh ~/.zsh/cdf.sh"

# alias
alias python="python3"
alias pip="pip3"
alias emacs="emacs -nw"
alias e="emacs"
alias oh="open ./" # open here!
alias vim=/usr/local/bin/vim
alias vi=/usr/local/bin/vim
alias rm='rm -i'

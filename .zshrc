# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if ! [ -f ~/.zshenv ]; then
    echo 'export ZDOTDIR=$HOME/.zsh' > ~/.zshenv
fi

# if [ -f ~/.bashrc ]; then
#     . ~/.bashrc
# fi


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


# zplug
# source ~/.zplug/init.zsh
# zplug load

# p10k
source ~/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


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
    alias copy="pbcopy"

    # tex
    eval "$(/usr/libexec/path_helper)"
    export PATH=/usr/local/texlive/2022/bin/universal-darwin:$PATH

    # brew
    eval "$(/opt/homebrew/bin/brew shellenv)"
    
    ;;
  linux*) # for Linux
    
    #utils
    alias open="xdg-open"
    alias targz="tar -I pigz -cf" # compress with pigz: targz [destination].tar.gz [source] (普通と逆なので注意)
    alias copy="xclip -selection clipboard"

    ## CUDA and cuDNN paths
    export CUDA_HOME=/usr/local/cuda
    export PATH=${CUDA_HOME}/bin:${PATH}
    export LD_LIBRARY_PATH=${CUDA_HOME}/lib64:/usr/local/lib:${LD_LIBRARY_PATH}

    ;;
esac

##### VERSION_MANAGER #####

# pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
eval "$(pyenv init -)"

# nvm (node version manager)
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# node
export NODE_ENV="development"


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
alias sucp="rsync -av --progress" # super cp

# To customize prompt, run `p10k configure` or edit ~/.zsh/.p10k.zsh.
[[ ! -f ~/.zsh/.p10k.zsh ]] || source ~/.zsh/.p10k.zsh

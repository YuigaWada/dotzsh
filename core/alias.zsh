
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
    alias mosh="export LC_CTYPE='ja_JP.UTF-8'; mosh"

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



# utils
alias autopep="autopep8 --recursive --in-place --aggressive --aggressive ."
alias cdf="sh ~/.zsh/cdf.sh"
alias gccxd="g++ -std=c++17 -Wall -O2 -g -D_GLIBCXX_DEBUG"

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
alias pdb="python -m pdb -c c" # → https://yuiga.dev/blog/posts/%E3%82%B9%E3%83%88%E3%83%AC%E3%82%B9%E3%81%AA%E3%81%8Fpdb%E3%82%92%E4%BD%BF%E3%81%86%E6%96%B9%E6%B3%95
alias unico="sed 's/\\\u\(....\)/\&#x\1;/g' | nkf --numchar-input -w" # to decode Unicode-escaped strings

TEMP="__installer_temp"

if [ "`whoami`" != "root" ]; then
  echo "Require root privilege"
  exit 1
fi

# zsh
cp ~/.zsh/.templaterc ~/.zshrc

# workspace
if [ ! -d $HOME/workspace ]; then
    mkdir $HOME/workspace
fi

cd $HOME/workspace
mkdir $TEMP ; cd $TEMP

# font 
git clone https://github.com/romkatv/powerlevel10k-media
cd powerlevel10k-media/
if [ ! -d $HOME/.fonts ]; then
    mkdir $HOME/.fonts
fi
mv *.ttf $HOME/.fonts

# zplug
if [ ! -d $HOME/.zplug ]; then
    cp $HOME/.zsh/.zplug $HOME/.zplug
fi

# powerlevel10k
if [ ! -d $HOME/powerlevel10k ]; then
    cp $HOME/.zsh/powerlevel10k $HOME/powerlevel10k
fi

# git
cp $HOME/.zsh/.gitconfig $HOME/.gitconfig
cd $HOME/workspace/$TEMP
git clone https://github.com/holygeek/git-number
cd git-number
cp git-* /usr/local/bin

echo "\e[1;33m[TODO] If Terminator user. \n 1. Open Preferences using the context menu. \n\n 2.Under Profiles select the General tab (should be selected already), uncheck Use the system fixed width font (if not already) and select MesloLGS NF Regular. \n\n 3.Exit the Preferences dialog by clicking Close.\e[0m\n"
rm -rf $HOME/workspace/$TEMP

cp $HOME/.zsh/p10k-instant-prompt-yuigawada.zsh ${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh
source ~/.zshrc
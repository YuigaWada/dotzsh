TEMP="__installer_temp"

# zsh
if [ ! -f /bin/zsh ]; then
    apt install -y zsh
    chsh -s /bin/zsh
    echo "\n\n[TODO]\n1.Run [chsh -s /bin/zsh]. \n\n2.Restart your terminal and execute this scripts again.\n"
    exit 0
fi
sudo cp $HOME/.zsh/.templaterc $HOME/.zshrc

# workspace
if [ ! -d $HOME/workspace ]; then
    mkdir $HOME/workspace
fi
cd $HOME/workspace
mkdir $TEMP
cd $TEMP

# font
git clone https://github.com/romkatv/powerlevel10k-media
cd powerlevel10k-media/
if [ ! -d $HOME/.fonts ]; then
    sudo mkdir $HOME/.fonts
fi
sudo mv *.ttf $HOME/.fonts

# zplug
if [ ! -d $HOME/.zplug ]; then
    sudo apt update
    sudo apt install zplug
    source ~/.zplug/init.zsh
fi

# powerlevel10k
if [ ! -d $HOME/powerlevel10k ]; then
    zplug romkatv/powerlevel10k, as:theme, depth:1
    sudo cp -r $HOME/.zsh/powerlevel10k $HOME/powerlevel10k
fi

# git
cd $HOME
rm .gitconfig
ln -s $HOME/.zsh/.gitconfig .gitconfig
cd $HOME/workspace/$TEMP
git clone https://github.com/holygeek/git-number
cd git-number
sudo cp git-* /usr/local/bin

echo "\e[1;33m[TODO] If Terminator user. \n 1. Open Preferences using the context menu. \n\n 2.Under Profiles select the General tab (should be selected already), uncheck Use the system fixed width font (if not already) and select MesloLGS NF Regular. \n\n 3.Exit the Preferences dialog by clicking Close.\e[0m\n"
rm -rf $HOME/workspace/$TEMP

# cp $HOME/.zsh/powerlevel10k/p10k-instant-prompt-yuigawada.zsh ${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh
source $HOME/.zshrc

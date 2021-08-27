#! /bin/sh
pacmanInstall()
{
  if pacman -Qs $1 > /dev/null; then
    echo $1 "is already installed"
  else
    sudo pacman -S $1 --noconfirm
  fi
}

pamacInstall()
{
  if pacman -Qs $1 > /dev/null; then
    echo $1 "is already installed"
  else
    sudo pamac install $1 --no-confirm
  fi
}

yayInstall()
{
  if pacman -Qs $1 > /dev/null; then
    echo $1 "is already installed"
  else
    yay -S $1 --noconfirm
  fi
}

gitInstall() {
  if pacman -Qs $2 > /dev/null; then
    echo $2 "is already installed"
  else
    git clone $1 ~/Downloads/$2
    cd ~/Downloads/$2
    makepkg -si
    cd ~/
    rm -Rf ~/Downloads/$2
  fi
}

# install zsh
if pacman -Qs zsh > /dev/null; then
  echo "zsh is already installed"
else
  sudo pacman -Syu zsh --noconfirm
fi

# install vim
pacmanInstall "vim"

# install git
pacmanInstall "git"

# install albert (keyboard launcher)
pamacInstall "albert"

# first step to install yay AUR helper
pacmanInstall "base-devel"

# install yay aur helper
gitInstall "https://aur.archlinux.org/yay-git.git" "yay"

#set same yay config
yay --save --answerclean All
yay --save --answerdiff None

###############
####### install AUR packages
###############

# install chrome
yayInstall "google-chrome-beta"

# install spotify
yayInstall "spotify"

# install vscode
yayInstall "vscode"

# install discord
yayInstall "discord"

# install skype
yayInstall "skype"

# upgrade all the packages including AUR
yay -Syu

###############
####### installation of ohmyzsh and plugins
###############

# install oh my zsh
##sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install zsh-syntax-highlighting
##git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# install zsh-auto-suggestions
##git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

###############
####### Add a way to install AUR packages
###############



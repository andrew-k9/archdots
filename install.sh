#!/bin/bash
# This is NOT for installing arch on whatever device, this
# is a glorified package downloader and linker
# This will write over anything in your home folder!

DFP=`cd $(dirname $0) ; pwd -P`

symlink() {
	cd $1
	files=$(find | sed 's/^\.//g' | sed 's/^\///g')
	for f in $files; do 
		ln -sfn $1/$f $2/$f
		echo "$2/$f to $1/$f"
	done
}

# 1 - link the files
symlink "$DFP/vim" "$HOME"
symlink "$DFP/neovim" "$HOME/.config/nvim"
symlink "$DFP/zsh" "$HOME"
symlink "$DFP/bash" "$HOME"
symlink "$DFP/git" "$HOME"
symlink "$DFP/system" "$HOME"
symlink "$DFP/qtile" "$HOME/.config/qtile"
symlink "$DFP/kitty" "$HOME/.config/kitty"

# 2 - install all the packages
# Assumes you've set up a user and installed
# sudo already. More of a reminder list so may not 
# be 100% effective!
echo -p "Do you want to install programs? [y/n]: "
read INSTALL
if [[ INSTALL == [yY] ]] 
then
  sudo pacman -S \
    neovim \
    grub \
    efibootmgr \
    dosfstools \
    os-prober \
    mtools \
    networkmanager \
    curl \ 
    zsh \
    kitty \
    qtile \
    openssh \
    ripgrep \
    fzf \
    base-devel 
  grub-install --target=x86_64-efi --efi-directory=/boot
  mkdir /boot/EFI/boot
  cp /boot /EFI/arch/grubx64.efi /boot/EFI/boot/bootx64.efi
  echo -p "Install yay (needed for fonts)? [y/n]: "
  read YAY
  if [[ YAY == [yY] ]]
  then
		cd ~
		git clone https://aur.archlinux.org/yay.git
		cd yay
		makepkg -si
		cd $DFP
		yay -S nerd-fonts-jetbrains-mono nerd-fonts-fira-code
		fc-cache -fv
	fi
  echo "Have you enabled multilib? [y/n]: "
  read MULTILIB
  if [[ MULTILIB == [yY] ]]
  then 
    sudo pacman -S \
      xorg \
      xorg-server \
      xorg-app \
      xorg-init \
      lightdm \
      lightdm-gtk-greeter lightdm-gtk-greeter-settings
    sudo systemctl enable lightdm.service
  fi
  sudo pacman -S alsa-utils
  echo -p "Install fonts?"
  echo "Make zshell default? [y/n]: "
  read DSHELL
  if [[ DSHELL == [yY] ]]
  then
    sudo chsh -s $(which zsh)
  fi
  echo "Install Programming stuff?"
  read TMP
  if [[ TMP == [yY] ]]
  then
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  fi
  reboot
fi


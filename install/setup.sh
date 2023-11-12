#!/bin/bash

echo "== INSTALL ESSENTIALS =="
sudo apt install -y curl vim build-essential zsh

echo "== INSTALL OH-MY-ZSH =="
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
command -v zsh | sudo tee -a /etc/shells
chsh -s $(which zsh) # make zsh default

echo "== INSTALL OTHER OH-MY-ZSH PLUGINS =="
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "== INSTALL NERDFONT =="
echo "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/DroidSansMono.zip"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/DroidSansMono.zip
unzip DroidSansMono.zip -d ~/.local/share/fonts
fc-cache -fv
rm ./DroidSansMono.zip

echo "== INSTALL WEZTERM =="
curl -LO https://github.com/wez/wezterm/releases/download/20230712-072601-f4abf8fd/wezterm-20230712-072601-f4abf8fd.Ubuntu20.04.deb
sudo apt install -y ./wezterm-20230712-072601-f4abf8fd.Ubuntu20.04.deb
rm wezterm-20230712-072601-f4abf8fd.Ubuntu20.04.deb

echo "== COPYING FILES =="
cp ./.zshrc ~/
cp ./.vimrc ~/
cp ./.gitconfig ~/
cp ./.config/starship.toml ~/.config/starship.toml
mkdir -p ~/.config/wezterm/
cp ./.config/wezterm/wezterm.lua ~/.config/wezterm/wezterm.lua
cp ./.zsh/aliases.zsh ~/.zsh

echo "== RESTART PC =="
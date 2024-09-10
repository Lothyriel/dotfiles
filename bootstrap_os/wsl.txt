# Ubuntu 24.04


sudo apt update
sudo apt upgrade -y


# git configs
sudo apt install gh -y
git config --global user.email "fastjonh@gmail.com"
git config --global user.name "João Xavier"
git config --global pull.rebase false


# installing lazygit tarball
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit
rm lazygit.tar.gz

# installing neovim tarball
wget https://github.com/neovim/neovim/releases/download/v0.10.1/nvim-linux64.tar.gz
tar xzvf nvim-linux64.tar.gz
sudo mv nvim-linux64 /opt/nvim
sudo ln -s /opt/nvim/bin/nvim /usr/local/bin/nvim
rm nvim-linux64.tar.gz


# neovim config dependencies
sudo apt install build-essential -y
sudo apt install ripgrep -y
sudo apt install fd-find -y
sudo apt install npm -y
sudo apt install unzip -y
sudo apt install cmake -y


#nvim dotfiles
git clone https://github.com/Lothyriel/dotfiles ~/.config/nvim


# shell config
sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> .zshrc

# dotnet 8
sudo apt install dotnet8 -y


# configure github auth
gh auth login

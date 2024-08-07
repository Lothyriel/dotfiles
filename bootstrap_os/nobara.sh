sudo dnf install -y alacritty
sudo dnf install -y ripgrep
sudo dnf install -y fd-find
sudo dnf install -y gh
sudo dnf install -y cmake
sudo dnf install -y opus-devel

sudo dnf copr enable atim/lazygit -y
sudo dnf install -y lazygit

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
sudo mkdir -p /opt/nvim
sudo mv nvim.appimage /opt/nvim/nvim
echo 'export PATH="$PATH:/opt/nvim/"' >> ~/.bashrc

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

mkdir $HOME/.config/alacritty
wget -O $HOME/.config/alacritty/alacritty.toml https://raw.githubusercontent.com/Lothyriel/dotfiles/main/bootstrap_os/alacritty.toml

git config --global user.email "fastjonh@gmail.com"
git config --global user.name "João Xavier"
git clone https://github.com/Lothyriel/dotfiles ~/.config/nvim

gh auth login

sudo dnf install -y alacritty
sudo dnf install -y neovim
sudo dnf install -y ripgrep
sudo dnf install -y fd-find
sudo dnf install -y gh
sudo dnf install -y cmake

sudo dnf copr enable atim/lazygit -y
sudo dnf install -y lazygit

git config --global user.email "fastjonh@gmail.com"
git config --global user.name "João Xavier"
git clone https://github.com/Lothyriel/dotfiles ~/.config/nvim

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

mkdir $HOME/.config/alacritty
wget -O $HOME/.config/alacritty/alacritty.toml https://raw.githubusercontent.com/Lothyriel/dotfiles/main/bootstrap_os/alacritty.toml

gh auth login

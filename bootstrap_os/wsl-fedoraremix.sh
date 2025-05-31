# git configs
sudo dnf install git -y
sudo dnf install gh -y
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
wget https://github.com/neovim/neovim/releases/download/v0.11.2/nvim-linux-x86_64.tar.gz
tar xzvf nvim-linux-x86_64.tar.gz
sudo mv nvim-linux-x86_64 /opt/nvim
sudo ln -s /opt/nvim/bin/nvim /usr/local/bin/nvim
rm nvim-linux-x86_64.tar.gz

# neovim dependencies
sudo dnf install g++ -y
sudo dnf install ripgrep -y
sudo dnf install fzf -y
sudo dnf install fd-find -y
sudo dnf install npm -y
sudo dnf install cmake -y

# neovim dotfiles
git clone https://github.com/Lothyriel/dotfiles ~/.config/nvim

# fish install
sudo dnf install fish -y
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher install hauleth/agnoster
agnoster powerline
# change theme color in ~/.config/fish/functions/fish_prompt.fish

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
echo "set -gx PATH $HOME/.cargo/bin $PATH" >> ~/.config/fish/config.fish
rustup component add rust-analyzer
# wasm-pack
curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh

# dotnet 8
sudo dnf install dotnet-sdk-8.0 -y

# fly.io cli
curl -L https://fly.io/install.sh | sh
echo "set -gx FLYCTL_INSTALL $HOME/.fly" >> ~/.config/fish/config.fish
echo "set -gx PATH $FLYCTL_INSTALL/bin $PATH" >> ~/.config/fish/config.fish
fly auth login

# configure github auth
gh auth login

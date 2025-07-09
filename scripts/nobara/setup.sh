# flatpak's
flatpak override --user --filesystem=~/.XCompose:ro
flatpak install --user flathub com.google.Chrome -y
flatpak install --user flathub com.spotify.Client -y
flatpak install --user flathub com.discordapp.Discord -y
flatpak install --user flathub md.obsidian.Obsidian -y
flatpak install --user flathub org.qbittorrent.qBittorrent -y

# fish install
sudo dnf install fish -y
chsh -s /usr/bin/fish
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher install hauleth/agnoster
agnoster powerline
## change theme color in ~/.config/fish/functions/fish_prompt.fish

# neovim dependencies
sudo dnf install wl-clipboard -y
sudo dnf install ripgrep -y
sudo dnf install fd-find -y
sudo dnf install npm -
sudo dnf copr enable atim/lazygit -y
sudo dnf install -y lazygit

# tmux configs
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# bevy dependencies
sudo dnf install alsa-lib-devel -y
sudo dnf install systemd-devel -y

# cargo installed binaries
cargo install eza

# bin untils
sudo dnf install rclone -y
sudo dnf install tmux -y
sudo dnf install alacritty -y
sudo dnf install fortune -y

sudo dnf copr enable lizardbyte/beta
sudo dnf install Sunshine -y

# dotnet 9
sudo dnf install dotnet-sdk-9.0 -y

# git
git config --global user.email "fastjonh@gmail.com"
git config --global user.name "João Xavier"

sudo dnf install gh -y
gh auth login

# fly.io cli
curl -L https://fly.io/install.sh | sh
fly auth login

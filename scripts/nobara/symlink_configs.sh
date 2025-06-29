set dotfiles $HOME/repos/dotfiles
ln -sf $dotfiles/nvim ~/.config/nvim
mkdir -p ~/.config/alacritty && ln -sf $dotfiles/alacritty.toml ~/.config/alacritty/alacritty.toml
ln -sf $dotfiles/config.fish ~/.config/fish/config.fish
ln -sf $dotfiles/tmux.conf ~/.tmux.conf

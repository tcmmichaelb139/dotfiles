cd $HOME/dotfiles
mv .profile $HOME/.profile
echo "Copied .profile"

mkdir .config
cd .config

mkdir i3
echo "Created i3 folder in .config file"

mkdir i3blocks
echo "Created i3blocks folder in .config file"

mkdir zsh
echo "Created zsh folder in .config file"

mkdir nvim
echo "Created nvim folder in .config file"

mkdir alacritty
echo "Created alacritty folder in .config file"

cd i3blocks
git clone https://github.com/vivien/i3blocks-contrib

cd $HOME/dotfiles/.config/i3
mv config $HOME/.config/i3/config
echo "Copied i3 config"

cd $HOME/dotfiles/.config/i3blocks
mv config $HOME/.config/i3blocks/config
echo "Copied i3blocks config"

cd $HOME/dotfiles/.config/zsh/
mv .zshrc $HOME/.config/zsh/.zshrc

cd $HOME/dotfiles/.config/nvim/
mv init.vim $HOME/.config/nvim/init.vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
echo "Copied init.vim and installed vim-plug"

cd $HOME/dotfiles/.config/alacritty/
mv alacritty.yml $HOME/.config/alacritty/alacritty.yml
echo "Copied alacritty config"

echo "Installing i3block dependencies"
pacman -S acpi lm_sensors sysstat perl --noconfirm

echo "Finished"

# Vim Install Setup (incomplete)

Copy config and install vim-plug here: https://github.com/junegunn/vim-plug

Then run :PlugInstall

## YCM (YouCompleteMe) setup 

sudo pacman -S python3 python-pip make cmake

Then run after you install all vim packages

python3 -m pip install --user --upgrade pynvim

go to /.config/nvim/plugged/YouCompleteMe/ and do ./install.sh --clangd-completer

go to https://github.com/ycm-core/YouCompleteMe to see all possible completers

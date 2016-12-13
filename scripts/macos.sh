
if [ ! -d ~/Pictures/screenshots ]; then
    mkdir ~/Pictures/screenshots
    defaults write com.apple.screencapture location ~/Pictures/screenshots
fi

# open blank page in Safari which is faster
defaults write com.apple.Safari NewWindowBehavior -int 1
defaults write com.apple.Safari NewTabBehavior -int 1


if ! brew ls --versions coreutils > /dev/null; then
    brew install coreutils
fi

if [ ! -e ~/.tm_properties ]; then
    ln -s ~/dotfiles/tm_properties ~/.tm_properites
fi

if [ ! -e ~/.gitconfig ]; then
    ln -s ~/dotfiles/gitconfig ~/.gitconfig
fi

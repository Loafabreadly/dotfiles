# Dotfiles Repository
All of the dotfiles needed to configure a client as I like it

## Requirements

### If you are lazy
```bash
sudo apt install git gh stow -y
```
### Git
Install Git, via APT

### Stow
Install GNU stow, via APT

## Installation & Setup

Clone the repository and CD into the directory
```bash
git clone https://github.com/Loafabreadly/dotfiles.git
cd ./dotfiles
```

Create the symlinks using GNU Stow from the current working dir, aimed at the home dir
```bash
sudo stow . -t ~
```

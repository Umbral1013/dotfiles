# Umbral's dotfiles

## Installation

1. Download and install Stow (preferably using your system's package manager).
2. Clone the GitHub repository in your home folder.
```bash
cd ~
git clone https://github.com/Umbral1013/dotfiles.git
```
3. `cd` into `~/dotfiles/`
```bash
cd ~/dotfiles
```
4. Use `stow` on the packages you wish to deploy.
```bash
stow <package_name>
```

## Management

This project has submodules. 
To initiate them, run the following command:
```bash
git submodule update --init --recursive
```

To update them, run this command:
```bash
git submodule update --init --remote
```

## Acknowledgments
- [Info on how to manage git submodules ](https://www.anishathalye.com/2014/08/03/managing-your-dotfiles/)

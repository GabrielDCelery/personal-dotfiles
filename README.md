# What is this for?

Collection of dotfiles for my personal work environment setup

# How does it work?

This setup is intended to be used with `GNU Stow` which is a symlink farm manager.

# Fast setup guide

1. Install [GNU Stow](https://www.gnu.org/software/stow/)

2. Navigate to `/home/<username>`

3. Clone this repository into `/home/<username>/dotfiles` folder (example: `git clone <this repo's url> dotfiles`)

4. Sync the dotfiles folder with the local `/home/<username>` folder

   a. Eiher run `stow .` and delete the conflicting files from `home/<username>`

   b. Run `stow --adapt .` which moves the overlapping files from `/home/<username>` to `/home/<username>/dotfiles` <code style="color : red">This will override the files in dotfiles!</code>

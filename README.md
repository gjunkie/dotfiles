# dotfiles

Streamlining my dotfiles... finally.

### Install
Most of the heavy lifting will be handled by the `bin/dotfiles` script.
- cd into the repo and run `sh bin/dotfiles`. It will prompt you with several questions to get set up. Initially it will ask you if you want to go through some software install options. These include things like `yarn`, `npm`, `xcode-select`, etc.
- **Note**: After you've gone through the optional softare installations it will will remove your current `.vim` folder, `bashrc`, and `bash_profile` and symlink new ones from this project.
- If you're using `iTerm2` make sure to import the preferred color profile from the `~/.vim/colors` directory.
- In order for `fzf.vim` to be fully set up you will also need to install `fzf`; do so by running: `brew install fzf`.

### ViM
Current `colorscheme` is `blame`. In order for this color to work, you must import the `vim/colors/blame.itermcolors` profile into your iTerm.
![alt text](https://raw.githubusercontent.com/gjunkie/dotfiles/master/images/vim_theme.png)

### bash
Nothing too fancy here, just some individual files for colors, aliases, and paths.
![alt text](https://raw.githubusercontent.com/gjunkie/dotfiles/master/images/bash.png)

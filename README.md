# dotfiles

### One-line Install

**Note**: This will will override your `.vim` folder and your dotfiles. Your user **must** have admin rights if you leave the default install location as `/usr/local/opt/dotfiles`.
```
$ bash -c "$(curl -#fL raw.github.com/gjunkie/dotfiles/main/install)"
```

### Updating dotfiles

A `dotfiles` update script will be installed in your `/usr/local/bin/` directory. 

```
$ dotfiles [-h|--help] [--update]
```

| Options        | Description                          |
| :------------- | :----------------------------------- |
| `--color`      | Choose a bash prompt colorscheme     |
| `--dotfiles`   | Update repo and copy dotfiles        |
| `--edit`       | Launch Vim and edit dotfiles         |
| `--help`       | Show help                            |
| `--software`   | Update brews, gems, and npm packages |
| `--update`     | Pull latest from the dotfiles repo   |

### Custom bash prompt

When your current working directory is a Git repository, the $PROMPT will display the checked-out branch's name (and failing that, the commit SHA that HEAD is pointing to). The state of the working tree is reflected by the color of the branch name (green: no changes, yellow: staged changes, red: unstaged changes or untracked files).

#### Screenshot

![bash prompt](https://raw.githubusercontent.com/gjunkie/dotfiles/master/images/bash_prompt_and_git.png)

#### Bash prompt colorschemes

You can use the default colorscheme shown above or create new ones. To add a new colorscheme, create a directory in `configs/bash/colorschemes/` with the name of your colorscheme. This folder should have a single file named `colors.sh`. There are six color variables you can set; `PRIMARY_FG`, `SECONDARY_FG`, `TERTIARY_FG`, `SUCCESS_FG`, `WARNING_FG`, and `ALERT_FG`. Take a look at [`configs/bash/colorschemes/default/colors.sh`](https://github.com/gjunkie/dotfiles/blob/master/configs/bash/colorschemes/default/colors.sh) for an example.

To change your bash prompt colorscheme run `$ dotfiles --color your_colorscheme_name`.

### Local/private Bash configuration

Any private and custom Bash commands and configuration should be placed in a ~/.bash_profile.local file. This file will not be under version control or committed to a public repository. If ~/.bash_profile.local exists, it will be sourced for inclusion in bash_profile.

### Todo

- Finish bash `configs/bash/colorschemes/` colorschemes feature.
- Add custom options to `dotfiles` update script.
- Figure out symlink solution to permissions issues with install location and Docker.
- Figure out snippets solution.
- Create a helper prompt to display in quickfix window.
- Fix "any key" prompt on initial install.
- Figure out how to re-symlink `dotfiles` script after making changes to it.

### Acknowledgements 

Inspiration and code was taken from many sources, including:

- [@chrisopedia](https://github.com/chrisopedia/dotfiles)
- [@lifepillar](https://github.com/lifepillar/vimrc)
- [/r/vim](https://www.reddit.com/r/vim/)

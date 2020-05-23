# dotfiles

### One-line Install

**Note**: This will will override your `.vim` folder and your dotfiles. Your user **must** have admin rights if you leave the default install location as `/usr/local/opt/dotfiles`.
```
$ bash -c "$(curl -#fL raw.github.com/gjunkie/dotfiles/master/install)"
```

### Updating dotfiles

```
$ dotfiles [-h|--help] [--update]
```

| Options        | Description                          |
| :------------- | -----------------------------------: |
| `--color`      | Choose a colorscheme                 |
| `--dotfiles`   | Update repo and copy dotfiles        |
| `--edit`       | Launch Vim and edit dotfiles         |
| `--help`       | Show help                            |
| `--software`   | Update brews, gems, and npm packages |
| `--update`     | Pull latest from the dotfiles repo   |

### Custom bash prompt

When your current working directory is a Git repository, the $PROMPT will display the checked-out branch's name (and failing that, the commit SHA that HEAD is pointing to). The state of the working tree is reflected by the color of the branch name (green: no changes, yellow: staged changes, red: unstaged changes or untracked files).

#### Screenshot

![bash prompt](https://raw.githubusercontent.com/gjunkie/dotfiles/master/images/bash_prompt_and_git.png)

### Local/private Bash configuration

Any private and custom Bash commands and configuration should be placed in a ~/.bash_profile.local file. This file will not be under version control or committed to a public repository. If ~/.bash_profile.local exists, it will be sourced for inclusion in bash_profile.

#### Todo

- Add custom options to `dotfiles` update script.
- Figure out symlink solution to permissions issues with install location and Docker.
- Figure out snippets solution.
- Create a helper prompt to display in quickfix window.

### Acknowledgements 

Inspiration and code was taken from many sources, including:
- [@chrisopedia](https://github.com/chrisopedia/) (Chris Newton) [https://github.com/chrisopedia/dotfiles](https://github.com/chrisopedia/dotfiles)
- [@lifepillar](https://github.com/lifepillar/) (Lifepillar) [https://github.com/lifepillar/vimrc](https://github.com/lifepillar/vimrc)
- [/r/vim](https://www.reddit.com/r/vim/) (Vim subreddit)

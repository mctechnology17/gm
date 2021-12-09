[![MC Technology](https://github.com/mctechnology17/mctechnology17/blob/main/src/mctechnology_extendido.GIF)](https://www.youtube.com/channel/UC_mYh5PYPHBJ5YYUj8AIkcw)

<div align="center">

  [<img align="center" alt="MC Technology | YouTube" width="22px" src="https://github.com/mctechnology17/mctechnology17/blob/main/src/youtube.png" />][youtube]
  [<img align="center" alt="@mctechnology17 | Twitter" width="22px" src="https://github.com/mctechnology17/mctechnology17/blob/main/src/twitter.png" />][twitter]
  [<img align="center" alt="@mctechnology17 | Instagram" width="22px" src="https://github.com/mctechnology17/mctechnology17/blob/main/src/instagram.png" />][instagram]
  [<img align="center" alt="MC Technology17 | Facebook" width="22px" src="https://github.com/mctechnology17/mctechnology17/blob/main/src/facebook.png" />][facebook]
  [<img align="center" alt="@mctechnology17 | Reddit" width="22px" src="https://github.com/mctechnology17/mctechnology17/blob/main/src/reddit.png" />][reddit]

</div>
<br>


[Intro](#Intro) | [Installation](#Installation) | [Alias](#Alias) | [Bindkey](#Bindkey) | [VIM](#VIM) | [Donate](#Donate) | [LICENSE](#LICENSE)

----

# Intro
`git_manager` is a assistant multi platform which can be combined
with your `zsh/bash/fish/powershell` or with your editor `vim/vi/nvim/Gvim/MacVim`.

`git_manager` is fast and lightweight and no outside dependencies.

`git_manager` works integrating with the plugin handlers or without dependency on them!

It can be integrated into all operating systems, so far tested on Linux and
some of its distributions, such as Kali, Ubuntu, Fedora, OpenSuse, of course it
was tested on MacOs, as well as on Windows working with full compatibility with
PowerShell and WSL2.

It should be noted that git_manager is compatible with the SHELLS `fish`, `zsh`,
`sh`, `bash` and `PowerShell` (tested so far)

git_manager some features:
- friendly user interface
- easy use
- multi platform (OSX, Linux, Docker, Windows, WSL2)
- multi compatibility with shells (bash, zsh, fish, PowerShell, sh, etc.)
- easy integration (keybind working full on prompt with zsh and PowerShell)
- easy alias integration (zsh, fish, bash, PowerShell etc.)
- bindkey for `zsh` and `powershell`
- completely intuitive interface
- status bar and custom prompt with current branch
- color feedback

# Installation

## Quick start
```bash
git clone https://github.com/mctechnology17/git_manager
sh git_manager/bin/git_manager
ali # option ali to alias to bash/zsh/fish if you using Linux/MacOS
zsh # select your konsole, example bash/zsh/fish
# restart your terminal or load the sources and and type the following
# alias to invoke git_manager at the prompt
# when you are in a github repository:
push # enjoy!
```

This is the interface that you receive when you activate git_manager:
```bash
    Already up to date. -> by default a git pull is applied, to avoid having conflicts with files
    2 files changed, 37 insertions(+), 15 deletions(-) -> status bar
    ==================================
    | GIT Manager by @mctechnology17 | -> name and author
    |--------------------------------|
    | [c]    config credential       | -> prolong use without password using http format (so NO SSH)
    | [y]    add, commit, push       | -> these 3 commands run at the same time
    | [t]    test: add, commit, push | -> IT WILL NOT BE ASKED AND THESE COMMANDS WILL BE EXECUTED WITHOUT INTERVENTION FROM THE USER
    | [ac]   add, commit             |
    | [p]    push                    |
    | [g]    name+mail config        | -> your name and your mail for the commits
    | [sw]   switch branch           |
    | [st]   status                  |
    | [l]    see my last commit      |
    |        press [q] to exit       |
    | [me]   merge                   |
    | [mk]   make branch             |
    | [ali]  alias to bash/zsh/fish  |
    | [bin]  cheack binary installed |
    | [all]  list all branches       |
    |        press [q] to exit       |
    | [rev]  revert the last commit  |
    | [del]  delete branch           |
    | [lic]  license                 |
    | [h]    help                    |
    |--------------------------------|
    | Press ENTER to exit or CTRL+C  |
    ==================================
    main -> current branch
```

# Alias
you can add an alias directly to your terminal when you invoke git_manager
by typing the `ali` parameter when you are in the main menu.

If you prefer to do it in a manual way, you can do it as follows,
assuming your rc-files are at their default addresses.

- For zsh
```bash
echo "$(echo "alias push='$PWD/git_manager.sh'" >> ~/.zshrc)"
```

- For bash
```bash
echo "$(echo "alias push='$PWD/git_manager.sh'" >> ~/.bashrc)"
```

- For fish
```bash
echo "$(echo "alias push "$PWD/git_manager.sh"" >> ~/.config/fish/config.fish)"
```

- For powershell
```powershell
set-alias push "C:\Users\ivanc\config_github\bin\git_manager.sh"
```

# Bindkey

- For zsh
You can add this line to your zshrc to invoke git_manager
with the key combination `CTRL+p`.

``` zsh
  bindkey -s '^p' 'push \n'
```

- For powershell
You can add this line to your `$PROFILE` to invoke git_manager
with the key combination `CTRL+p`.

For a better integration in powershell, you can add the following lines,
for this it is necessary to have the [PSReadLine][readline]
module installed.

In this way, you can invoke git_manager with the following key combinations:
`CTRL+p` when you are at the prompt using powershell
and at the same time when you are in a github or gitlab repository.

```powershell
# This is an example of a macro that you might use to execute a command.
# This will add the command to history.
Set-PSReadLineKeyHandler -Key Ctrl+p `
                         -BriefDescription git_manager.sh `
                         -LongDescription "git_manager.sh" `
                         -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert("C:\Users\home\git_manager\bin\git_manager.sh")
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}
```

# VIM
#### No Plugin Manager
If you are not using any plug manager, you can integrate git_manager to
vim in the following way, keeping in mind that the repository is in your home

```vim
    set rtp+=~/git_manager
```

#### Using [Vundle](https://github.com/gmarik/vundle):

Just add this line to your `~/.vimrc`:

```vim
Plugin 'mctechnology17/git_manager'
```
And run `:PluginInstall` inside Vim.

#### Using [pathogen.vim](https://github.com/tpope/vim-pathogen):

Copy and paste in your shell:

```bash
cd ~/.vim/bundle
git clone https://github.com/mctechnology17/git_manager
```

#### Using [vpm](https://github.com/KevinSjoberg/vpm):

Run this command in your shell:

```bash
vpm insert mctechnology17/git_manager
```

#### Using [Plug](https://github.com/junegunn/vim-plug):

Just add this line to your `~/.vimrc` inside plug call:

```vim
Plug 'mctechnology17/git_manager'
```

And run `:PlugInstall` inside Vim or `vim +PlugInstall +qa` from shell.

<img src="https://github.com/mctechnology17/mctechnology17/blob/main/src/PlugInstall.gif" height="450">

#### Running commands with VIM

Easily invoke git_manager within vim or nvim with the following command.

```vim
        :GitManager
        " If you prefer to call it with a shorter command,
        " you can include this in your vimrc or init.vim
        cnoreabbrev gm GitManager
        :gm
```

#### Mappings with VIM
Add this to your vimrc or your init.vim
```vim
    cnoreabbrev gm GitManager
    nnoremap <Leader>p :GitManager<CR>
```

#### FloatermNen
Integration with floaterm, at the moment it can only be done manually,

just add your path and replace it with the path in the following example.
If you clone the repository in your home directory,
then just copy the following mapping, keep in mind to have Floaterm
installed previously so as not to have any errors.

```vim
    nnoremap <Leader>p :FloatermNew --height=0.8 --width=0.4 --position=center $HOME/git_manager/bin/git_manager<CR>
```

# Donate
If you're enjoying Git Manager, feel free to donate or become a sponsor.
- [paypal]
- [sponsor]

Ambassador and creator/maintainer of vimtools, git_manager and more,
that are easy to integrate, but very powerful work tools that allow you to
improve your workflow, integrating with all operating systems and all possible
shells

Here you can see another recently published project:
- [vimtools]


## [LICENSE](LICENSE)

Released under the GNU General Public License v3.0.

Copyright (c) 2021 Marcos Chow Castro

[twitter]: https://twitter.com/mctechnology17
[youtube]: https://www.youtube.com/c/mctechnology17
[instagram]: https://www.instagram.com/mctechnology17/
[facebook]: https://m.facebook.com/mctechnology17/
[reddit]:https://www.reddit.com/user/mctechnology17

[git_manager]: https://github.com/mctechnology17/git_manager
[vimtools]: https://github.com/mctechnology17/vimtools
[jailbreakrepo]: https://mctechnology17.github.io/
[uiglitch]: https://repo.packix.com/package/com.mctechnology.uiglitch/
[uiswitches]: https://repo.packix.com/package/com.mctechnology.uiswitches/
[uibadge]: https://repo.packix.com/package/com.mctechnology.uibadge/
[youtuberepo]: https://github.com/mctechnology17/youtube_repo_mc_technology
[sponsor]: https://github.com/sponsors/mctechnology17
[paypal]: https://www.paypal.me/mctechnology17
[readline]: https://github.com/PowerShell/PSReadLine/blob/master/README.md

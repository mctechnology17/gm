[![MC Technology](https://github.com/mctechnology17/mctechnology17/blob/main/src/mctechnology_extendido.GIF)](https://www.youtube.com/channel/UC_mYh5PYPHBJ5YYUj8AIkcw)

<div align="center">

  [<img align="center" alt="MC Technology | YouTube" width="22px" src="https://github.com/mctechnology17/mctechnology17/blob/main/src/youtube.png" />][youtube]
  [<img align="center" alt="@mctechnology17 | Twitter" width="22px" src="https://github.com/mctechnology17/mctechnology17/blob/main/src/twitter.png" />][twitter]
  [<img align="center" alt="@mctechnology17 | Instagram" width="22px" src="https://github.com/mctechnology17/mctechnology17/blob/main/src/instagram.png" />][instagram]
  [<img align="center" alt="MC Technology17 | Facebook" width="22px" src="https://github.com/mctechnology17/mctechnology17/blob/main/src/facebook.png" />][facebook]
  [<img align="center" alt="@mctechnology17 | Reddit" width="22px" src="https://github.com/mctechnology17/mctechnology17/blob/main/src/reddit.png" />][reddit]

</div>
<br>


[Intro](#Intro) | [Installation](#Installation) | [Command](#Command) | [Alias](#Alias) | [Bindkey](#Bindkey) | [VIM](#VIM) | [Donate](#Donate) | [LICENSE](#LICENSE)

----

# Intro
`GitManager` is a manager for GIT multi platform which can be combined
with your `zsh/bash/fish/Windows Terminal Preview` or with your editor `vim/vi/nvim/Gvim/MacVim`.

`GitManager` is fast and lightweight and no outside dependencies.

`GitManager` works integrating with the plugin handlers or without dependency on them!

It can be integrated into all operating systems, so far tested on Linux and
some of its distributions, such as Kali, Ubuntu, Fedora, OpenSuse, of course it
was tested on MacOs, as well as on Windows working with full compatibility with
Windows Terminal Preview and WSL2.

It should be noted that GitManager is compatible with the SHELLS `fish`, `zsh`,
`sh`, `bash` and `Windows Terminal Preview` (tested so far)

GitManager some features:
- friendly user interface
- easy use
- multi platform (OSX, Linux, Docker, Windows, WSL2)
- multi compatibility with shells (bash, zsh, fish, Windows Terminal Preview, sh, etc.)
- easy integration (keybind working full on prompt with zsh and Windows Terminal Preview)
- easy alias integration (zsh, fish, bash, Windows Terminal Preview etc.)
- bindkey for `zsh` and `Windows Terminal Preview`
- completely intuitive interface
- status bar and custom prompt with current branch
- color feedback

# Installation

## Quick start
```bash
git clone https://github.com/mctechnology17/gm
cd gm/bin
./gm.sh
cmd # option cmd to set command line or alias if you using Linux/MacOS
z # select your konsole, example z for zsh shell
# restart your terminal or load the sources and and type the following
# alias to invoke GitManager at the prompt
# when you are in a github repository type:
push # now in a github repository type push to invoke GitManager as command line and enjoy!
```

This is the interface that you receive when you activate GitManager:

The main menu consists of two parts, and you can go from one to the other by
typing the `n` key to go forward or back.

```bash
    Already up to date. -> by default a git pull is applied, to avoid having conflicts with files
    2 files changed, 37 insertions(+), 15 deletions(-) -> status bar
    ===========================
    |        GitManager       |
    |-------------------------|
    | [con]  name+mail config | -> configure your email and your name
    | [cre]  credential time  | -> the time without passwords is prolonged using http
    | [y]    add/commit/push  | -> these three commands are run in a row
    | [ac]   add/commit       | -> these two commands are run in a row
    | [cp]   commit/push      | -> these two commands are run in a row
    | [a]    add              | -> add all files that have not been attached
    | [c]    commit           | -> commit :)
    | [p]    push             | -> push :)
    | [test] add/commit/push  | -> RUN THESE THREE COMMANDS WITHOUT ASKING
    | [h]    help/usage       | -> help, usage :)
    | [n]    next options     | -> next menu
    |-------------------------|
    | Exit: ENTER or CTRL+C   |
    ===========================
    main -> current branch

    Already up to date. -> by default a git pull is applied, to avoid having conflicts with files
    2 files changed, 37 insertions(+), 15 deletions(-) -> status bar
    ===========================
    |        GitManager       |
    |-------------------------|
    | [sw]   switch branch    |
    | [s]    status           |
    | [l]    last commit      | -> see last commit
    | [me]   merge            |
    | [mk]   make branch      |
    | [cmd]  alias/command    | -> add gm as command line or add alias to bash zsh or fish
    | [bl]   branches list    | -> lista all branches
    | [rev]  revert commit    |
    | [del]  delete branch    |
    | [lic]  license          |
    | [n]    previous         | -> previous menu
    |-------------------------|
    | Exit: ENTER or CTRL+C   |
    ===========================
    main -> current branch
```

## Flags
By default, the `git pull --ff-only` command is activated when you invoke GitManager,
but if the user wishes, he can deactivate it from vim with the following global variable.

```vim
    let g:gm_no_pull = '-np'
```

The user can also deactivate the command `git pull --ff-only` passing the following flags as a parameter:

```bash
    ./gm.sh --no-pull
    OR
    ./gm.sh -np
```

The reason why this option is activated by default is to avoid conflicts
when working in the same script, but also if this creates conflict for you,
you can deactivate it as mentioned above.

Flag disabled message:

```bash
    hint: Pulling without specifying how to reconcile divergent branches is
    hint: discouraged. You can squelch this message by running one of the following
    hint: commands sometime before your next pull:
    hint:
    hint:   git config pull.rebase false  # merge (the default strategy)
    hint:   git config pull.rebase true   # rebase
    hint:   git config pull.ff only       # fast-forward only
    hint:
    hint: You can replace "git config" with "git config --global" to set a default
    hint: preference for all repositories. You can also pass --rebase, --no-rebase,
    hint: or --ff-only on the command line to override the configured default per
    hint: invocation.
    Already up to date.
```

Flag enabled message:

```bash
    Already up to date.
```

# Command
You can set GitManager as local command line.

```bash
    ln -sf ${PWD}/gm.sh /usr/local/bin/gm
```

# Alias
You can add an alias directly to your terminal when you invoke GitManager
by typing the `cmd` parameter when you are in the main menu.

If you prefer to do it in a manual way, you can do it as follows,
assuming your rc-files are at their default addresses.

- For zsh
```bash
echo "$(echo "alias push='sh $PWD/gm.sh'" >> ~/.zshrc)"
```

- For bash
```bash
echo "$(echo "alias push='sh $PWD/gm.sh'" >> ~/.bashrc)"
```

- For fish
```bash
echo "$(echo "alias push "$PWD/gm.sh"" >> ~/.config/fish/config.fish)"
```

- For Windows Terminal Preview
```powershell
set-alias push "C:\Users\home\gm\bin\gm.sh"
```

# Bindkey

- For zsh
You can add this line to your zshrc to invoke GitManager
with the key combination `CTRL+p` or `CTRL+g` here are some examples.

``` zsh
  bindkey -s '^p' 'push \n'
  bindkey -s '^g' 'gm \n'
```

- For Windows Terminal Preview
You can add this line to your `$PROFILE` to invoke GitManager
with the key combination `CTRL+p`.

For a better integration in Windows Terminal Preview, you can add the following lines,
for this it is necessary to have the [PSReadLine][readline]
module installed.

In this way, you can invoke GitManager with the following key combinations:
`CTRL+p` when you are at the prompt using Windows Terminal Preview
and at the same time when you are in a github or gitlab repository.

```powershell
# This is an example of a macro that you might use to execute a command.
# This will add the command to history.
Set-PSReadLineKeyHandler -Key Ctrl+p `
                         -BriefDescription GitManager `
                         -LongDescription "GitManager" `
                         -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert("C:\Users\home\gm\bin\gm.sh")
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}
```

# VIM
#### No Plugin Manager
If you are not using any plug manager, you can integrate GitManager to
vim in the following way, keeping in mind that the repository is in your home

```vim
    set rtp+=~/gm
```

#### Using [Vundle](https://github.com/gmarik/vundle):

Just add this line to your `~/.vimrc`:

```vim
Plugin 'mctechnology17/gm'
```
And run `:PluginInstall` inside Vim.

#### Using [pathogen.vim](https://github.com/tpope/vim-pathogen):

Copy and paste in your shell:

```bash
cd ~/.vim/bundle
git clone https://github.com/mctechnology17/gm
```

#### Using [vpm](https://github.com/KevinSjoberg/vpm):

Run this command in your shell:

```bash
vpm insert mctechnology17/gm
```

#### Using [Plug](https://github.com/junegunn/vim-plug):

Just add this line to your `~/.vimrc` inside plug call:

```vim
Plug 'mctechnology17/gm'
```

And run `:PlugInstall` inside Vim or `vim +PlugInstall +qa` from shell.

<img src="https://github.com/mctechnology17/mctechnology17/blob/main/src/PlugInstall.gif" height="450">

#### Running commands with VIM

Easily invoke GitManager within vim or nvim with the following command.

```vim
        :GitManager
        :GitManagerS
        :GitManagerSb
        # If you prefer to call it with a shorter command,
        # you can include this in your vimrc or init.vim
        cnoreabbrev gm GitManager
        cnoreabbrev gms GitManager
        cnoreabbrev gmsb GitManager
        :gm
        :gms
        :gmsb
```

#### Mappings with VIM
Add this to your vimrc or your init.vim
```vim
    cnoreabbrev gm GitManager
    cnoreabbrev gms GitManagerS
    cnoreabbrev gmsb GitManagerS
    nnoremap <Leader>p :GitManager<CR>
    nnoremap <Leader>j :GitManagerS<CR>
    nnoremap <Leader>l :GitManagerSb<CR>
```

#### FloatermNen
Integration with floaterm, at the moment it can only be done manually,

just add your path and replace it with the path in the following example.
If you clone the repository in your home directory,
then just copy the following mapping, keep in mind to have Floaterm
installed previously so as not to have any errors.

```vim
    nnoremap <Leader>p :FloatermNew --height=0.8 --width=0.4 --position=center $HOME/gm/bin/gm.sh<CR>
```

# Donate
If you're enjoy my work, feel free to donate or become a sponsor.
- [paypal]
- [sponsor]

Ambassador and creator/maintainer of vim-better-header,
vimtools, GitManager and more, that are easy to integrate,
but very powerful work tools that allow you to
improve your workflow, integrating with all operating
systems and all possible shells

Here you can see another recently published project:
- [vim-better-header] is a better automated template
- [vimtools] functions and settings that will make it easy for you life


## [LICENSE](LICENSE)

Released under the GNU General Public License v3.0.

Copyright (c) 2021 Marcos Chow Castro

[twitter]: https://twitter.com/mctechnology17
[youtube]: https://www.youtube.com/c/mctechnology17
[instagram]: https://www.instagram.com/mctechnology17/
[facebook]: https://m.facebook.com/mctechnology17/
[reddit]:https://www.reddit.com/user/mctechnology17

[gm]: https://github.com/mctechnology17/gm
[vimtools]: https://github.com/mctechnology17/vimtools
[jailbreakrepo]: https://mctechnology17.github.io/
[uiglitch]: https://repo.packix.com/package/com.mctechnology.uiglitch/
[uiswitches]: https://repo.packix.com/package/com.mctechnology.uiswitches/
[uibadge]: https://repo.packix.com/package/com.mctechnology.uibadge/
[youtuberepo]: https://github.com/mctechnology17/youtube_repo_mc_technology
[sponsor]: https://github.com/sponsors/mctechnology17
[paypal]: https://www.paypal.me/mctechnology17
[readline]: https://github.com/PowerShell/PSReadLine/blob/master/README.md
[vim-better-header]: https://github.com/mctechnology17/vim-better-header

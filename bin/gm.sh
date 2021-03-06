# ====================================================
# FileName: gm.sh
# Author: Marcos Chow Castro <mctechnology170318@gmail.com>
# GitHub: https://github.com/mctechnology17
# Date: 11.12.2021 00:30
# ====================================================
# see: git add --all . || true
### color ### {{{
BOLD="$(tput bold 2>/dev/null || printf '')"
GREY="$(tput setaf 0 2>/dev/null || printf '')"
UNDERLINE="$(tput smul 2>/dev/null || printf '')"
RED="$(tput setaf 1 2>/dev/null || printf '')"
GREEN="$(tput setaf 2 2>/dev/null || printf '')"
YELLOW="$(tput setaf 3 2>/dev/null || printf '')"
BLUE="$(tput setaf 4 2>/dev/null || printf '')"
MAGENTA="$(tput setaf 5 2>/dev/null || printf '')"
NO_COLOR="$(tput sgr0 2>/dev/null || printf '')"
BLACKBG="printf '\e[1;40;92m'"
#}}}
### git exist? ### {{{
which git > /dev/null
if test $? -ne 0
then
  echo "${RED}$0: git is not installed. Please install it${NO_COLOR}"
  exit 1
fi
#}}}
### copyright ### {{{
copyright() {
cat <<END
  Copyright (c) 2021 Chow Castro, Marcos Iván (Nickname: MC Technology)

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.
END
  exit 1
}
#}}}
### usage ### {{{
usage (){
cat <<END
  Usage:
    ./gm.sh              -> simple use
    gm                -> as command line
    push              -> if you assigned the alias
    CTRL+p or CTRL+g  -> when you are at the prompt, if the bindkey is activated for zsh or powershell
    <LEADER>p         -> for mapping on vim/nvim

This is the interface that you receive when you activate GitManager:

The main menu consists of two parts, and you can go from one to the other by
typing the n key to go forward or back.

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
END
  exit 1
}
#}}}
### branch prompt and changed ### {{{
git_branche_prompt=$(git rev-parse --abbrev-ref HEAD)
git_changed="$(git diff --shortstat)"
#}}}
### menu_next ### {{{
menu_next() {
  clear
  echo "${BOLD}${YELLOW}$git_changed${NO_COLOR}"
  echo "${YELLOW}==========================="
  echo "|        GitManager       |"
  echo "|-------------------------|"
  echo "| [con]  name+mail config |"
  echo "| [cre]  credential time  |"
  echo "| [y]    add/commit/push  |"
  echo "| [ac]   add/commit       |"
  echo "| [cp]   commit/push      |"
  echo "| [a]    add              |"
  echo "| [c]    commit           |"
  echo "| [p]    push             |"
  echo "| [lg]   logs             |"
  echo "| [test] add/commit/push  |"
  echo "| [h]    help/usage       |"
  echo "| [n]    next options     |"
  echo "|-------------------------|"
  echo "| Exit: ENTER or CTRL+C   |"
  echo "==========================="
  printf "$git_branche_prompt ->${NO_COLOR} "
  read -r git_continue
  if [ "$git_continue" = "n" ]; then
    menu_previous
  fi
}
#}}}
### menu_previous ### {{{
menu_previous() {
  clear
  echo "${BOLD}${YELLOW}$git_changed${NO_COLOR}"
  echo "${YELLOW}==========================="
  echo "|        GitManager       |"
  echo "|-------------------------|"
  echo "| [sw]   switch branch    |"
  echo "| [s]    status           |"
  echo "| [ch]   commit history   |"
  echo "| [l]    last commit      |"
  echo "| [me]   merge            |"
  echo "| [mk]   make branch      |"
  echo "| [cmd]  alias/command    |"
  echo "| [bl]   branches list    |"
  echo "| [rev]  revert commit    |"
  echo "| [del]  delete branch    |"
  echo "| [lic]  license          |"
  echo "| [n]    previous         |"
  echo "|-------------------------|"
  echo "| Exit: ENTER or CTRL+C   |"
  echo "==========================="
  printf "$git_branche_prompt ->${NO_COLOR} "
  read -r git_continue
  if [ "$git_continue" = "n" ]; then
    menu_next
  fi
}
#}}}
### menu_main ### {{{
if [ "$1" = "--no-pull" ] || [ "$1" = "-np" ]; then
  echo "--no-pull or -np is activate"
else
  # git status 2>/dev/null
  git_pull=$(git pull --ff-only)
  if [ "$git_pull" = "Already up to date." ]; then
    echo "$git_pull"
  else
    echo "$git_pull"
    sleep 5
  fi
fi
menu_next
#}}}
### git_continue ### {{{
if [ "$git_continue" = "y" ]; then # y {{{
  clear
  echo "${YELLOW}==========================="
  echo "|        GitManager       |"
  echo "|-------------------------|"
  echo "| Write a commit          |"
  echo "| Example: update 0.1     |"
  echo "+-------------------------+"
  echo "| Press CTRL+C to exit    |"
  echo "+-------------------------+"
  printf "$git_branche_prompt ->${NO_COLOR} "
  read -r git_update
  clear
  echo "${YELLOW}==========================="
  echo "|        GitManager       |"
  echo "|-------------------------|"
  echo "| Write a branch          |"
  echo "| Example: master/main    |"
  echo "+-------------------------+"
  echo "| Press CTRL+C to exit    |"
  echo "+-------------------------+"
  printf "$git_branche_prompt ->${NO_COLOR} "
  read -r git_branche
  git add -A
  git commit -m "$git_update"
  git push -u origin $git_branche
  echo "${YELLOW}==========================="
  echo "|        GitManager        "
  echo "|--------------------------"
  echo "| [User]    -> $(git config user.name)"
  echo "| [Email]   -> $(git config user.email)"
  echo "| [Commit]  -> $git_update"
  echo "| [Branche] -> $git_branche"
  echo "+--------------------------${NO_COLOR}"
  exit 0 #}}}
elif [ "$git_continue" = "lg" ]; then # lg {{{
  git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(cyan)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all
  exit 0 #}}}
elif [ "$git_continue" = "vd" ]; then # lg {{{
  git difftool
  exit 0 #}}}
elif [ "$git_continue" = "ch" ]; then # ch {{{
  git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative
  exit 0 #}}}
elif [ "$git_continue" = "p" ]; then # p {{{
  clear
  echo "${YELLOW}==========================="
  echo "|        GitManager       |"
  echo "|-------------------------|"
  echo "| Write a branch          |"
  echo "| Example: master/main    |"
  echo "+-------------------------+"
  echo "| Press CTRL+C to exit    |"
  echo "+-------------------------+"
  printf "$git_branche_prompt ->${NO_COLOR} "
  read -r git_branche
  git push -u origin $git_branche
  echo "${YELLOW}==========================="
  echo "|        GitManager        "
  echo "|--------------------------"
  echo "| [User]    -> $(git config user.name)"
  echo "| [Email]   -> $(git config user.email)"
  echo "| [Commit]  -> $git_update"
  echo "| [Branche] -> $git_branche"
  echo "+--------------------------${NO_COLOR}"
  exit 0 #}}}
elif [ "$git_continue" = "a" ]; then # a {{{
  git add -A
  exit 0 #}}}
elif [ "$git_continue" = "c" ]; then # c {{{
  clear
  echo "${YELLOW}==========================="
  echo "|        GitManager       |"
  echo "|-------------------------|"
  echo "| Write a commit          |"
  echo "| Example: update 0.1     |"
  echo "+-------------------------+"
  echo "| Press CTRL+C to exit    |"
  echo "+-------------------------+"
  printf "$git_branche_prompt ->${NO_COLOR} "
  read -r git_update
  git commit -m "$git_update"
  echo "${YELLOW}==========================="
  echo "|        GitManager        "
  echo "|--------------------------"
  echo "| [User]    -> $(git config user.name)"
  echo "| [Email]   -> $(git config user.email)"
  echo "| [Commit]  -> $git_update"
  echo "| [Branche] -> $git_branche"
  echo "+--------------------------${NO_COLOR}"
  exit 0 #}}}
elif [ "$git_continue" = "ac" ]; then # ac {{{
  clear
  echo "${YELLOW}==========================="
  echo "|        GitManager       |"
  echo "|-------------------------|"
  echo "| Write a commit          |"
  echo "| Example: update 0.1     |"
  echo "+-------------------------+"
  echo "| Press CTRL+C to exit    |"
  echo "+-------------------------+"
  printf "$git_branche_prompt ->${NO_COLOR} "
  read -r git_update
  git add -A
  git commit -m "$git_update"
  echo "${YELLOW}==========================="
  echo "|        GitManager        "
  echo "|--------------------------"
  echo "| [User]    -> $(git config user.name)"
  echo "| [Email]   -> $(git config user.email)"
  echo "| [Commit]  -> $git_update"
  echo "| [Branche] -> $git_branche"
  echo "+--------------------------${NO_COLOR}"
  exit 0 #}}}
elif [ "$git_continue" = "con" ]; then # con {{{
  clear
  echo "${YELLOW}==========================="
  echo "|        GitManager       |"
  echo "|-------------------------|"
  echo "| Write a name            |"
  echo "| Example: Schmitz, Martin|"
  echo "+-------------------------+"
  echo "| Press CTRL+C to exit    |"
  echo "+-------------------------+"
  printf "$git_branche_prompt ->${NO_COLOR} "
  read -r git_name
  git config --global user.name "$git_name"
  clear
  echo "${YELLOW}==========================="
  echo "|        GitManager       |"
  echo "|-------------------------|"
  echo "| Write a mail            |"
  echo "| Example:                |"
  echo "| martinschmitz@gmail.com |"
  echo "+-------------------------+"
  echo "| Press CTRL+C to exit    |"
  echo "+-------------------------+"
  printf "$git_branche_prompt ->${NO_COLOR} "
  read -r git_mail
  git config --global user.email $git_mail
  clear
  echo "${YELLOW}==========================="
  echo "|        GitManager        "
  echo "|--------------------------"
  echo "| [User]    -> $(git config user.name)"
  echo "| [Email]   -> $(git config user.email)"
  echo "+--------------------------${NO_COLOR}"
  exit 0 #}}}
elif [ "$git_continue" = "cmd" ]; then # cmd {{{
  clear
  echo "${YELLOW}==========================="
  echo "|        GitManager       |"
  echo "|-------------------------|"
  echo "| [c]  set commmand line  |"
  echo "| [z]  alias to ZSH       |"
  echo "| [b]  alias to BASH      |"
  echo "| [f]  alias to FISH      |"
  echo "+-------------------------+"
  echo "| Press CTRL+C to exit    |"
  echo "+-------------------------+"
  printf "$git_branche_prompt ->${NO_COLOR} "
  read -r git_alias
  if [ "$git_alias" = "z" ]; then
    echo "Add alias to ~/.zshrc $(echo "alias push='sh $PWD/gm.sh'" >> ~/.zshrc)"
  elif [ "$git_alias" = "b" ]; then
    echo "Add alias to ~/.bashrc $(echo "alias push='sh $PWD/gm.sh'" >> ~/.bashrc)"
  elif [ "$git_alias" = "f" ]; then
    echo "Add alias to ~/.config/fish/config.fish $(echo "alias push "$PWD/gm.sh"" >> ~/.config/fish/config.fish)"
  elif [ "$git_alias" = "c" ]; then
    ln -sf ${PWD}/gm.sh /usr/local/bin/gm
  else
    echo "${YELLOW}No change made!${NO_COLOR}"
    exit 1
  fi
  clear
  echo "${YELLOW}==========================="
  echo "|        GitManager       |"
  echo "|-------------------------|"
  echo "|          Usage          |"
  echo "+-------------------------+"
  echo "| In a repository just    |"
  echo "| type [push] as alias or |"
  echo "| type [gm] as command in |"
  echo "| your terminal to invoke.|"
  echo "| IMPORTANT: Restart your |"
  echo "| terminal to take effect |"
  echo "+-------------------------+${NO_COLOR}"
  exit 0 #}}}
elif [ "$git_continue" = "lic" ]; then # lic {{{
  copyright #}}}
elif [ "$git_continue" = "h" ]; then # h {{{
  usage #}}}
elif [ "$git_continue" = "del" ]; then # del {{{
  clear
  echo "${YELLOW}==========================="
  echo "|        GitManager       |"
  echo "|-------------------------|"
  echo "| Are you sure you want to|"
  echo "| delete this branch[y/n]?|"
  echo "+-------------------------+"
  echo "| Press CTRL+C to exit    |"
  echo "+-------------------------+"
  printf "$git_branche_prompt ->${NO_COLOR} "
  read -r git_del
  if [ "$git_del" = "y" ]; then
    clear
    echo "${YELLOW}==========================="
    echo "|        GitManager       |"
    echo "|-------------------------|"
    echo "| Write the name of the   |"
    echo "| branch to delete.       |"
    echo "+-------------------------+"
    echo "| Press CTRL+C to exit    |"
    echo "+-------------------------+"
    printf "$git_branche_prompt ->${NO_COLOR} "
    read -r git_tmp
    git branch -D $git_tmp
    exit 0
  else
    echo "${YELLOW}No change made!${NO_COLOR}"
    exit 1
  fi #}}}
elif [ "$git_continue" = "mk" ]; then # mk {{{
  clear
  echo "${YELLOW}==========================="
  echo "|        GitManager       |"
  echo "|-------------------------|"
  echo "| Write the name of the   |"
  echo "| branch to make.         |"
  echo "+-------------------------+"
  echo "| Press CTRL+C to exit    |"
  echo "+-------------------------+"
  printf "$git_branche_prompt ->${NO_COLOR} "
  read -r git_tmp
  git branch $git_tmp
  exit 0 #}}}
elif [ "$git_continue" = "me" ]; then # me {{{
  clear
  echo "${YELLOW}==========================="
  echo "|        GitManager       |"
  echo "|-------------------------|"
  echo "| Write the name of the   |"
  echo "| branch to merge.        |"
  echo "+-------------------------+"
  echo "| Press CTRL+C to exit    |"
  echo "+-------------------------+"
  printf "$git_branche_prompt ->${NO_COLOR} "
  read -r git_tmp
  git merge $git_tmp
  exit 0 #}}}
elif [ "$git_continue" = "sw" ]; then # sw {{{
  clear
  echo "${YELLOW}==========================="
  echo "|        GitManager       |"
  echo "|-------------------------|"
  echo "| Write the name of the   |"
  echo "| branch to switch.       |"
  echo "+-------------------------+"
  echo "| Press CTRL+C to exit    |"
  echo "+-------------------------+"
  printf "$git_branche_prompt ->${NO_COLOR} "
  read -r git_tmp
  git switch $git_tmp
  exit 0 #}}}
elif [ "$git_continue" = "rev" ]; then # rev {{{
  clear
  echo "${YELLOW}==========================="
  echo "|        GitManager       |"
  echo "|-------------------------|"
  echo "| Sure you want to reverse|"
  echo "| the change[y/n]?        |"
  echo "+-------------------------+"
  echo "| Press CTRL+C to exit    |"
  echo "+-------------------------+"
  printf "$git_branche_prompt ->${NO_COLOR} "
  read -r git_del
  if [ "$git_del" = "y" ]; then
    git revert HEAD~1..HEAD
    exit 0
  else
    echo "${YELLOW}No change made!${NO_COLOR}"
    exit 1
  fi #}}}
elif [ "$git_continue" = "bl" ]; then # bl {{{
  clear
  git branch -a
  exit 0 #}}}
elif [ "$git_continue" = "cre" ]; then # cre {{{
  clear
  git config credential.helper store
  echo "${YELLOW}==========================="
  echo "|        GitManager       |"
  echo "|-------------------------|"
  echo "|       How much time?    |"
  echo "|-------------------------|"
  echo "| [h]     1 hour          |"
  echo "| [hh]    2 hour          |"
  echo "| [d]     1 day           |"
  echo "| [dd]    2 day           |"
  echo "| [def]   default (15 Min)|"
  echo "+-------------------------+"
  echo "| Press CTRL+C to exit    |"
  echo "+-------------------------+"
  printf "$git_branche_prompt ->${NO_COLOR} "
  read -r git_cre
  if [ "$git_cre" = "h" ]; then
    git config --global credential.helper 'cache --timeout 3600'
    echo "${YELLOW}Time extended to 1 hour"
    exit 0
  elif [ "$git_cre" = "hh" ]; then
    git config --global credential.helper 'cache --timeout 7200'
    echo "${YELLOW}Time extended to 2 hour"
    exit 0
  elif [ "$git_cre" = "d" ]; then
    git config --global credential.helper 'cache --timeout 86400'
    echo "${YELLOW}Time extended to 1 day"
    exit 0
  elif [ "$git_cre" = "dd" ]; then
    git config --global credential.helper 'cache --timeout 172800'
    echo "${YELLOW}Time extended to 2 day"
    exit 0
  elif [ "$git_cre" = "def" ]; then
    git config --global credential.helper 'cache --timeout 900'
    echo "${YELLOW}Time extended to 15 Min(default)"
    exit 0
  else
    echo "${YELLOW}No change made!${NO_COLOR}"
    exit 1
  fi #}}}
elif [ "$git_continue" = "s" ]; then # s {{{
  clear
  echo "${BOLD}${YELLOW}$(git diff --shortstat) ${NO_COLOR}"
  git status -v -s -b -u --column
  # git diff --stat HEAD^ HEAD
  exit 0 #}}}
elif [ "$git_continue" = "test" ]; then # test {{{
  clear
  git_test="$(git rev-parse --abbrev-ref HEAD)"
  git add -A && git commit -m "test" && git push -u origin $git_test
  echo "${YELLOW}==========================="
  echo "|        GitManager        "
  echo "|--------------------------"
  echo "| [User]    -> $(git config user.name)"
  echo "| [Email]   -> $(git config user.email)"
  echo "| [Commit]  -> test"
  echo "| [Branche] -> $git_test"
  echo "+--------------------------${NO_COLOR}"
  exit 0 #}}}
elif [ "$git_continue" = "l" ]; then # l {{{
  clear
  git log -1 --pretty=fuller --graph --date=short
  exit 0 #}}}
else # {{{
  echo "${YELLOW}No change made!${NO_COLOR}"
  exit 1
fi #}}}
#}}}

# vim: set sw=2 ts=2 sts=2 et ft=sh fdm=marker:

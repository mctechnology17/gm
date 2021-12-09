scriptencoding utf-8

if exists('g:git_manager_loaded')
  finish
endif

let g:git_manager_loaded =
      \ get(g:, 'git_manager_loaded', 1)

let s:root = expand('<sfile>:h:h:h')
let s:is_win = has('win32')||has('win64')
let s:is_vim = !has('nvim')
let s:is_nvim = has('nvim')
let s:is_mac = has('mac')
let s:is_linux = has('unix')

function! s:DefineHome()
  if s:is_vim
    return resolve($HOME.'/.config/nvim/plugged/git_manager/bin')
  elseif s:is_nvim
    return resolve($HOME.'/.vim/plugged/git_manager/bin')
  endif
endfunction

function! s:RunGitManager()
  let home = s:DefineHome()
  if has('nvim')
    au BufEnter * if &buftype == 'terminal' | :startinsert | endif
    if executable('zsh')
      exe "vsplit term://zsh ".home."/git_manager"
    else
      exe "vsplit term://bash ".home."/git_manager"
    endif
  else
    execute 'vert term '.home.'/git_manager'
  endif
endfunction
command! -nargs=0 GitManager       :call s:RunGitManager()

" vim: set sw=2 ts=2 sts=2 et ft=vim fdm=marker:

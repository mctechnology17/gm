" ====================================================
" FileName: gm.vim
" Author: Marcos Chow Castro <mctechnology170318@gmail.com>
" GitHub: https://github.com/mctechnology17
" Date: 11.12.2021 13:00
" ====================================================

scriptencoding utf-8

if exists('g:git_manager_loaded')
  finish
endif

let g:git_manager_loaded =
      \ get(g:, 'git_manager_loaded', 1)

" let s:root = expand('<sfile>:h:h:h')
let s:is_win = has('win32')||has('win64')
let s:is_vim = !has('nvim')
let s:is_nvim = has('nvim')
let s:is_mac = has('mac')
let s:is_linux = has('unix')

function! s:DefineHome()
  if !exists('g:git_manager_set_path')
    if s:is_nvim
      return resolve($HOME.'/.config/nvim/plugged/git_manager/bin')
    endif
    if s:is_vim
      return resolve($HOME.'/.vim/plugged/git_manager/bin')
    endif
  else
      return resolve(expand(g:git_manager_set_path))
  endif
endfunction

function! s:RunGitManager()
  if s:is_win
    echohl Error
    echom 'Try with direct keybin with powershell'
    echom 'If you dont know how to do it'
    echom 'Go to this address and read the instructions: https://github.com/mctechnology17/git_manager'
    echohl None
  else
    let home = s:DefineHome()
    if has('nvim')
      au BufEnter * if &buftype == 'terminal' | :startinsert | endif
      if executable('zsh')
        exe "vsplit term://zsh ".home."/gm"
      else
        exe "vsplit term://bash ".home."/gm"
      endif
    else
      execute 'vert term '.home.'/gm'
    endif
  endif
endfunction

function! s:RunGitManagerSb()
  if s:is_win
    echohl Error
    echom 'Try with direct keybin with powershell'
    echom 'If you dont know how to do it'
    echom 'Go to this address and read the instructions: https://github.com/mctechnology17/git_manager'
    echohl None
  else
    let home = s:DefineHome()
    if has('nvim')
      au BufEnter * if &buftype == 'terminal' | :startinsert | endif
      setlocal splitbelow
      if executable('zsh')
        exe "split term://zsh ".home."/gm"
      else
        exe "split term://bash ".home."/gm"
      endif
    else
      execute 'belowright term '.home.'/gm'
    endif
  endif
endfunction

command! -nargs=0 GitManager       :call s:RunGitManager()
command! -nargs=0 GitManagerSb     :call s:RunGitManagerSb()

" vim: set sw=2 ts=2 sts=2 et ft=vim fdm=marker:

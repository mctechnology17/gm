" ====================================================
" FileName: gm.vim
" Author: Marcos Chow Castro <mctechnology170318@gmail.com>
" GitHub: https://github.com/mctechnology17
" Date: 11.12.2021 13:00
" ====================================================

scriptencoding utf-8

if exists('g:gm_loaded')
  finish
endif

let g:gm_loaded =
      \ get(g:, 'gm_loaded', 1)

let s:is_win = has('win32')||has('win64')
let s:is_vim = !has('nvim')
let s:is_nvim = has('nvim')
let s:is_mac = has('mac')
let s:is_linux = has('unix')

function! s:WindowsError() " {{{
    echohl Error
    echom 'Try with direct keybin with powershell'
    echom 'If you dont know how to do it'
    echom 'Go to this address and read the instructions: https://github.com/mctechnology17/gm'
    echohl None
endfunction
"}}}

function! s:DefineHome() " {{{
  if s:is_vim && !has('terminal')
    throw 'terminal feature not supported by current vim.'
  endif
  if !exists('g:gm_set_path')
    if s:is_nvim
      return resolve($HOME.'/.config/nvim/plugged/gm/bin')
    endif
    if s:is_vim
      return resolve($HOME.'/.vim/plugged/gm/bin')
    endif
  else
      return resolve(expand(g:gm_set_path))
  endif
endfunction
"}}}

function! s:RunGitManager() " {{{
  if s:is_win
    call s:WindowsError()
  else
    let home = s:DefineHome()
    au BufEnter * if &buftype == 'terminal' | :startinsert | endif
    if !exists('g:gm_no_pull')
      if has('nvim')
        if executable('zsh')
          exe 'vsplit term://zsh '.home.'/gm'
        else
          exe 'vsplit term://bash '.home.'/gm'
        endif
      else
        execute 'vert term '.home.'/gm'
      endif
    elseif g:gm_no_pull ==# '-np'
      if has('nvim')
        if executable('zsh')
          exe 'vsplit term://zsh '.home.'/gm -np'
        else
          exe 'vsplit term://bash '.home.'/gm -np'
        endif
      else
        execute 'vert term '.home.'/gm -np'
      endif
    else
      echohl Error
      echom 'The declaration for the variable g:gm_no_pull is incorrect'
      echom 'Example: let g:gm_no_pull = "-np" '
      echohl None
    endif
  endif
endfunction
"}}}

function! s:RunGitManagerSb() " {{{
  if s:is_win
    call s:WindowsError()
  else
    let home = s:DefineHome()
    au BufEnter * if &buftype == 'terminal' | :startinsert | endif
    if !exists('g:gm_no_pull')
      if has('nvim')
        setlocal splitbelow
        if executable('zsh')
          exe 'split term://zsh '.home.'/gm'
        else
          exe 'split term://bash '.home.'/gm'
        endif
      else
        execute 'belowright term '.home.'/gm'
      endif
    elseif g:gm_no_pull ==# '-np'
      if has('nvim')
        setlocal splitbelow
        if executable('zsh')
          exe 'split term://zsh '.home.'/gm -np'
        else
          exe 'split term://bash '.home.'/gm -np'
        endif
      else
        execute 'belowright term '.home.'/gm -np'
      endif
    else
      echohl Error
      echom 'The declaration for the variable g:gm_no_pull is incorrect'
      echom 'Example: let g:gm_no_pull = "-np" '
      echohl None
    endif
  endif
endfunction
"}}}

function! s:RunGitManagerS() " {{{
  if s:is_win
    call s:WindowsError()
  else
    let home = s:DefineHome()
    au BufEnter * if &buftype == 'terminal' | :startinsert | endif
    if !exists('g:gm_no_pull')
      if has('nvim')
        if executable('zsh')
          exe 'split term://zsh '.home.'/gm'
        else
          exe 'split term://bash '.home.'/gm'
        endif
      else
        execute 'topleft term '.home.'/gm'
      endif
    elseif g:gm_no_pull ==# '-np'
      if has('nvim')
        if executable('zsh')
          exe 'split term://zsh '.home.'/gm -np'
        else
          exe 'split term://bash '.home.'/gm -np'
        endif
      else
        execute 'topleft term '.home.'/gm -np'
      endif
    else
      echohl Error
      echom 'The declaration for the variable g:gm_no_pull is incorrect'
      echom 'Example: let g:gm_no_pull = "-np" '
      echohl None
    endif
  endif
endfunction
"}}}

command! -nargs=0 GitManager       :call s:RunGitManager()
command! -nargs=0 GitManagerS      :call s:RunGitManagerS()
command! -nargs=0 GitManagerSb     :call s:RunGitManagerSb()

" vim: set sw=2 ts=2 sts=2 et ft=vim fdm=marker:

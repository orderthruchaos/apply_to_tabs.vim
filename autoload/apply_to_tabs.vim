if exists('g:autoload_apply_to_tabs_version')
  finish
endif


" let g:autoload_apply_to_tabs_version = {
"       \   'major':   0
"       \ , 'minor':   0
"       \ , 'release': 1
"       \ , 'build':   1
"       \ }


function! apply_to_tabs#WinDoCall(win_func, ...) " {{{
  let Fn = function(a:win_func)
  let wn = winnr()

  windo :call call(Fn, a:000)

  exec ":normal! " . wn . "\<c-w>w"
endfunction " }}}


function! apply_to_tabs#TabDoCall(tab_func, ...) " {{{
  echom a:tab_func
  let Fn = function(a:tab_func)
  let tn = tabpagenr()
  let wn = winnr()

  tabdo :call call(Fn, a:000)

  exec ":normal! " . tn . "gt\n"
  exec ":normal! " . wn . "\<c-w>w"
endfunction " }}}


function! apply_to_tabs#TabDoWinDoCall(tab_win_func, ...) " {{{
  let Fn = function(a:tab_win_func)
  let tn = tabpagenr()
  let wn = winnr()

  tabdo :windo :call call(Fn, a:000)

  exec ":normal! " . tn . "gt\n"
  exec ":normal! " . wn . "\<c-w>w"
endfunction " }}}



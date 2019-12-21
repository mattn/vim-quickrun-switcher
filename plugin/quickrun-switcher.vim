function! s:switch_quickrun(config) abort
  if !has_key(g:quickrun#default_config, a:config)
    return
  endif
  let b:quickrun_config = g:quickrun#default_config[a:config]
endfunction

function! QuickRunSwitcherComplete(arglead, cmdline, pos) abort
  return filter(filter(keys(g:quickrun#default_config), 'v:val != "*" && stridx(v:val, &filetype)==0'), 'stridx(v:val, a:arglead) == 0')
endfunction

command -nargs=1 -complete=customlist,QuickRunSwitcherComplete SwitchQuickRun call s:switch_quickrun(<f-args>)

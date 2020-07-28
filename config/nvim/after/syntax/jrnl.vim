setlocal syntax=markdown
setlocal textwidth=88
setlocal spell

" Spellcheck ignore patterns
syntax match NoSpellUrl '\w\+:\/\/[^[:space:]]\+' contains=@NoSpell
syntax match NoSpellSeasonEp 's\d\+e\d\+' contains=@NoSpell
syntax match NoSpellApostrophe '\'s' contains=@NoSpell
syntax match JrnlEntryTitleSyntax '^\[\d\{4}-\d\{2}-\d\{2} \d\{2}:\d\{2}\] ' contains=@JrnlEntryTitle



function! JrnlFolds()
  let line = getline(v:lnum)
  if match(line, '^\(\*\{1,2}\|#\{1,3}\)') >= 0
    return ">2"
  elseif match(line, '^\[\d\{4}-\d\{2}-\d\{2} \d\{2}:\d\{2}\] ') >= 0
    return ">1"
  else
    return "="
  endif
endfunction
setlocal foldmethod=expr
setlocal foldexpr=JrnlFolds()

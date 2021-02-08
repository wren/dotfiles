
" @todo move this to lua
" Note: this doesn't work in lua, yet (can't pass a function reference to viml
" from lua)
" It might look something like this:
" function fzf_spell()
"   local suggestions = fn.spellsuggest(fn.expand('<cword>'))
"   return fn['fzf#run'](fn['fzf#wrap']({
"     source = suggestions,
"     sink = fn.function('Fzf_spell_sink'),
"   }))
" end
function! FzfSpellSink(word)
  exe 'normal! "_ciw'.a:word
endfunction

function! FzfSpell()
  let suggestions = spellsuggest(expand("<cword>"))
  return fzf#run(fzf#wrap({'source': suggestions, 'sink': function("FzfSpellSink")}))
endfunction


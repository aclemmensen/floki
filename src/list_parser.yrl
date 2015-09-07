Nonterminals selectors selector attrs.
Terminals '[' ']' '=' ident id class nest combine.
Rootsymbol selectors.

Left  50 nest.
Left 100 combine.

selectors -> selector : '$1'.
selectors -> selector nest selectors : {nest, '$1', '$3'}.
selectors -> selector selectors : {match, '$1', '$2'}.

attrs -> '[' ident ']' : {attr, '$2'}.
attrs -> '[' ident '=' ident ']' : {attr, '$2', '$3', '$'}.

selector -> ident : {elem, extract_token('$1')}.
selector -> id ident : {id, extract_token('$2')}.
selector -> class ident : {class, extract_token('$2')}.
selector -> attrs : {attr, '$1'}.

Erlang code.

extract_token({_Token, _Line, Value}) -> Value.


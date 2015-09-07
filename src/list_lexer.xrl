Definitions.

H = [0-9a-f]
NMSTART = [_a-z]
NMCHAR = [a-z0-9_-]
NL = \n|\r\n|\r
STRING1 = "([\s\t!#$%&(-~]|\\{NL}|')*"
STRING2 = '([\s\t!#$%&(-~]|\\{NL}|")*'
IDENT = -?{NMSTART}{NMCHAR}*
NAME = {NMCHAR}+
INT = [0-9]+
NUM = [0-9]+|[0-9]*\.[0-9]+
STRING = {STRING1}|{STRING2}
URL = ([!#$%&*-~])*
W = [\s\t\r\n\f]*
RANGE = \?{1,6}|{h}(\?{0,5}|{h}(\?{0,4}|{h}(\?{0,3}|{h}(\?{0,2}|{h}(\??|{h})))))
INCLUDES = ~=
DASHMATCH = |=
ENDSWITH = $=
BEGINSWITH = ^=
SUBSTRING = *=
COMMA = {W}*,{W}*

Rules.

{STRING} : {token, {string, TokenLine, TokenChars}}.
{IDENT} : {token, {ident, TokenLine, TokenChars}}.
\.            : {token, {class, TokenLine, TokenChars}}.
\#            : {token, {id, TokenLine, TokenChars}}.
\[            : {token, {'[',  TokenLine}}.
\]            : {token, {']',  TokenLine}}.
{COMMA}       : {token, {combine,  TokenLine}}.
{W}+          : {token, {nest, TokenLine}}.

Erlang code.

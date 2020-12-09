if exists("b:current_syntax")
  finish
endif

" ^(?!$)[^#@].+
syn match sentParagraph '^$\@!.*$'
syn match sentComment '^#.*$'
syn match sentImage '^@.*$'
syn match sentList '^ *- .*$'

syn region sentQuote start='"' end='"'

hi def link sentParagraph Statement
hi def link sentComment Comment
hi def link sentImage Special
hi def link sentList Special

hi def link sentQuote String

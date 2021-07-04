"ESCキーをCtr+j
imap <C-j> <esc>
noremap! <C-j> <esc>

"タブ・スペースの可視化
set list
set listchars=tab:»-,trail:-,eol:↵,extends:»,precedes:«,nbsp:%

" 全角スペース・行末のスペース・タブの可視化
if has("syntax")
  syntax on
  " PODバグ対策
  syn sync fromstart
  function! ActivateInvisibleIndicator()
    " 下の行の"　"は全角スペース
    syntax match InvisibleJISX0208Space "　" display containedin=ALL
    highlight InvisibleJISX0208Space term=underline ctermbg=Blue guibg=darkgray gui=underline
    "syntax match InvisibleTrailedSpace "[ \t]\+$" display containedin=ALL
    "highlight InvisibleTrailedSpace term=underline ctermbg=Red guibg=NONE gui=undercurl guisp=darkorange
    "syntax match InvisibleTab "\t" display containedin=ALL
    "highlight InvisibleTab term=underline ctermbg=white gui=undercurl guisp=darkslategray
  endfunction
  augroup invisible
    autocmd! invisible
    autocmd BufNew,BufRead * call ActivateInvisibleIndicator()
  augroup END
endif

" シンタックスハイライトの有効化
syntax enable

"vimの色設定"
set background=dark
colorscheme hybrid

"行番号を表示
set number
:highlight lineNr ctermfg=230

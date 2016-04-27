""" vim: ft=vim

if filereadable(expand('~/.vimrc.plugins'))
  source ~/.vimrc.plugins
endif

" Required:
filetype plugin indent on

""" ----- Options
set number
set wildmenu
set showcmd
set shiftwidth=4
set autoindent
set smartindent
set smarttab
set tabstop=4
set expandtab
set nobackup
set autoread
set noswapfile
set nowrap
if $LANG == 'ja_JP.eucJP'
    set enc=euc-jp
    set fenc=euc-jp
else
    set enc=utf-8
    set fenc=utf-8
endif
set fencs=ucs-bom,utf-8,euc-jp,iso-2022-jp,sjis,cp932,cp20932
set backspace=indent,eol,start
set incsearch
set cursorline
set textwidth=0
set tags=~/.tags

" incremant option.
set nf=alpha,hex

" for double byte string
set ambiwidth=double

" set IME Off
set iminsert=0
set imsearch=0
set imdisable

" disable matchparen
let g:loaded_matchparen = 1

set cmdheight=1

" use clipboard
set clipboard+=unnamed

""" ----- filetype settings
filetype plugin indent on
augroup coding
    autocmd!
    autocmd FileType c,cpp,perl,rb,php,ctp,python set cindent
    autocmd FileType php set ft=php.html
    autocmd FileType smarty set ft=smarty.html
augroup END
syntax on

augroup numberwidth
    autocmd!
    autocmd BufEnter,WinEnter,BufWinEnter * let &l:numberwidth = len(line("$")) + 2
augroup END

" undo setting
if has('persistent_undo')
    set undodir=~/.vim/undo
    set undofile
endif

""" ----- status line setting
set showtabline=2
set laststatus=2

""" ----- misc
"Prefix-key
nnoremap [Prefix] <nop>
nmap , [Prefix]

inoremap <silent> <Esc> <Esc>
inoremap <silent> <C-[> <Esc>

" allow key
inoremap OA <up>
inoremap OB <down>
inoremap OC <right>
inoremap OD <left>

" increment
nnoremap ++ <C-a>
nnoremap -- <C-x>

" clear hilight
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" shift + move selection
imap <S-down> <ESC>v
imap <S-up> <ESC>v<up>
imap <S-left> <ESC>v
imap <S-right> <ESC><right>v
vnoremap <S-down> <down>
vnoremap <S-up> <up>
vnoremap <S-left> <left>
vnoremap <S-right> <right>

" auto paren (visual mode)
vnoremap { "zdi{<C-R>z}<ESC>
vnoremap [ "zdi[<C-R>z]<ESC>
vnoremap ( "zdi(<C-R>z)<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>

" centering find position.
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz
nmap G Gzz

" search option
noremap <expr> <C-b> max([winheight(0) - 2, 1]) . "\<C-u>" . (line('.') < 1         + winheight(0) ? 'H' : 'L')
noremap <expr> <C-f> max([winheight(0) - 2, 1]) . "\<C-d>" . (line('.') > line('$') - winheight(0) ? 'L' : 'H')
noremap <expr> <C-y> (line('w0') <= 1         ? 'k' : "\<C-y>")
noremap <expr> <C-e> (line('w$') >= line('$') ? 'j' : "\<C-e>")

" yank to line end
nmap Y y$<ESC>

" reload .vimrc
nnoremap [Prefix]vr  :<C-u>source $MYVIMRC<Return>
command! -nargs=0 ReloadSetting :<C-u>source $MYVIMRC<Return>
nnoremap [Prefix]vv  :<C-u>e $MYVIMRC<Return>

""" unite prefix key

" key-remap (require unite)
nnoremap <silent> [Prefix]ub :<C-u>Unite buffer<CR>
nnoremap <silent> [Prefix]us :<C-u>Unite snippet<CR>
nnoremap <silent> [Prefix]uy :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [Prefix]uR :<C-u>vsplit<CR><C-w><C-w>:<C-u>Unite file_mru<CR>
nnoremap <silent> [Prefix]ur :<C-u>Unite file_mru -default-action=tabopen<CR>
nnoremap <silent> [Prefix]uH :<C-u>Unite qfixhowm<CR>
nnoremap <silent> [Prefix]uh :<C-u>Unite qfixhowm -default-action=tabopen<CR>
nnoremap <silent> [Prefix]ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> [Prefix]uo :<C-u>Unite outline<CR>
nnoremap <silent> [Prefix]uG :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> [Prefix]ug :<C-u>UniteResume search-buffer<CR>
nnoremap <silent> [Prefix]ut :<C-u>Unite tab<CR>
nnoremap <silent> [Prefix]f :<C-u>Unite outline<CR>
nnoremap <silent> [Prefix]uf :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>
nnoremap <silent> [Prefix]uF :<C-u>VimFilerBufferDir -default-action=tabopen<CR>
nnoremap <silent> [Prefix]r :<C-u>edit .<CR>
nnoremap <silent> [Prefix]R :<C-u>tabnew<CR>:<C-u>edit .<CR>

" Open Scratch
nnoremap <silent> [Prefix]sc :<C-u>tabnew<CR>:<C-u>e ~/.scratch.howm<CR>
command! -nargs=0 ScratchOpen :tabnew<CR>e ~/.scratch.howm

" temp extention file
if version >= 703
    command! -nargs=1 -complete=filetype Temp edit ~/.scratch.<args>
endif

command! -nargs=0 Recent :Unite file_mru -default-action=tabopen
command! -nargs=0 Bookmark :Unite bookmark -default-action=tabopen
command! -nargs=0 Hown :Unite qfixhowm -default-action=tabopen

" tab move
nnoremap <silent> [Prefix]tc :<C-u>tabnew<CR>
nnoremap <silent> [Prefix]tp :<C-u>tabprevious<CR>
nnoremap <silent> [Prefix]tn :<C-u>tabnext<CR>
nnoremap <silent> [Prefix]tl :<C-u>Unite tab<CR>
nnoremap <silent> [Prefix]w1 :<C-u>tabnext 1<CR>
nnoremap <silent> [Prefix]w2 :<C-u>tabnext 2<CR>
nnoremap <silent> [Prefix]w3 :<C-u>tabnext 3<CR>
nnoremap <silent> [Prefix]w4 :<C-u>tabnext 4<CR>
nnoremap <silent> [Prefix]w5 :<C-u>tabnext 5<CR>
nnoremap <silent> [Prefix]w6 :<C-u>tabnext 6<CR>
nnoremap <silent> [Prefix]w7 :<C-u>tabnext 7<CR>
nnoremap <silent> [Prefix]w8 :<C-u>tabnext 8<CR>
nnoremap <silent> [Prefix]w9 :<C-u>tabnext 9<CR>
nnoremap <silent> <C-t>1 :<C-u>tabnext 1<CR>
nnoremap <silent> <C-t>2 :<C-u>tabnext 2<CR>
nnoremap <silent> <C-t>3 :<C-u>tabnext 3<CR>
nnoremap <silent> <C-t>4 :<C-u>tabnext 4<CR>
nnoremap <silent> <C-t>5 :<C-u>tabnext 5<CR>
nnoremap <silent> <C-t>6 :<C-u>tabnext 6<CR>
nnoremap <silent> <C-t>7 :<C-u>tabnext 7<CR>
nnoremap <silent> <C-t>8 :<C-u>tabnext 8<CR>
nnoremap <silent> <C-t>9 :<C-u>tabnext 9<CR>

nnoremap <silent> <C-t>, :<C-u>tabprevious<CR>
nnoremap <silent> <C-t>. :<C-u>tabnext<CR>

""" ----- user function

" toggle line number
if version >= 703
    nnoremap  <sient> ,ln :<C-u>ToggleNumber<CR>
    command! -nargs=0 ToggleNumber call ToggleNumberOption()

    function! ToggleNumberOption()
        if &number
            set relativenumber
        else
            set number
        endif
    endfunction
endif

""" reopen specified encoding
command! -nargs=1 Encode :e ++enc=<args>

""" tips
" http://nanasi.jp/articles/howto/file/expand.html

""" change current dir
command! -nargs=0 Here :cd %:h

""" open test file
"command! -nargs=0 Test :e %:s?classes?tests?
"command! -nargs=0 Class :e %:s?tests?classes?

" http://blog.bonar.jp/entry/20070415/1176651778

set t_Co=256

""" ----- gui settings
if has('gui_running')
    set guioptions-=T " hide toolbar
    set guioptions-=e " gui環境で tablineを使う
    set antialias
    set visualbell t_vb= " no beep

    set guifont=Hack:h12
    set guifontwide=01フロップデザイン:h10

    " special chars (GUI only)
    set lcs=tab:>.,trail:_,extends:\
    set nolist

    " reset IME (Insert mode)
    au BufNewFile,BufRead * set iminsert=0
endif

""" language setting
if has("multi_lang")
    language C
endif

""" EOF

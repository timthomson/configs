filetype plugin indent on

" On by default, turn it off for html
let g:syntastic_mode_map = { 'mode': 'active',
   \ 'active_filetypes': [],
   \ 'passive_filetypes': ['html'] }

set statusline+=%{fugitive#statusline()}
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set laststatus=2

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:ycm_path_to_python_interpreter="/usr/bin/python"

" some stolen from greg

set autoread        "Always reload buffer when external changes detected
set undolevels=10000                "Lets have heaps of undo history
set history=10000                   "Lets have heaps of command history

"Handy commands I always forget:
"Insert literal character               ^V
"To go back in time                     :earlier 10s
"To go forward in time                  :later 10s
"To show line numbers                   :set number
"Insert something at the start of every line    Isomething<ESC>

"================ Indenting ================

set autoindent      "Retain indentation on next line
set preserveindent  "Keep indentation
set copyindent      "Replicates the exact whitespace used for indentation in the line above
set smartindent     "Turn on autoindenting of blocks

"=====[ Tab handling ]======================================

set tabstop=4       "Indentation levels every four columns
set expandtab       "Convert all tabs that are typed to spaces
set shiftwidth=4    "Indent/outdent by four columns
set shiftround      "Indent/outdent to nearest tabstop
set softtabstop=4
set textwidth=72

set wrapscan                        "Wrap searches around the end

set printoptions=paper:a4           "Get the paper size right

set visualbell                      "Use a visual bell instead of beep

set backspace=indent,eol,start      "BS past autoindents, line boundaries,
                                    "     and even the start of insertion

set showmatch                       "Match my brackets

set matchpairs+=<:>,«:»             "Match angle brackets too

set comments-=s1:/*,mb:*,ex:*/      "Stars are not part of C comments
set comments+=fb:*                  "Stars are bullets, wrap&indent accordingly

set background=dark                 "When guessing, guess bg is dark
set t_Co=256                         " terminal colours = more
let g:zenburn_high_Contrast=1
colorscheme zenburn

set wildmode=list:longest,full      "Show list of completions
                                    "  and complete as much as possible,
                                    "  then iterate full completions

set showmode                        "Show mode change messages

set updatecount=15                  "Save buffer every 10 chars typed

set backup                          "Lets have backups

set backupext=.bak

set backupdir=./.backups,~/.backups,.,/tmp

set hlsearch                        "Highlight all search matches

syntax on                           "Turn on syntax highlighting

set incsearch                       "Lookahead as search pattern specified

set ruler                           "Show cursor location info on status line

set ignorecase                      "Ignore case in all searches...
set smartcase                       "...unless uppercase letters used

set scrolloff=2                     "Scroll when 2 lines from top/bottom

"Setup a search and replace
nmap ss :%s///gc<LEFT><LEFT><LEFT><LEFT>

"============ Python ==============
set wildignore=*.pyc                    "Ignore the compiled python files.

" Format file with autoformat (capitalize to specify options)...
map F !Gformat -T4 -
map f !Gformat -T4:

" Correct common mistypings in-the-fly...
iab retrun return
iab pritn print
iab teh the
iab liek like
iab moer more

" Use space to jump down a page (like browsers do)...
noremap <Space> <PageDown>

" Keycodes timeout in 1/10 sec, maps timeout in 3 secs...
set timeout timeoutlen=300 ttimeoutlen=300

function! WordTabAsCompletion(direction)
    let col = col('.') - 1
    echo ""
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    elseif "backward" == a:direction
        return "\<c-n>"
    else
        return "\<c-p>"
    endif
endfunction

inoremap <tab>   <c-r>=WordTabAsCompletion("forward")<cr>
inoremap <s-tab> <c-r>=WordTabAsCompletion("backward")<cr>

" ------ Folding  ------
" http://smartic.us/2009/04/06/code-folding-in-vim/
set foldmethod=indent
set foldnestmax=10
set foldlevel=1
set nofoldenable        "dont fold by default

set nomodeline    " don't use it. could be possible security issue


" https://dougblack.io/words/a-good-vimrc.html
" Akahadaka

" Autoload {{{
:runtime bundle/vim-pathogen/autoload/pathogen.vim
" load Pathogen for plugin bundling and version control
:execute pathogen#infect()
" run Pathogen
" :call pathogen#runtime_append_all_bundles()
" use pathogen
" }}}
" Sensible {{{
:runtime! plugin/sensible.vim
" load Sensible plugin settings first
" the following Vim settings will override Sensible plugin
" }}}
" Colors {{{
:colorscheme badwolf         " awesome colorscheme
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
        :set t_Co=256
endif
" }}}
" Misc {{{
:syntax enable               " enable syntax processing
" }}}
" Spaces & Tabs {{{
:set tabstop=2               " number of visual spaces per TAB
:set softtabstop=2           " number of spaces in tab when editing
:set expandtab               " tabs are spaces
:nmap <leader>t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
:nmap <leader>T :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
:nmap <leader>M :set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>
:nmap <leader>m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>
" }}}
" UI Layout {{{
:set number                  " show line numbers
:set mouse=a                 " allow mouse
:nmap <leader>l :setlocal number!<CR>
" toggle line numbers shortcut
:set showcmd                 " show command in bottom bar
:set cursorline              " highlight current line
:set wildmenu                " visual autocomplete for command menu
:set lazyredraw              " redraw only when we need to
:set showmatch               " highlight matching [{()}]
:filetype indent on          " load filetype-specific indent files
:set nowrap                    " turn off line wrapping by default
:nmap <leader>w :setlocal wrap!<CR>:setlocal wrap?<CR>
" toggle line wrapping
" }}}
" {{{ UX Key Bindings
" Alternative Insert Mode when pressing Backspace
:nnoremap <BS> i<Right><BS>
" Save document
:noremap  <silent> <D-s>    :update<CR>
:vnoremap <silent> <D-s>    <C-c>:update<CR>
:inoremap <silent> <D-s>    <C-o>:update<CR>
" Save document using F6
:noremap  <silent> <F6>    :update<CR>
:vnoremap <silent> <F6>    <C-c>:update<CR>
:inoremap <silent> <F6>    <C-o>:update<CR>
" Copy to clipboard
:vnoremap <C-c> :w !pbcopy<CR><CR>
" Paste from clipboard
:vnoremap <C-v> :r !pbpaste<CR><CR>
" }}}
" {{{ Navigation
:nnoremap [1;6D :tabprevious<CR>
:nnoremap <S-BS> :tabprevious<CR> 
" CTRL+SHIFT+LEFT navigates to previous tab
:nnoremap [1;6C :tabnext<CR>
:nnoremap <S-TAB> :tabnext<CR>
" CTRL+SHIFT+RIGHT navigates to next tab
:nnoremap <TAB> <C-W>W
" TAB navigates next pane/buffer/split
:nnoremap <C-BS> <C-W>w
" BACKSPACE navigates previous pane/buffer/split
" }}}
" Searching {{{
:set incsearch               " search as characters are entered
:set ignorecase              " search all cases
:set smartcase
:set hlsearch                " highlight matches
:nnoremap <leader><space> :nohlsearch<CR>
" turn off search highlight
" }}}
" Folding {{{
:set foldenable              " enable folding
:set foldlevelstart=10       " open most folds by default
:set foldnestmax=10          " 10 nested fold max
:nnoremap <space> za
" space open/closes folds
:set foldmethod=indent       " fold based on indent level
" }}}
" Line Shortcuts {{{
:nnoremap j gj
:nnoremap k gk
" move vertically by visual line
:nmap <leader>o :set paste!<CR>
:cnoremap <C-a>  <Home>
:cnoremap <C-b>  <Left>
:cnoremap <C-f>  <Right>
:cnoremap <C-d>  <Delete>
:cnoremap <M-b>  <S-Left>
:cnoremap <M-f>  <S-Right>
:cnoremap <M-d>  <S-right><Delete>
:cnoremap <Esc>b <S-Left>
:cnoremap <Esc>f <S-Right>
:cnoremap <Esc>d <S-right><Delete>
:cnoremap <C-g>  <C-c>
:nmap <C-e> :e#<CR>
:nmap <C-n> :bnext<CR>
:nmap <C-p> :bprev<CR>
" http://statico.github.io/vim.html shortcuts
:nnoremap B ^
:nnoremap E $
" move to beginning/end of line
:nnoremap gV `[v`]
" highlight last inserted text
" }}}
" Leader Shortcuts {{{
:nnoremap <leader>u :GundoToggle<CR>
" toggle gundo
" }}}
" Airline {{{

" }}}
" CtrlP {{{
:let g:ctrlp_map = '<Leader>t'
:let g:ctrlp_match_window_bottom = 0
:let g:ctrlp_match_window_reversed = 0
:let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
:let g:ctrlp_working_path_mode = 0
:let g:ctrlp_dotfiles = 0
:let g:ctrlp_switch_buffer = 0
" }}}
" NERDTree {{{
" always change cwd to that of open file
:autocmd BufEnter * silent! lcd %:p:h

" toggle NERDTree
:nmap <leader>e :NERDTreeToggle<CR>

" open NERDTree automatically
":autocmd StdinReadPre * let s:std_in=1
" open a NERDTree automatically when vim starts up if no files were specified
":autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" change focus to opened file
":autocmd VimEnter * NERDTree
":autocmd BufNew * <TAB>
" open NERDTree automatically when vim starts up on opening a directory
":autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[
" and close vim if no files are open
":autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" NERDTree Tabs Aware Plugin set to ON by default
:let g:nerdtree_tabs_open_on_console_startup=1
:let g:nerdtree_tabs_smart_startup_focus=1
:let g:nerdtree_tabs_meaningful_tab_names=1
:let g:nerdtree_tabs_autoclose=1
:let g:nerdtree_tabs_synchronize_view=1
:let g:nerdtree_tabs_synchronize_focus=1
:let g:nerdtree_tabs_startup_cd=1

" toggle NERDTree Tabs
:nmap <leader>n <plug>NERDTreeTabsToggle<CR>
"  }}}
"  {{{ Autoformat
:noremap <F3> :Autoformat<CR>
" Fix for YAML formatting
:autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
:autocmd FileType typescript setlocal ts=2 sts=2 sw=2 expandtab
"  to Autoformat

" Autoformat on save
" Too many incompatibilities, e.g. YAML
" Should not autoformat on save
" :au BufWrite * :Autoformat
" }}}
" Syntastic {{{

" }}}
" Launch Config {{{
:set modelines=1                " use modeline
:set sessionoptions-=options
" Vim sessions default to capturing all global options
" this can cause other problems
" }}}
" Tmux {{{

" }}}
" MacVim {{{

" }}}
" AutoGroups {{{
augroup configgroup
        autocmd!
        autocmd VimEnter * highlight clear SignColumn
"        autocmd VimEnter * NERDTree
        autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
                                \:call <SID>StripTrailingWhitespaces()
        autocmd FileType java setlocal noexpandtab
        autocmd FileType java setlocal list
        autocmd FileType java setlocal listchars=tab:+\ ,eol:-
        autocmd FileType java setlocal formatprg=par\ -w80\ -T4
        autocmd FileType php setlocal expandtab
        autocmd FileType php setlocal list
        autocmd FileType php setlocal listchars=tab:+\ ,eol:-
        autocmd FileType php setlocal formatprg=par\ -w80\ -T4
        autocmd FileType ruby setlocal tabstop=2
        autocmd FileType ruby setlocal shiftwidth=2
        autocmd FileType ruby setlocal softtabstop=2
        autocmd FileType ruby setlocal commentstring=#\ %s
        autocmd FileType python setlocal commentstring=#\ %s
        autocmd BufEnter *.cls setlocal filetype=java
        autocmd BufEnter *.zsh-theme setlocal filetype=zsh
        autocmd BufEnter Makefile setlocal noexpandtab
        autocmd BufEnter *.sh setlocal tabstop=2
        autocmd BufEnter *.sh setlocal shiftwidth=2
        autocmd BufEnter *.sh setlocal softtabstop=2
augroup END
" }}}
" Backups {{{
:set backup
:set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
:set backupskip=/tmp/*,/private/tmp/*
:set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
:set writebackup
" }}}
" Custom Functions {{{
" toggle between number and relativenumber
function! ToggleNumber()
        if(&relativenumber == 1)
                set norelativenumber
                set number
        else
                set relativenumber
        endif
endfunc

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
        " save last search & cursor position
        let _s=@/
        let l = line(".")
        let c = col(".")
        %s/\s\+$//e
        let @/=_s
        call cursor(l, c)
endfunction
" }}}
" vim:foldmethod=marker:foldlevel=0

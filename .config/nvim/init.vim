" Basic Configuration €
execute pathogen#infect()
colorscheme abstract
" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o     
autocmd FileType plaintex set filetype=tex
setlocal laststatus=0
set completeopt+=menuone
set shortmess+=c   " Shut off completion messages
let g:mucomplete#enable_auto_at_startup = 1

" ¥

" Set €
"set scrolloff=999
set autochdir
set clipboard=unnamedplus
set expandtab
set fo+=t
set hidden
set ignorecase
"set infercase
set linebreak
set matchpairs+=<:> " uset % to jump between pairs
set noshiftround
set number
set relativenumber
set shell=zsh\ -i
set shiftwidth=2
set showcmd
set showmatch
set smartcase
set so=0
set softtabstop=2
set splitright
set tabstop=2
set textwidth=68

" Leader €
let maplocalleader = ";"
let mapleader = "\\"
" ¥

"autocmd Vimcr,Bufcr * set foldlevel=0
" ¥

" Folds €

augroup AutoSaveFolds
  autocmd!
  autocmd FileType * set foldmarker=\ €,\ ¥
  autocmd FileType * set foldmethod=marker
  autocmd BufWinLeave ?* mkview 1
  autocmd BufWinEnter ?* silent! loadview 1
augroup END

augroup SU2_Files
  autocmd!
  autocmd FileType cfg,python,gmsh set fde=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'\\S'?'<1':1 
  autocmd FileType cfg,python,gmsh set foldmethod=expr
augroup END

" # Function to permanently delete views created by 'mkview'
function! MyDeleteView()
    let path = fnamemodify(bufname('%'),':p')
    let path = substitute(path, '=', '==', 'g')
    if empty($HOME)
    else
        let path = substitute(path, '^'.$HOME, '\~', '')
    endif
    let path = substitute(path, '/', '=+', 'g') . '='
    " view directory
    let path = &viewdir.'/'.path
    call delete(path)
    echo "Deleted: ".path
endfunction

" # Command Delview (and it's abbreviation 'delview')
command! Delview call MyDeleteView()
" Lower-case user commands: http://vim.wikia.com/wiki/Replace_a_builtin_command_using_cabbrev
cabbrev delview <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'Delview' : 'delview')<CR>

nn<silent> <tab> @=(foldlevel('.')?'za':"\<tab>")<CR>
vn<tab> zf
set foldtext=MyFoldText()
    function MyFoldText()
      let line = getline(v:foldstart)
      let sub = substitute(line, '/\*\|\*/\|€\=', '', 'g')
      return v:folddashes . sub
endfunction

au BufRead,BufNewfile * syn match fmrkr '"* €\|"* ¥'
syn cluster vimCommentGroup contains=fmrkr
hi fmrkr ctermbg=black ctermfg=black

"" Set a nicer foldtext function €
"set foldtext=MyFoldText()
"function! MyFoldText()
"  let line = getline(v:foldstart)
"  if match( line, '^[ \t]*\(\/\*\|\/\/\)[*/\\]*[ \t]*$' ) == 0
"    let initial = substitute( line, '^\([ \t]\)*\(\/\*\|\/\/\)\(.*\)', '\1\2', '' )
"    let linenum = v:foldstart + 1
"    while linenum < v:foldend
"      let line = getline( linenum )
"      let comment_content = substitute( line, '^\([ \t\/\*]*\)\(.*\)$', '\2', 'g' )
"      if comment_content != ''
"        break
"      endif
"      let linenum = linenum + 1
"    endwhile
"    let sub = initial . ' ' . comment_content
"  else
"    let sub = line
"    let startbrace = substitute( line, '^.*{[ \t]*$', '{', 'g')
"    if startbrace == '{'
"      let line = getline(v:foldend)
"      let endbrace = substitute( line, '^[ \t]*}\(.*\)$', '}', 'g')
"      if endbrace == '}'
"        let sub = sub.substitute( line, '^[ \t]*}\(.*\)$', '...}\1', 'g')
"      endif
"    endif
"  endif
"  let n = v:foldend - v:foldstart + 1
"  let info = " " . n . " lines"
"  let sub = sub . "                                                                                                                  "
"  let num_w = getwinvar( 0, '&number' ) * getwinvar( 0, '&numberwidth' )
"  let fold_w = getwinvar( 0, '&foldcolumn' )
"  let sub = strpart( sub, 0, winwidth(0) - strlen( info ) - num_w - fold_w - 1 )
"  return sub . info
"endfunction
"" ¥
" ¥

" Maps €
" Completion maps €
inoremap <c-d> <c-x><c-v>
inoremap <c-f> <c-x><c-f>
" ¥
" UltiSnipsEdit
nmap <localleader>u :UltiSnipsEdit<cr>
" Search maps €
nnoremap * *<c-o>
nnoremap # #<c-o>
nnoremap <localleader>h :noh<cr>
"" Tags
" inoremap <localleader>n <c-g>u<Esc>/<++><cr>"_c4l<esc>:noh<CR>a
inoremap ¶ <c-g>u<Esc>/<++><cr>"_c4l<esc>:noh<CR>a
nnoremap ¶ /<++><cr>c4l<esc>:noh<CR>a
" inoremap <localleader>p <c-g>u<Esc>?<++><cr>"_c4l<esc>:noh<CR>a
" nnoremap <localleader>n /<++><cr>c4l<esc>:noh<CR>a
" nnoremap <localleader>p /<++><cr>c4l<esc>:noh<CR>a
" inoremap <leader><localleader> <c-g>u<Esc>/<++><cr>"_c4l<esc>:noh<CR>a
" nnoremap <localleader><leader> <c-g>u<Esc>?<++><cr>"_c4l<esc>:noh<CR>a
" vnoremap <leader><localleader> <c-g>u<Esc>/<++><cr>"_c4l<esc>:noh<CR>a
" vnoremap <localleader><leader> <c-g>u<Esc>?<++><cr>"_c4l<esc>:noh<CR>a
" ¥
" Command line maps €
cnoremap <c-a> <home>
cnoremap <c-e> <end>
" ¥
" Exit €
nnoremap ï ZZ 
" nnoremap Ï :bd!<cr>
nnoremap Ï <c-w><c-w>:bd!<cr>
" ¥
" Scroll €
inoremap <C-j> <esc><c-e>a
" ¥
" Movement Mappings €
onoremap k i{
onoremap nk :<c-u>normal! f{vi{<cr>
onoremap nb :<c-u>normal! f)vi(<cr>
" ¥
" Copy and paste €
" nnoremap <Leader>p "*p
" nnoremap <Leader>y "*y
" ¥
" Open my vimrc alt-gr v €
nnoremap ® :vsp $MYVIMRC<cr>
" ¥
" Split €
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap gf <c-w>vgf 
" ¥
" Buffer €
nnoremap <Leader>n :buffer<space>
nnoremap <Leader>b :vert sbuffer<space>
" ¥
" Add space and line €
nnoremap <leader><space> i<space><Esc> 
nnoremap <localleader><space> o<esc>
" ¥
" Redo in insert mode €
inoremap ü <c-o>u
" ¥
" Inactive mappings €
"" Add a line
"nnoremap <CR> o<Esc>
"" Command Line Window
"augroup commandlinewindow " Command line window enter is differente
"autocmd!
"autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>
"augroup END
" ¥
inoremap () ()<++><esc>F(a
inoremap [] []<++><esc>F[a
inoremap {} {}<++><esc>F{a

" ¥

" Plugins €
call plug#begin('~/.config/nvim/plugged')
" Live Latex Preview €
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
" Kind of working
let g:livepreview_previewer = 'zathura' 
":LLPStartPreview 
" ¥
" Conquer of Completion €
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Needs more reading
Plug 'Shougo/neco-vim'               " Completion source
Plug 'neoclide/coc-neco'             " Completion source
" little calc for coc https://github.com/weirongxu/coc-calc
" tabnine for coc
set cmdheight=2
set updatetime=300
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to €
" format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              " \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" ¥
" Use `[g` and `]g` to navigate diagnostics €
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" ¥
" GoTo code navigation. €
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" ¥
" Use K to show documentation in preview window. €
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" ¥
" Highlight the symbol and its references when holding the cursor. €
autocmd CursorHold * silent call CocActionAsync('highlight')
" ¥
" Symbol renaming. €
nmap <leader>rn <Plug>(coc-rename)
" ¥
" Remap keys for applying codeAction to the current buffer. €
nmap <leader>ac  <Plug>(coc-codeaction)
" ¥
" Apply AutoFix to problem on the current line. €
nmap <leader>qf  <Plug>(coc-fix-current)
" ¥
" Mappings for CoCList €
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" ¥
" ¥
" Vi Latex Preview €
Plug 'ychnh/vi_latex_preview'        " Working with F2
nnoremap <F2> :call latex#Ltx()<cr>
" ¥
" Pandoc syntax €
Plug 'vim-pandoc/vim-pandoc-syntax'  " Well configured
" Plug 'vim-pandoc/vim-pandoc'
" ¥
" Vim css color €
Plug 'ap/vim-css-color'
" ¥
" Title Case €
Plug 'christoomey/vim-titlecase'     " Works
nmap <leader>gt <Plug>Titlecase
vmap <leader>gt <Plug>Titlecase
nmap <leader>gT <Plug>TitlecaseLine
" ¥
" Repeat €
Plug 'tpope/vim-repeat'              " Works
Plug 'kana/vim-textobj-entire'       " I think some plugin below needs it.
Plug 'kana/vim-textobj-indent'       " I think some plugin below needs it.
Plug 'kana/vim-textobj-user'         " I think some plugin below needs it.
Plug 'tpope/vim-surround'            " Works
" ¥
" Vifm €
Plug 'vifm/vifm.vim'                 " Working
autocmd FileType vifm set filetype=vim
let g:vifm_replace_netrw = 1
let g:vifm_replace_netrw_cmd = "Vifm"
let g:vifm_embed_split = 1
nnoremap à :VsplitVifm<cr>
nnoremap À :silent vsplit term://vifm -c o <cr> i
" ¥
" EasyAlign €
Plug 'junegunn/vim-easy-align'       " Working
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" ¥
" Vim Browser Search €
Plug 'voldikss/vim-browser-search'   " Working, amazingly.
nmap <silent> <Leader>s <Plug>SearchNormaliW
vmap <silent> <Leader>s <Plug>SearchVisual
" ¥
" Vimwiki €
Plug 'vimwiki/vimwiki'               " Needs a bit more skiming.
" Filetypa mappins vim wiki €
nmap <leader>aa I[Link](<esc>pa#link)<esc>I*<space><esc>o<esc>
"kJo<esc>
augroup filetype_vimwiki
  autocmd!
  au filetype vimwiki,markdwon,pandoc set foldmethod=expr
  au filetype vimwiki,markdwon,pandoc set foldexpr=NestedMarkdownFolds()
  " Alt-gr + l -> link file
  au filetype vimwiki vnoremap <buffer> ø da[<esc>pa](file:<esc>
  au filetype vimwiki vnoremap <buffer> Ø da[<esc>pa](#link)<esc>F(
  " not working yet
  "au filetype vimwiki nnoremap <buffer> ø da[<esc>pa](<esc>pa.md)<esc>B
  au filetype vimwiki nnoremap <buffer> ç :w<cr>:Vimwiki2HTML<cr>
  au filetype vimwiki nnoremap <buffer> ¢ :w<cr>:!rm html/*<cr>:VimwikiAll2HTML<cr>:!brave html/%:t:r.html<cr>
  au filetype vimwiki nnoremap <buffer> µ :w<cr>:!markdown-to-anki % > /home/pedro/computer/programs/anki/decks/%<cr>:!anki &<cr>
  au filetype vimwiki nnoremap <buffer> ô  0f(yi(:!st -e cd <c-r>"<cr>
augroup end
" ¥
" Vimwiki maps €
nmap » <Plug>VimwikiNextLink
nmap õ <Plug>VimwikiPrevLink
        
" ¥
" Joker Wiki €
let wiki_joker = {}
let wiki_joker.path = '~/dados/wiki/'
let wiki_joker.path_html = '~/dados/wiki/html/'
let wiki_joker.template_path = '~/dados/wiki/html/template/'
let wiki_joker.template_default = 'def_template'
let wiki_joker.template_ext = '.tpl'
let wiki_joker.syntax = 'markdown'
let wiki_joker.ext = '.md'
let wiki_joker.custom_wiki2html = 'convert.py'
let wiki_joker.links_space_char = '_'
nmap ¹ 1<leader>ww
" ¥
" Fauldade Wiki €
let wiki_faul = {}
let wiki_faul.path = '~/dados/faculdade/wiki/'
let wiki_faul.path_html = '~/dados/faculdade/wiki/html/'
let wiki_faul.template_path = '~/dados/faculdade/wiki/html/template/'
let wiki_faul.template_default = 'def_template'
let wiki_faul.template_ext = '.tpl'
let wiki_faul.syntax = 'markdown'
let wiki_faul.ext = '.md'
let wiki_faul.custom_wiki2html = 'convert.py'
let wiki_faul.links_space_char = '_'
nmap ² 2<leader>ww
" ¥
" Computer Wiki €
let wiki_comp = {}
let wiki_comp.path = '~/dados/computer/wiki/'
let wiki_comp.path_html = '~/dados/computer/wiki/html/'
let wiki_comp.template_path = '~/dados/computer/wiki/html/template/'
let wiki_comp.template_default = 'def_template'
let wiki_comp.template_ext = '.tpl'
let wiki_comp.syntax = 'markdown'
let wiki_comp.ext = '.md'
let wiki_comp.custom_wiki2html = 'convert.py'
let wiki_comp.links_space_char = '_'
nmap ³ 3<leader>ww
" ¥
" Custom variabels €
let g:vimwiki_list = [wiki_joker, wiki_faul, wiki_comp]
let g:vimwiki_global_ext = 0
let g:vimwiki_folding = 'custom'
" ¥
" ¥
" Translator €
Plug 'voldikss/vim-translator'       " Needs study settings. - compare with coc-translate
let g:translator_target_lang="en"
let g:translator_default_engines=['google']
", 'haici']
let g:translator_history_enable="true"
""" Configuration example
" Echo translation in the cmdline
nmap <silent> <LocalLeader>tt <Plug>TranslateW
vmap <silent> <LocalLeader>tt <Plug>TranslateV
" substituir the text with translation
nmap <silent> <LocalLeader>tr <Plug>TranslateR
vmap <silent> <LocalLeader>tr <Plug>TranslateRV
" Translate the text in clipboard
nmap <silent> <LocalLeader>tc <Plug>TranslatesX
" ¥
" Calendar €
Plug 'itchyny/calendar.vim'          " Not working
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
" ¥
" UltiSnips €
Plug 'SirVer/ultisnips'              " Working like hell - Amazing - Skiming
" Mapped to alt-gr q
let g:UltiSnipsExpandTrigger="<End>"
let g:UltiSnipsJumpForwardTrigger="<End>"
let g:UltiSnipsJumpBackwardTrigger="<M-b>"
let g:UltiSnipsListSnippets="<M-.>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" ¥
" Vimtex €
Plug 'lervag/vimtex'
 " Compile on initialization, cleanup on quit
 augroup vimtex_event_1
   au!
   au User VimtexEventQuit     call vimtex#compiler#clean(0)
 augroup END
 let g:tex_flavor='latex'
 " let g:vimtex_quickfix_mode=0
 let g:latex_view_general_viewer = 'zathura'
 let g:vimtex_view_method = "zathura"
 set conceallevel=2
 let g:tex_conceal='abdmg'
 let g:vimtex_quickfix_warnings = {
   \ 'default' : 0,
   \ 'undefined_reference' : 1,
   \ 'multiply_defined_references' : 1,
   \}
 " ¥
" Nerdcomenter €
Plug 'preservim/nerdcommenter'
" Create default mappings
let g:NERDCreateDefaultMappings = 1
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCustomDelimiters = { 'gmsh': { 'left': '//' } }
" let g:NERDCustomDelimiters = { 'gmsh': { '//' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1
nmap <silent> ’ <Plug>NERDCommenterToggle
vmap <silent> ’ <Plug>NERDCommenterToggle
" ¥
Plug 'christoomey/vim-sort-motion'   " Needs skiming.
Plug 'voldikss/vim-floaterm'         " Needs configuration
Plug 'Konfekt/vim-office'            " Read (pdf,docx,xlsx)
Plug 'masukomi/vim-markdown-folding' " Working
Plug 'vim-scripts/gnuplot.vim'       " Working
" Gmsh
Plug 'vim-scripts/gmsh.vim'          " Working
au! BufNewFile,BufFilePre,BufRead *.geo set filetype=gmsh
au FileType gmsh nnoremap <buffer> ã :w <cr> :!xdotool key --window "$(xdotool search --class FLTK \| head -1)" 0 <cr>
au FileType gmsh nnoremap <buffer> ê :e!<cr>:g/\/\/+/d<cr>
au FileType gmsh nnoremap <buffer> ó :w<cr>:silent !gmsh % &<cr>
au FileType gmsh nnoremap <buffer> å :source $MYVIMRC<cr>:se ft=gmsh <cr>
Plug 'lervag/vim-foam'               " Working. Needed a change to ftdetect.
call plug#end()
" ¥

" Pandoc syntax for vimwiki €
augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

augroup pandoc_syntax
  autocmd! FileType vimwiki set syntax=markdown.pandoc
augroup END
let g:pandoc#syntax#conceal#use = 1
let g:pandoc#syntax#conceal#urls = 1
" ¥

" Spell check €
nnoremap <leader>sp :setlocal spell! spelllang=pt_br<CR>
nnoremap <leader>se :setlocal spell! spelllang=en_us<CR>
nnoremap <localleader>s :setlocal spell! spelllang=en_us,pt_br<cr> 
"" Spell correct
"inoremap æ <c-x>s
" It ba­si­cal­ly jumps to the pre­vi­ous spelling mis­take [s, then picks the first sug­ges­tion 1z=, and then jumps back `]a. The <c-g>u in the mid­dle make it pos­si­be to undo the spelling cor­rec­son quick­Ly.
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
" ¥

" Abbreviations €
inoremap ;no Pedro Vinícius Souza Coimbra
"inure map ; 171052081
inoremap ;< <++>
iabbr ry Reynolds
iabbr cl camada limite
iabbr clt camada limite turbulenta
iabbr cll camada limite laminar
iabbr Ns Números
iabbr ns números
iabbr nú número
iabbr lam laminar
iabbr aer aerofólio
iabbr aers aerofólio
" ¥

" Languages €
" Vim €
autocmd BufEnter *.vim se ft=vim
augroup filetype_vim
  autocmd!
  autocmd FileType vim nnoremap <buffer> ã :w \| source % \| noh \| se ft=vim <cr>
  autocmd FileType vim nnoremap <buffer> Ã :w \| source % \| noh \| se ft=vim \| :PlugInstall <cr>
  autocmd FileType vim set nowrap textwidth=0 wrapmargin=0 
  autocmd VimResized * exe "normal! \<c-w>="
augroup end
" ¥

" Bash €
augroup filetype_bash
  autocmd!
  autocmd FileType sh setlocal foldmethod=marker
  autocmd FileType sh nnoremap <buffer> ã :w \| !source % <cr> :noh <esc>
  autocmd FileType sh nnoremap <buffer> ;a oalias ="<++>"<Esc>F=i
  autocmd FileType sh setlocal nowrap textwidth=0 wrapmargin=0 
  autocmd VimLeave bash.bashrc !bash
augroup END
nnoremap <buffer> œ :w \| set filetype=sh \| !chmod +x % <cr>
" ¥

" Gnuplot €
augroup filetype_gnuplot
  autocmd FileType gp set filetype=gnuplot
  autocmd FileType gnuplot nnoremap <buffer> ã :w \| !gnuplot -p % <cr>
augroup END
" ¥

" Python €
augroup filetype_python
" autocmd FileType python nnoremap <buffer> ã vip:<C-U>exec '!clear; python -c' shellescape(<SID>GetVisualSelection(), 1)<cr>
autocmd FileType python nnoremap <buffer> ã :w<cr>:!python % <cr>
autocmd FileType python set nowrap textwidth=0 wrapmargin=0 
augroup END

function! s:GetVisualSelection()
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][:col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction
" ¥

" Octave €

" TOP demais -> fazer pra tudo agora haha€
if !exists("g:octave_command")
  let g:octave_command = "octave -W"
endif
"function! OctaveCompile()
"  silent !clear
"  execute "!" . g:octave_command . " " . bufname("%")
"endfunction

"nnoremap <buffer> <leader>r :call OctaveCompile()<cr>¥

augroup filetype_matlab
autocmd filetype matlab nnoremap <buffer> ã :call ShowCode()<cr>
autocmd filetype matlab nnoremap <buffer> Ã :!octave --gui % &<cr>
"autocmd filetype matlab nnoremap <buffer> ã :call ShowCode()<cr>
autocmd filetype matlab nnoremap <buffer> <leader>z :!kitty +kitten icat plot.jpg<cr>
autocmd filetype matlab inoremap <buffer> ;pt <c-g> hold on<cr>plot(<++>,<++>)<cr>xlabel("<++>")<cr>ylabel("<++>")<cr>print -djpg plot.jpg
autocmd FileType matlab nnoremap <buffer> à :w<CR>:!clear && octave -W % <CR><esc>
" autocmd FileType matlab inoremap <buffer> , .
" autocmd FileType matlab inoremap <buffer> \, ,
autocmd FileType matlab inoremap <buffer> ;q ()/(<++>)<++><esc>2F(a
autocmd FileType matlab inoremap <buffer> c= <esc>f=lC
autocmd FileType matlab nnoremap <buffer> c= f=lC
autocmd FileType matlab imap ;i <cr>% <++> €<CR>% Faturas<cr>Play=<++><cr>free=<++><cr>Nu=<++><cr>next=<++><cr>Faturas=Play+free+next+Nu<esc>vipga=o<cr>% Inglês<cr>Ingles=268.99<esc>vipga=o<cr>% Bancos<cr>BB=<++>;<cr>Santander=<++>;<cr>Bancos=BB+Santander<esc>vipga=o<cr>% Celular<cr>Vivo=54.99;<cr>Celular=Vivo<esc>vipga=o<cr>Ala=<++>;<cr>ru=<++>;<cr>Psicologa=<++>;<cr>Con=<++>;<esc>vipga=o<cr>% Externo<cr>Pai=390.51+88.33+40.39<++><cr>TotalPai =Pai+700<cr>Mae=597.74+<++><cr>TotalMae= Mae+500<cr>Nat= <++><cr>Externo=Pai+Nat+Mae<++><esc>vipga=o<cr>Total= Faturas+Ingles+Bancos+Ala+Celular+Con+ru+Psicologa<cr>Receita=815+500+700 <cr>Restante= Receita - Total + Externo<esc>vipga=<cr>i% ¥<esc>[z
autocmd FileType matlab setlocal foldmethod=marker
autocmd FileType matlab set nowrap textwidth=0 wrapmargin=0 
augroup END


function! ShowCode()
  " Get the bytecode.
  "let code = system(g:octave_command . bufname("%") . "2\>&1")
  execute "w"
  let code = system(g:octave_command . " " . bufname("%"))

  " Open a new split and  set it up.
  "vsplit _Octave_Output_
  vsplit _Octave_Output_
  normal! ggdG
  setlocal filetype=octaveoutput
  setlocal buftype=nofile

  " Insert the bytecode
  call append(0, split(code, '\v\n'))

endfunction " ¥

" C €

augroup Filetype_C
autocmd!
autocmd FileType cpp set nowrap textwidth=0 wrapmargin=0 
autocmd FileType cpp nnoremap <buffer> ã :w<cr>:!sudo make clean install<cr>
autocmd FileType c nnoremap <buffer> â :w<cr>
autocmd FileType c nnoremap <buffer> Ã :w<cr>:!make %:r %<cr>:!./%:r<cr>
autocmd FileType c nnoremap <buffer> ã :w<cr>:!make %:r %<cr>
autocmd FileType c nnoremap <buffer> é :!./%:r<cr>
autocmd FileType c nnoremap <buffer> å :source $MYVIMRC<cr>:se ft=c <cr>
autocmd FileType cpp setlocal foldmethod=marker

augroup END 


" ¥

" LateX and Markdown €
"€ autocmds
" Source vimrc and apply changes
" autocmd VimLeave *.tex !rm -f *.out *.log *.aux *.blg *.bbl
augroup latex
  autocmd!
  "" General latex mappings
  autocmd FileType tex set foldmethod=expr
  autocmd FileType tex set foldexpr=vimtex#fold#level(v:lnum)
  autocmd FileType tex set foldtext=vimtex#fold#text()
  autocmd FileType tex nnoremap <buffer> å :Delview<cr>:source $MYVIMRC<cr>:se ft=tex <cr>
  autocmd FileType rmd nnoremap <buffer> å :Delview<cr>:source $MYVIMRC<cr>:se ft=rmd <cr>
  autocmd FileType vimwiki nnoremap <buffer> å :Delview<cr>:source $MYVIMRC<cr>:se ft=vimwiki <cr>
  autocmd FileType markdown nnoremap <buffer> å :source $MYVIMRC \| se ft=markdown <cr>
  "" Load Wikki mappings
  autocmd FileType tex nnoremap <buffer> Å :source /home/pedro/.config/nvim/latex/wikki.vim <cr>
  "" Commenting lines
  autocmd FileType tex nnoremap <buffer> <Leader>0 I%<Esc>
  autocmd FileType tex nnoremap <buffer> <Leader>0 I%<Esc>

  " Mappins for the refs file
  autocmd FileType tex nnoremap <buffer> ê :!bibtex %:r <CR>
  autocmd FileType tex,markdown,rmd nnoremap <buffer> Ê :vsp /home/pedro/dados/faculdade/bibliografia/bibliography.bib <CR>
  " Compiling
  autocmd FileType tex nnoremap <buffer> ã :w<CR>:!pdflatex -interaction=nonstopmode % <CR> <Esc>
  autocmd FileType tex nnoremap <buffer> Ã :w<CR>:!pdflatex % <cr>
  autocmd FileType tex inoremap <buffer> <S-Home> <esc>:w<CR>:!pdflatex -interaction=nonstopmode % <CR> <Esc>a
  autocmd FileType tex inoremap <buffer> Æ :!dragon-drag-and-drop -a -x %:r.pdf<cr>
  " Mappings to open the pdf
  autocmd FileType tex,markdown,rmd nnoremap <buffer> <localleader>z :!zathura %:r.pdf & <CR> <Esc>
  autocmd FileType tex,markdown,rmd nnoremap <buffer> æ :!zathura %:r.pdf & <CR> <Esc>
  autocmd Filetype markdown,rmd nnoremap <buffer> <leader>w yiWi[<esc>Ea](<esc>pa)
  " autocmd Filetype markdown,rmd,vimwiki nnoremap <buffer> ã :w<cr>:vsplit term://echo \" require(rmarkdown); render('<c-r>%',encoding = 'UTF-8')\" \\| R --vanilla<cr>G<c-w><c-w><cr>
  autocmd Filetype markdown,rmd,vimwiki inoremap <buffer> Ã <esc>:w<cr>:vsplit term://echo \" require(rmarkdown); render('<c-r>%',encoding = 'UTF-8')\" \\| R --vanilla<cr>G<c-w><c-w><cr>i
  autocmd Filetype markdown,rmd,vimwiki nnoremap <buffer> Ã :w<CR>:!echo<space>"<space>require(rmarkdown);<space>render('<c-r>%',encoding = 'UTF-8')"<space>\|<space>R<space>--vanilla
  autocmd filetype tex,markdown,rmd nnoremap <buffer> <leader>k :silent !convert %:r.pdf %:r.jpg <cr>
  " autocmd Filetype markdown,rmd,vimwiki nnoremap <buffer> ã :w \| exe ":terminal echo \" require(rmarkdown); render('Notas_de_Aula_Controle.md',encoding = 'UTF-8')\" \| R --vanilla" \| bp<cr>
  " autocmd Filetype markdown,rmd,vimwiki nnoremap <buffer> ã :w \| exe ":terminal echo \" require(rmarkdown); render('Notas_de_Aula_Controle.md',encoding = 'UTF-8')\" \| R --vanilla" \| bp<cr>
  autocmd Filetype markdown,rmd,vimwiki nnoremap <buffer> ã :w<CR>:!echo<space>"<space>require(rmarkdown);<space>render('<c-r>%',encoding = 'UTF-8')"<space>\|<space>R<space>--vanilla<enter>
  " Insert €
  " Figures
  " autocmd FileType tex,markdown,rmd inoremap <buffer> ;lf <c-g>u\begin{figure}[H]<cr>\centering<cr>\includegraphics[width=0.<++> \textwidth]{<++>}<cr>\caption{<++>}<cr>\label{<++>}<cr>\end{figure}<enter><++><esc>5k<Leader><Leader>
  " autocmd FileType tex,markdown,rmd inoremap <buffer> ;llf <c-g>u\begin{figure}[H]<cr>\subfigure[<++> \label{<++>}]{<cr>\includegraphics[width=0.5 \textwidth]{<++>}}<cr>\subfigure[<++> \label{<++>}]<cr>{\includegraphics[width=0.5 \textwidth]{<++>}}<cr>\caption{<++>}<cr>\end{figure}<enter><++><esc>vip=
  " " Tables €
  " autocmd FileType tex,markdown,rmd inoremap <buffer> ;ta <c-g>u\begin{table}[H]<cr>\begin{center}<cr>\caption{<++>}<cr>\begin{tabular}{ccc}<cr>\hline<cr><++> & <++> & <++> \\ \hline\hline<cr> <++> & <++> & <++> \\<cr> <++> & <++> & <++> \\<cr>\hline<cr>\end{tabular}<cr>\label{<++>}<cr>\end{center}<cr>\end{table}<cr><++><esc>vip=
  " ¥
  " Citation and Referencing €
  autocmd FileType tex,markdown,rmd inoremap <buffer> ;ci <c-g>u\cite{}<++><Esc>T{i
  autocmd FileType tex,markdown,rmd inoremap <buffer> ;cp <c-g>u\citep{}<++><Esc>T{i
  autocmd FileType tex,markdown,rmd inoremap <buffer> ;r <c-g>u\ref{}<++><Esc>F}i
  " ¥
  " Screenshot
  autocmd filetype tex,markdown,rmd,vimwiki nnoremap <buffer> â yiw :!magick import $IMAGES/<cword>.jpg<cr>
  " autocmd FileType markdown,rmd nnoremap <buffer> â yiw :!magick import $IMAGES/<cword><cr>
  autocmd Filetype markdown,rmd inoremap <buffer> ;a <c-g>u[](<++>)<++><Esc>F[a
  autocmd Filetype markdown,rmd inoremap <buffer> <S-Home> <Esc>:w<CR>:!echo<space>"<space>require(rmarkdown);<space>render('<c-r>%',encoding = 'UTF-8')"<space>\|<space>R<space>--vanilla<enter> a
  autocmd Filetype rmd inoremap <buffer> ;p <c-g>u```{python}<CR>```<CR><CR><esc>2kO
  autocmd Filetype rmd inoremap <buffer> ;mc <c-g>u```<cr>```<cr><cr><esc>2kO
  autocmd Filetype markdown,rmd inoremap <buffer> `0             <c-g>u\emptyset
  autocmd Filetype markdown,rmd inoremap <buffer> `6             <c-g>u\partial
  autocmd Filetype markdown,rmd inoremap <buffer> `(             <c-g>u\subset
  autocmd Filetype markdown,rmd inoremap <buffer> `)             <c-g>u\supset
  autocmd Filetype markdown,rmd inoremap <buffer> `A             <c-g>u\forall
  autocmd Filetype markdown,rmd inoremap <buffer> `E             <c-g>u\exists
  autocmd Filetype markdown,rmd inoremap <buffer> `jj            <c-g>u\downarrow
  autocmd Filetype markdown,rmd inoremap <buffer> `jJ            <c-g>u\Downarrow
  autocmd Filetype markdown,rmd inoremap <buffer> `jk            <c-g>u\uparrow
  autocmd Filetype markdown,rmd inoremap <buffer> `jK            <c-g>u\Uparrow
  autocmd Filetype markdown,rmd inoremap <buffer> `jh            <c-g>u\leftarrow
  autocmd Filetype markdown,rmd inoremap <buffer> `jH            <c-g>u\Leftarrow
  autocmd Filetype markdown,rmd inoremap <buffer> `jl            <c-g>u\rightarrow
  autocmd Filetype markdown,rmd inoremap <buffer> `jL            <c-g>u\Rightarrow
  autocmd Filetype markdown,rmd inoremap <buffer> `a             <c-g>u\alpha
  autocmd Filetype markdown,rmd inoremap <buffer> `b             <c-g>u\beta
  autocmd Filetype markdown,rmd inoremap <buffer> `c             <c-g>u\chi
  autocmd Filetype markdown,rmd inoremap <buffer> `d             <c-g>u\delta
  autocmd Filetype markdown,rmd inoremap <buffer> `e             <c-g>u\epsilon
  autocmd Filetype markdown,rmd inoremap <buffer> `f             <c-g>u\phi
  autocmd Filetype markdown,rmd inoremap <buffer> `g             <c-g>u\gamma
  autocmd Filetype markdown,rmd inoremap <buffer> `h             <c-g>u\eta
  autocmd Filetype markdown,rmd inoremap <buffer> `i             <c-g>u\iota
  autocmd Filetype markdown,rmd inoremap <buffer> `k             <c-g>u\kappa
  autocmd Filetype markdown,rmd inoremap <buffer> `l             <c-g>u\lambda
  autocmd Filetype markdown,rmd inoremap <buffer> `m             <c-g>u\mu
  autocmd Filetype markdown,rmd inoremap <buffer> `n             <c-g>u\nu
  autocmd Filetype markdown,rmd inoremap <buffer> `p             <c-g>u\pi
  autocmd Filetype markdown,rmd inoremap <buffer> `q             <c-g>u\theta
  autocmd Filetype markdown,rmd inoremap <buffer> `r             <c-g>u\rho
  autocmd Filetype markdown,rmd inoremap <buffer> `s             <c-g>u\sigma
  autocmd Filetype markdown,rmd inoremap <buffer> `t             <c-g>u\tau
  autocmd Filetype markdown,rmd inoremap <buffer> `y             <c-g>u\psi
  autocmd Filetype markdown,rmd inoremap <buffer> `u             <c-g>u\upsilon
  autocmd Filetype markdown,rmd inoremap <buffer> `w             <c-g>u\omega
  autocmd Filetype markdown,rmd inoremap <buffer> `z             <c-g>u\zeta
  autocmd Filetype markdown,rmd inoremap <buffer> `x             <c-g>u\xi
  autocmd Filetype markdown,rmd inoremap <buffer> `G             <c-g>u\Gamma
  autocmd Filetype markdown,rmd inoremap <buffer> `D             <c-g>u\Delta
  autocmd Filetype markdown,rmd inoremap <buffer> `F             <c-g>u\Phi
  autocmd Filetype markdown,rmd inoremap <buffer> `G             <c-g>u\Gamma
  autocmd Filetype markdown,rmd inoremap <buffer> `L             <c-g>u\Lambda
  autocmd Filetype markdown,rmd inoremap <buffer> `P             <c-g>u\Pi
  autocmd Filetype markdown,rmd inoremap <buffer> `Q             <c-g>u\Theta
  autocmd Filetype markdown,rmd inoremap <buffer> `S             <c-g>u\Sigma
  autocmd Filetype markdown,rmd inoremap <buffer> `U             <c-g>u\Upsilon
  autocmd Filetype markdown,rmd inoremap <buffer> `W             <c-g>u\Omega
  autocmd Filetype markdown,rmd inoremap <buffer> `X             <c-g>u\Xi
  autocmd Filetype markdown,rmd inoremap <buffer> `Y             <c-g>u\Psi
  autocmd Filetype markdown,rmd inoremap <buffer> `ve            <c-g>u\varepsilon
  autocmd Filetype markdown,rmd inoremap <buffer> `vf            <c-g>u\varphi
  autocmd Filetype markdown,rmd inoremap <buffer> `vk            <c-g>u\varkappa
  autocmd Filetype markdown,rmd inoremap <buffer> `vq            <c-g>u\vartheta
  autocmd Filetype markdown,rmd inoremap <buffer> `vr            <c-g>u\varrho
  autocmd Filetype markdown,rmd inoremap <buffer> `8             <c-g>u\infty
augroup end

" Section hedding -> delete until any letter €
"nnoremap <leader>hh d/\a<cr>\hyssBi\section<esc>
nnoremap <leader>hh d/\a<cr>C\section{}<esc>P<cr>:noh<cr>
nnoremap <leader>2h d/\a<cr>\hyssBi\subsection<esc>
nnoremap <leader>3h d/\a<cr>\hyssBi\subsubsection<esc>
"map <leader>d O\begin{equation}
" ¥ 
" ¥

"Make a figure using the original title €
"map ;lf dwd/\a<cr>0Di\begin{figure}[H]<cr>\centering<cr>\caption{}<cr>\includegraphics[width=1.0 \textwidth]{}<cr>\label{<++>}<cr>\end{figure}<enter><++><esc><leader>h4kf{pjf/a
" map ;lf <c-g>df:Di\begin{figure}[H]<cr>\centering<cr>\caption{}<cr>\includegraphics[width=0.5 \textwidth]{}<cr>\label{<++>}<cr>\end{figure}<enter><++><esc><leader>h4kf{pj$i
  " ¥

" Formatar texto €
"map <localleader> \
"nnoremap <leader> ;
" nnoremap ;f vipgqvip<>>
nnoremap Q gqq
" ¥

" How to autocomplete whole numbers including dots and commas €
" Autocomplition following the previeus word and suggest plurals and
" gender and grammar uhhhulll read my book to implement this top big
" project that desearves planning and time consultar cfd book in this
" topic ¥
"
hi Conceal ctermfg=109 guifg=#83a598 ctermbg=NONE guibg=NONE
" ¥

let g:coc_global_extensions = [
      \'coc-lists',
      \'coc-actions',
      \'coc-snippets',
      \
      \'coc-markdownlint',
      \'coc-clangd',
      \'coc-lua',
      \'coc-go',
      \'coc-pyright',
      \'coc-sumneko-lua',
      \
      \'coc-db',
      \'coc-json',
      \'coc-vimlsp',
      \'coc-yaml',
      \]

set signcolumn=yes

"tab补全
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"alt+空格唤出补全
inoremap <silent><expr> <A-space> coc#refresh()

"回车补全
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> [[ <Plug>(coc-diagnostic-prev)
nmap <silent> ]] <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" 查看帮助文档
nnoremap <silent> <leader>h :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" 重命名
nmap <leader>rn <Plug>(coc-rename)

" 格式化
nmap <silent> <leader>f :call CocActionAsync('format') <CR>


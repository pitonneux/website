let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/code/old_pitonneux
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 ~/.vimrc
badd +12 app/controllers/application_controller.rb
badd +22 app/policies/application_policy.rb
badd +1 ~/code/old_pitonneux
badd +27 ~/.vim/plugged/vim-obsession/doc/obsession.txt
badd +4 app/policies/page_policy.rb
badd +3 app/controllers/pages_controller.rb
badd +1 app/policies/pages_policy.rb
badd +2 spec/policies/page_policy_spec.rb
badd +0 spec/policies/application_policy_spec.rb
badd +1 spec/spec_helper.rb
badd +12 spec/rails_helper.rb
badd +0 spec/factories/users.rb
badd +0 db/schema.rb
badd +9 spec/controllers/pages_controller_spec.rb
badd +13 spec/controllers/application_controller_spec.rb
badd +0 spec/factories/events.rb
badd +1 app/controllers/events_controller.rb
badd +4 app/policies/event_policy.rb
badd +1 app/views/layouts/_nav.html.slim
badd +8 app/views/layouts/_header.html.slim
badd +0 config/locales/pages.en.yml
badd +0 app/assets/stylesheets/components/_flash.sass
badd +0 app/assets/stylesheets/base/variables.scss
badd +1 app/assets/stylesheets/components/_header.sass
badd +1 app/assets/javascripts/header.coffee
badd +0 app/assets/javascripts/homepage.coffee
badd +6 app/views/layouts/_home_nav.html.slim
badd +1 app/views/pages/_featured_event.html.slim
badd +0 spec/features/creating_an_event_spec.rb
argglobal
silent! argdel *
argadd app/policies/event_policy.rb
edit spec/policies/application_policy_spec.rb
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=3
setlocal fml=1
setlocal fdn=20
setlocal fen
1
normal! zo
7
normal! zo
11
normal! zo
let s:l = 11 - ((9 * winheight(0) + 24) / 49)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
11
normal! 0
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=atIc
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
let g:this_session = v:this_session
let g:this_obsession = v:this_session
let g:this_obsession_status = 2
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :

let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/code/pitonneux
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +2 app/views/messages/_new.html.slim
badd +1 app/views/shared/_error_messages.html.slim
badd +6 app/views/events/edit.html.slim
badd +1 app/views/devise/passwords/edit.html.slim
badd +2 app/views/events/_form.html.slim
badd +33 app/views/pages/home.html.slim
badd +9 app/controllers/messages_controller.rb
badd +1 app/assets/stylesheets/components/_flash.sass
badd +1 app/views/messages/fail.js.erb
badd +1 app/views/pages/_contact_form.html.slim
badd +1 app/views/messages/new.html.slim
badd +40 config/locales/pages.en.yml
badd +10 config/locales/messages.en.yml
badd +11 app/helpers/application_helper.rb
badd +1 spec/helpers/application_helper_spec.rb
badd +1 config/initializers/kill_field_with_errors_wrapper.rb
badd +46 app/assets/stylesheets/components/_forms.sass
badd +1 app/assets/stylesheets/base/variables.scss
badd +1 Gemfile
badd +178 app/assets/stylesheets/pages/homepage.sass
badd +3 config/routes.rb
badd +1 app/views/messages/create.js.erb
badd +1 app/views/messages/success.js.erb
badd +1 app/views/messages/new.js.erb
badd +1 app/views/messages/thanks.js.erb
badd +1 app/views/messages/_created.html.slim
badd +1 app/assets/stylesheets/base/layout.sass
badd +3 spec/features/sending_a_message_spec.rb
badd +1 jo
badd +1 spec/spec_helper.rb
badd +30 spec/rails_helper.rb
badd +1 app/views/messages/_thanks.html.slim
badd +33 spec/controllers/messages_controller_spec.rb
badd +1 app/assets/javascripts/application.js
badd +1 app/assets/javascripts/expander.coffee
badd +1 app/assets/javascripts/header.coffee
badd +1 app/assets/javascripts/homepage.coffee
badd +1 app/assets/javascripts/messages.coffee
badd +1 app/assets/stylesheets/base/defaults.sass
badd +1 app/assets/stylesheets/base/mixins.sass
badd +1 app/assets/stylesheets/application.sass
badd +1 app/assets/stylesheets/messages.scss
badd +1 app/assets/stylesheets/registrations.scss
badd +1 app/helpers/events_helper.rb
badd +1 app/helpers/locations_helper.rb
badd +1 app/helpers/messages_helper.rb
badd +1 app/helpers/organizations_helper.rb
badd +1 app/helpers/pages_helper.rb
badd +1 app/helpers/registrations_helper.rb
badd +1 app/models/application_record.rb
badd +7 app/models/event.rb
badd +1 app/models/message.rb
badd +7 app/models/organization.rb
badd +9 app/models/user.rb
badd +19 app/views/events/_event.html.slim
badd +10 app/views/events/index.html.slim
badd +1 app/views/events/show.html.slim
badd +1 app/views/layouts/_footer.html.slim
badd +1 app/views/layouts/_header.html.slim
badd +1 app/views/layouts/_home_nav.html.slim
badd +1 app/views/pages/about.html.slim
badd +1 spec/helpers/events_helper_spec.rb
badd +1 spec/helpers/pages_helper_spec.rb
badd +1 spec/helpers/registrations_helper_spec.rb
badd +1 spec/requests/events_spec.rb
badd +1 spec/routing/events_routing_spec.rb
badd +1 spec/routing/locations_routing_spec.rb
badd +1 spec/views/organizations/create.html.slim_spec.rb
badd +1 spec/views/events/create.html.slim_spec.rb
badd +1 tmp/pids/server.pid
badd +1 tmp/rspec_examples.txt
badd +1 app/mailers/message_mailer.rb
badd +2 spec/mailers/message_mailer_spec.rb
badd +30 config/locales/en.yml
badd +1 config/application.rb
badd +1 app/config/locales/mailers.en.yml
badd +1 app/config/mailers.en.yml
badd +6 config/locales/mailer.en.yml
badd +39 config/environments/production.rb
badd +1 config/environments/test.rb
badd +20 config/environments/development.rb
badd +1 config/environment.rb
badd +1 config/secrets.yml
badd +3 app/mailers/application_mailer.rb
badd +5 app/views/layouts/mailer.html.slim
badd +4 app/views/message_mailer/send_to_admin.html.slim
badd +1 app/views/message_mailer/send_to_admin.text.slim
badd +3 spec/mailers/previews/message_mailer_preview.rb
badd +1 README.md
badd +1 ~/.vimrc
badd +1 spec/factories/messages.rb
badd +1 app/assets/stylesheets/components/_card.sass
badd +1 app/assets/stylesheets/components/_footer.sass
badd +1 app/assets/stylesheets/pages/indexes.sass
badd +1 app/views/layouts/application.html.slim
badd +1 app/views/layouts/mailer/_style.html
badd +1 features/sessions.feature
badd +1 spec/features/sessions_spec.rb
badd +1 spec/factories/users.rb
badd +8 spec/support/sign_in_helpers.rb
badd +22 spec/features/creating_an_event_spec.rb
badd +62 app/controllers/events_controller.rb
badd +1 spec/controllers/events_controller_spec.rb
badd +17 app/controllers/application_controller.rb
badd +1 app/policies/event_policy.rb
badd +1 spec/policies/event_policy_spec.rb
badd +1 app/policies/application_policy.rb
badd +1 app/views/layouts/_nav.html.slim
badd +3 spec/features/registrations/user_changes_password_spec.rb
badd +1 spec/support/features/sign_in_helpers.rb
badd +1 spec/support/features/select_date_helpers.rb
badd +4 spec/controllers/registrations_controller_spec.rb
badd +1 spec/features/user_changes_password_spec.rb
badd +1 spec/features/registrations/sign_up_spec.rb
badd +1 app/policies/page_policy.rb
badd +1 spec/policies/application_policy_spec.rb
badd +1 spec/controllers/application_controller_spec.rb
badd +4 spec/factories/events.rb
badd +1 db/schema.rb
badd +2 spec/models/event_spec.rb
badd +1 config/locales/events.en.yml
badd +2 app/controllers/locations_controller.rb
badd +1 spec/controllers/locations_controller_spec.rb
badd +1 spec/support/controllers/shared_examples.rb
badd +1 spec/support/controllers/shared_contexts.rb
badd +0 spec/factories/locations.rb
badd +5 app/models/location.rb
badd +1 spec/models/location_spec.rb
badd +13 config/locales/locations.en.yml
badd +48 app/controllers/organizations_controller.rb
badd +1 spec/controllers/organizations_controller_spec.rb
badd +0 spec/factories/organizations.rb
badd +4 spec/models/organization_spec.rb
badd +1 app/views/locations/show.html.slim
badd +13 config/locales/organizations.en.yml
badd +0 spec/support/controllers/shared_expectations.rb
badd +0 script/cucumber
badd +2 app/controllers/pages_controller.rb
badd +4 spec/routing/organizations_routing_spec.rb
badd +1 spec/requests/locations_spec.rb
badd +1 spec/models/user_spec.rb
badd +0 spec/models/message_spec.rb
badd +7 spec/controllers/pages_controller_spec.rb
badd +1 spec/features/listing_events_spec.rb
badd +10 spec/features/creating_an_organization_spec.rb
badd +4 app/policies/organization_policy.rb
badd +4 spec/policies/organization_policy_spec.rb
badd +0 app/assets/stylesheets/components/_buttons.sass
badd +23 app/assets/stylesheets/pages/events.sass
badd +0 spec/views/events/_event.html.slim
badd +1 spec/routing/registrations_routing_spec.rb
badd +0 app/controllers/registrations_controller.rb
badd +1 spec/routing/devise_routing_spec.rb
badd +1 spec/routing/sessions_routing_spec.rb
badd +19 spec/routing/passwords_routing_spec.rb
argglobal
silent! argdel *
argadd spec/routing/passwords_routing_spec.rb
edit config/routes.rb
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
let s:l = 3 - ((2 * winheight(0) + 24) / 49)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
3
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

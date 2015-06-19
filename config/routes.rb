Rails.application.routes.draw do

  resources :item_answers

  resources :solved_exams

  resources :items

  resources :exams

  root 'pages#home'

  get '/user_exams', :to => 'pages#user_exams'

  get '/created_user_exams', :to => 'exams#user_exams_index'

  get '/items/:id/correct_option', :to => 'items#get_correct_option'

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks", :sessions => "users/sessions", :registrations => "users/registrations"}
end

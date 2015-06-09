Rails.application.routes.draw do

  resources :item_answers

  resources :solved_exams

  resources :items

  resources :exams

  root 'pages#home'

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks", :sessions => "users/sessions", :registrations => "users/registrations"}
end

Rails.application.routes.draw do

  root 'pages#home'

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks", :sessions => "users/sessions", :registrations => "users/registrations"}
end

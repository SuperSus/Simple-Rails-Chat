Rails.application.routes.draw do
  root 'rooms#index'
  devise_for :users
  resources :room_messages
  resources :rooms
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get "homes/about" => 'homes#show'
  resources :books
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

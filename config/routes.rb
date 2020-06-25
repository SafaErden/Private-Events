Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:index, :signin]
  root to: "sessions#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

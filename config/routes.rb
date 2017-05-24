Rails.application.routes.draw do
  root "dashboards#index"

  resources :dashboards, only: [:index]

  resources :users, only: [:new, :show, :create, :index]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
